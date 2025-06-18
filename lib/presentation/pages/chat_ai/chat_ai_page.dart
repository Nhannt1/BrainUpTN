import 'dart:io';

import 'package:brainup/domain/repository/source/gemini_service.dart';
import 'package:brainup/presentation/pages/chat_ai/widgets/bot_avatar.dart';
import 'package:brainup/presentation/pages/chat_ai/widgets/bot_massage.dart';
import 'package:brainup/presentation/pages/chat_ai/widgets/chat_input.dart';
import 'package:brainup/presentation/pages/chat_ai/widgets/chat_option.dart';
import 'package:brainup/presentation/pages/chat_ai/widgets/message_model.dart';
import 'package:brainup/presentation/pages/chat_ai/widgets/select_image_pre.dart';
import 'package:brainup/presentation/pages/chat_ai/widgets/sugges_action.dart';
import 'package:brainup/presentation/pages/chat_ai/widgets/user_massage.dart';
import 'package:brainup/presentation/pages/home/home_page.dart';
import 'package:drift/drift.dart' as drift;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../../../domain/ai_entity/app_database.dart';

class ChatAiPage extends StatefulWidget {
  const ChatAiPage({super.key});
  static const rootLocation = '/ChatAiPage';

  @override
  State<ChatAiPage> createState() => _ChatAiPageState();
}

class _ChatAiPageState extends State<ChatAiPage> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _voicecontroller = TextEditingController();
  final List<MessageModel> _messages = [];
  final ScrollController _scrollController = ScrollController();
  File? _selectedImage;
  final GeminiService _gemini = GeminiService();
  bool isTyping = false;
  late AppDatabase _db;
  late String _userId;
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _voiceText = "";

  @override
  void initState() {
    super.initState();
    _db = AppDatabase();
    _userId = FirebaseAuth.instance.currentUser?.uid ?? 'guest';
    _loadMessages();
    _speech = stt.SpeechToText();
  }

  void _stopListening() {
    _speech.stop();
    setState(() {
      _isListening = false;
    });
  }

  void _startVoiceInput() async {
    final micStatus = await Permission.microphone.request();

    if (micStatus != PermissionStatus.granted) {
      print("Microphone permission denied");
      return;
    }
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('STATUS: $val'),
        onError: (val) => print('ERROR: $val'),
      );

      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) {
            setState(() {
              _voiceText = val.recognizedWords;
              _controller.text = _voiceText;
            });

            if (val.finalResult) {
              _sendMessageFromVoice(_voiceText);
              _speech.stop();
              setState(() => _isListening = false);
            }
          },
          localeId: 'vi_VN',
        );
      } else {}
    } else {
      _speech.stop();
      setState(() => _isListening = false);
    }
  }

  void _sendMessageFromVoice(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      _voicecontroller.text = text;
    });

    setState(() => _isListening = false);
    _controller.clear();
  }

  Future<void> _saveMessage({
    required String text,
    required String time,
    required bool isUser,
    String? imagePath,
  }) async {
    await _db.insertMessage(MessagesCompanion(
      userId: drift.Value(_userId),
      textMessage: drift.Value(text),
      time: drift.Value(time),
      isUser: drift.Value(isUser),
      imagePath: drift.Value(imagePath),
    ));
  }

  void _loadMessages() async {
    final dbMessages = await _db.getMessages(_userId);
    setState(() {
      _messages.addAll(dbMessages.map((e) => MessageModel(
            text: e.textMessage,
            time: e.time,
            imageFile: e.imagePath != null ? File(e.imagePath!) : null,
            isUser: e.isUser,
          )));
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
  }

  void _sendMessage() async {
    final text = _controller.text.trim();
    final File? imageToSend = _selectedImage;
    if (text.isEmpty && _selectedImage == null) return;

    setState(() {
      _messages.add(MessageModel(
        text: text,
        time: TimeOfDay.now().format(context),
        imageFile: _selectedImage,
        isUser: true,
      ));
      isTyping = true;
    });
    await _saveMessage(
      text: text,
      time: TimeOfDay.now().format(context),
      isUser: true,
      imagePath: imageToSend?.path,
    );
    _controller.clear();
    _selectedImage = null;

    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
    try {
      final botReply = await _gemini.generateSmart(
          prompt: text, imageFile: imageToSend, messages: _messages);
      setState(() {
        _messages.add(MessageModel(
            text: botReply,
            time: TimeOfDay.now().format(context),
            imageFile: null,
            isUser: false));
        isTyping = false;

        _selectedImage = null;
      });
      await _saveMessage(
        text: botReply,
        time: TimeOfDay.now().format(context),
        isUser: false,
        imagePath: null,
      );
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
    } catch (e) {
      _messages.add(MessageModel(
        text: "Lỗi: $e",
        time: TimeOfDay.now().format(context),
        imageFile: null,
        isUser: false,
      ));
      isTyping = false;
      _selectedImage = null;
    }
  }

  void _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _selectedImage = File(picked.path);
      });
    }
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("BrAInUp", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Personal Learning Assistant", style: TextStyle(fontSize: 12)),
          ],
        ),
        leading: InkWell(
            onTap: () => context.go(Home.rootLocation),
            child: Icon(Icons.arrow_back)),
        actions: [
          ChatOptionsMenu(
            db: _db,
            userId: _userId,
            onClearChat: () {
              setState(() {
                _messages.clear();
              });
            },
          ),
        ],
      ),
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  itemCount: _messages.length + (isTyping ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (isTyping && index == _messages.length) {
                      return TypingIndicatorBubble();
                    }
                    final msg = _messages[index];
                    return msg.isUser
                        ? UserMessage(
                            text: msg.text,
                            time: msg.time,
                            imageFile: msg.imageFile,
                          )
                        : BotMessage(
                            text: msg.text,
                            time: msg.time,
                            imageFile: msg.imageFile,
                          );
                  },
                ),
              ),
              if (_selectedImage != null)
                SelectedImagePreview(
                  selectedImage: _selectedImage!,
                  onSendPressed: _sendMessage,
                  onCancelPressed: () {
                    setState(() {
                      _selectedImage = null;
                      _controller.clear();
                    });
                  },
                )
              else
                SuggestedActions(
                  messages: _messages,
                  onSuggestionTap: (suggestionText) {
                    setState(() {
                      _controller.text = suggestionText;
                    });
                    _sendMessage();
                  },
                ),
              ChatInputBar(
                controller: _controller,
                onSend: _sendMessage,
                onPickImage: _pickImage,
                onVoiceInput: _startVoiceInput,
                onStopListening: () {
                  _stopListening();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

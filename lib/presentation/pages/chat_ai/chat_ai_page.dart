import 'package:brainup/presentation/base/povider_chat_ai/ai_chat_provider.dart';
import 'package:brainup/presentation/pages/chat_ai/widgets/bot_avatar.dart';
import 'package:brainup/presentation/pages/chat_ai/widgets/bot_massage.dart';
import 'package:brainup/presentation/pages/chat_ai/widgets/chat_input.dart';
import 'package:brainup/data/service/ai_chat/chat_option.dart';
import 'package:brainup/domain/model_ai/message_model.dart';
import 'package:brainup/presentation/pages/chat_ai/widgets/select_image_pre.dart';
import 'package:brainup/presentation/pages/chat_ai/widgets/sugges_action.dart';
import 'package:brainup/presentation/pages/chat_ai/widgets/user_massage.dart';
import 'package:brainup/presentation/base/povider_chat_ai/voice_input_controller.dart';
import 'package:brainup/presentation/pages/home/home_page.dart';
import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:go_router/go_router.dart';

class PageAi extends ConsumerStatefulWidget {
  const PageAi({super.key});
  static const rootLocation = '/ChatAi';

  @override
  ConsumerState<PageAi> createState() => _PageAiState();
}

class _PageAiState extends ConsumerState<PageAi> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController textController = TextEditingController();
  late final ProviderSubscription<List<MessageModel>> _removeListener;
  final GlobalKey<SuggestedActionsState> _suggestedKey =
      GlobalKey<SuggestedActionsState>();
  bool showScrollDownButton = false;
  FlutterTts flutterTts = FlutterTts();
  @override
  void initState() {
    super.initState();
    _removeListener = ref.listenManual<List<MessageModel>>(chatMessagesProvider,
        (prev, next) {
      if (prev?.length != next.length) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_scrollController.hasClients) {
            _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOut,
            );
          }
        });
      }
    });
    ref.listenManual<String>(voiceTextProvider, (prev, next) {
      if (next.isNotEmpty && textController.text.isEmpty) {
        textController.text = next;
      }
      if (next.isEmpty && textController.text.isNotEmpty) {
        textController.clear();
      }
    });
    _scrollController.addListener(() {
      final isAtBottom = _scrollController.offset >=
          _scrollController.position.maxScrollExtent - 50;

      if (showScrollDownButton == isAtBottom) {
        setState(() {
          showScrollDownButton = !isAtBottom;
        });
      }
    });
  }

  @override
  void dispose() {
    _removeListener.closed;
    _scrollController.dispose();
    textController.dispose();
    FlutterTts().stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final message = ref.watch(chatMessagesProvider);
    final controller = ref.read(chatMessagesProvider.notifier);

    final selectedImage = ref.watch(selectImageProvider);
    final isTyping = ref.watch(isTypingProvider);
    final voiceText = ref.watch(voiceTextProvider);

    return Stack(children: [
      Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("BrAInUp", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("Personal Learning Assistant",
                  style: TextStyle(fontSize: 12)),
            ],
          ),
          leading: InkWell(
              onTap: () async {
                context.go(Home.rootLocation);
                await flutterTts.stop();
              },
              child: Icon(Icons.arrow_back)),
          actions: [
            ChatOptionsMenu(
              onClearChat: () {
                ref.watch(chatMessagesProvider.notifier).clearMessage();
              },
            ),
          ],
        ),
        body: GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: SafeArea(
              child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    controller: _scrollController,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    itemCount: message.length + (isTyping ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (isTyping && index == message.length) {
                        return TypingIndicatorBubble();
                      }
                      final msg = message[index];
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
                    }),
              ),
              if (selectedImage != null)
                SelectedImagePreview(
                  selectedImage: selectedImage,
                  onSendPressed: () {
                    controller.sendMessage(textController.text, context,
                        selectedImage: selectedImage);
                    ref.read(selectImageProvider.notifier).state = null;
                    textController.clear();
                  },
                  onCancelPressed: () {
                    ref.read(selectImageProvider.notifier).state = null;
                    textController.clear();
                  },
                )
              else
                SuggestedActions(
                  key: _suggestedKey,
                  messages: List.from(message),
                  onSuggestionTap: (suggestionText) {
                    setState(() {
                      textController.text = suggestionText;
                    });
                    controller.sendMessage(
                      textController.text,
                      context,
                      onBotDone: () {
                        _suggestedKey.currentState?.fetchSuggestions();
                      },
                    );
                    textController.clear();
                  },
                ),
              ChatInputBar(
                controller: textController,
                onSend: () {
                  final inputText = textController.text.trim();
                  final textToSend = inputText.isNotEmpty
                      ? inputText
                      : (voiceText.isNotEmpty ? voiceText : '');

                  if (textToSend.isEmpty) return;
                  controller.sendMessage(
                    textToSend,
                    context,
                    selectedImage: selectedImage,
                    onBotDone: () {
                      _suggestedKey.currentState?.fetchSuggestions();
                    },
                  );

                  textController.clear();
                },
                onPickImage: () => controller.pickImage(),
                onVoiceInput: () async {
                  await ref
                      .read(voiceInputControllerProvider)
                      .startListening(context, textController);
                },
                onStopListening: () {
                  ref
                      .read(voiceInputControllerProvider)
                      .stopListening(context, textController);
                },
              ),
            ],
          )),
        ),
      ),
      Positioned(
        bottom: 200,
        right: 1,
        child: showScrollDownButton
            ? FloatingActionButton(
                mini: true,
                backgroundColor: AppColors.athensGray,
                shape: const CircleBorder(),
                onPressed: () {
                  _scrollController.animateTo(
                    _scrollController.position.maxScrollExtent,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeOut,
                  );
                },
                child: Icon(Icons.arrow_downward),
              )
            : SizedBox.shrink(),
      )
    ]);
  }
}

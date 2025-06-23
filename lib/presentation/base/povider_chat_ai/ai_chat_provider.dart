import 'dart:io';

import 'package:brainup/data/source/local/app_database.dart';
import 'package:brainup/data/source/remote/gemini_service.dart';
import 'package:brainup/domain/model_ai/message_model.dart';
import 'package:drift/drift.dart';
import 'package:drift/drift.dart' as drift;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final chatMessagesProvider =
    StateNotifierProvider<ChatMessagesNotifier, List<MessageModel>>((ref) {
  return ChatMessagesNotifier(ref);
});

class ChatMessagesNotifier extends StateNotifier<List<MessageModel>> {
  final Ref ref;
  final AppDatabase db = AppDatabase();
  final GeminiService gemini = GeminiService();
  final String userId = FirebaseAuth.instance.currentUser?.uid ?? 'guest';
  File? selectedImage;
  bool isTyping = false;

  ChatMessagesNotifier(this.ref) : super([]) {
    loadMessage();
  }

  Future<void> loadMessage() async {
    final messages = await db.getMessages(userId);
    state = messages
        .map(
          (e) => MessageModel(
              text: e.textMessage,
              time: e.time,
              isUser: e.isUser,
              imageFile: e.imagePath != null ? File(e.imagePath!) : null),
        )
        .toList();
  }

  Future<void> sendMessage(
    String text,
    BuildContext context, {
    File? selectedImage,
    VoidCallback? onBotDone,
  }) async {
    if (text.trim().isEmpty && selectedImage == null) return;
    state = [
      ...state,
      MessageModel(
          text: text,
          time: TimeOfDay.now().format(context),
          isUser: true,
          imageFile: selectedImage),
    ];
    ref.read(selectImageProvider.notifier).state = null;
    ref.read(isTypingProvider.notifier).state = true;
    await db.insertMessage(MessagesCompanion(
        userId: drift.Value(userId),
        textMessage: Value(text),
        time: Value(TimeOfDay.now().format(context)),
        isUser: Value(true),
        imagePath: Value(selectedImage?.path)));

    final botReply = await gemini.generateSmart(prompt: text, messages: state);
    final BotMessage = MessageModel(
        text: botReply,
        time: TimeOfDay.now().format(context),
        isUser: false,
        imageFile: null);
    state = [...state, BotMessage];
    ref.read(isTypingProvider.notifier).state = false;

    await db.insertMessage(MessagesCompanion(
      userId: drift.Value(userId),
      textMessage: drift.Value(botReply),
      time: drift.Value(TimeOfDay.now().format(context)),
      isUser: drift.Value(false),
    ));
    selectedImage = null;
    if (onBotDone != null) onBotDone();
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      ref.read(selectImageProvider.notifier).state = File(picked.path);
    }
  }

  void clearMessage() async {
    await db.deleteMessages(userId);
    state = [];
  }
}

final isListeningProvider = StateProvider<bool>((ref) => false);
final voidTextProvider = StateProvider<String>((ref) => "");
final googleServiceProvider = StateProvider((ref) => GeminiService());
final isTypingProvider = StateProvider<bool>((ref) => false);
final selectImageProvider = StateProvider<File?>((ref) => null);
final suggestionProvider = StateProvider<List<String>>((ref) => []);

import 'package:brainup/presentation/base/povider_chat_ai/ai_chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

final voiceTextProvider = StateProvider<String>((ref) => '');
final isListeningProvider = StateProvider<bool>((ref) => false);
final navigatorKeyProvider = Provider<GlobalKey<NavigatorState>>((ref) {
  return GlobalKey<NavigatorState>();
});
final voiceInputControllerProvider =
    Provider<VoiceInputController>((ref) => VoiceInputController(ref));

class VoiceInputController {
  final Ref ref;
  final stt.SpeechToText _speech = stt.SpeechToText();

  VoiceInputController(this.ref);

  Future<void> startListening(
      BuildContext context, TextEditingController textController) async {
    final micStatus = await Permission.microphone.request();
    if (micStatus != PermissionStatus.granted) {
      return;
    }

    final isListening = ref.read(isListeningProvider);
    if (isListening) {
      stopListening(context, textController);
      return;
    }

    bool available = await _speech.initialize(
      onStatus: (val) => print('STATUS: $val'),
      onError: (val) => print('ERROR: $val'),
    );
    if (available) {
      ref.read(isListeningProvider.notifier).state = true;
      _speech.listen(
        localeId: 'vi_VN',
        onResult: (val) async {
          if (val.finalResult) {
            final finalText = val.recognizedWords.trim();
            if (finalText.isNotEmpty) {
              ref.read(voiceTextProvider.notifier).state = finalText;
              await Future.delayed(const Duration(milliseconds: 100));
              stopListening(context, textController, overrideText: finalText);
            }
          }
        },
      );
    }
  }

  void stopListening(
    BuildContext context,
    TextEditingController textController, {
    String? overrideText,
  }) {
    _speech.stop();
    ref.read(isListeningProvider.notifier).state = false;

    final text = overrideText?.trim() ?? ref.read(voiceTextProvider).trim();

    if (text.isNotEmpty) {
      ref.read(chatMessagesProvider.notifier).sendMessage(
            text,
            context,
            onBotDone: () {},
          );

      ref.read(voiceTextProvider.notifier).state = '';
      textController.clear();
    }
  }
}

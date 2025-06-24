import 'dart:io';

import 'package:brainup/data/service/ai_chat/text_speed_bot.dart';
import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class BotMessage extends StatefulWidget {
  final String text;
  final String time;
  final File? imageFile;
  const BotMessage(
      {required this.text,
      required this.time,
      super.key,
      required this.imageFile});

  @override
  State<BotMessage> createState() => _BotMessageState();
}

class _BotMessageState extends State<BotMessage> {
  final tts = TextToSpeechService();
  late stt.SpeechToText _speech;
  bool isSpeaking = false;

  void _handleTTS() async {
    if (isSpeaking) {
      await tts.stop();
      setState(() {
        isSpeaking = false;
      });
    } else {
      await tts.speak(widget.text);
      setState(() {
        isSpeaking = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.h, right: 20.w, left: 12.w),
      child: Align(
        alignment: Alignment.centerLeft,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.8.w,
          ),
          child: IntrinsicWidth(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.imageFile != null) ...[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image.file(
                        widget.imageFile!,
                        width: 150.w,
                        height: 150.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 8.h),
                  ],
                  Text(widget.text),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Text(widget.time, style: TextStyle(fontSize: 10.h)),
                      SizedBox(width: 5.w),
                      Spacer(),
                      InkWell(
                        onTap: _handleTTS,
                        child: Icon(
                          FontAwesomeIcons.volumeHigh,
                          size: 12.sp,
                          color: AppColors.grayChateau,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

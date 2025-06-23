import 'package:brainup/data/service/ai_chat/toggle_btn.dart';
import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatInputBar extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback onPickImage;
  final VoidCallback onVoiceInput;
  final VoidCallback? onStopListening;
  const ChatInputBar({
    super.key,
    required this.controller,
    required this.onSend,
    required this.onVoiceInput,
    required this.onPickImage,
    required this.onStopListening,
  });

  @override
  State<ChatInputBar> createState() => _ChatInputBarState();
}

enum InputMode { text, voice }

class _ChatInputBarState extends State<ChatInputBar> {
  InputMode selected = InputMode.text;
  bool _isListening = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.athensGray1),
          borderRadius: BorderRadius.only(),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              child: Row(
                children: [
                  Text("Input",
                      style: BrainUpTextStyles.text12Normal
                          .copyWith(color: AppColors.grayChateau)),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        children: [
                          Row(children: [
                            ToggleButton(
                              label: 'Text',
                              icon: Icons.keyboard,
                              selected: selected == InputMode.text,
                              isLeft: true,
                              onPressed: () {
                                setState(() {
                                  selected = InputMode.text;
                                });
                              },
                            ),
                            ToggleButton(
                              label: 'Voice',
                              icon: Icons.mic,
                              selected: selected == InputMode.voice,
                              isLeft: false,
                              onPressed: () {
                                setState(() {
                                  selected = InputMode.voice;
                                });
                              },
                            ),
                          ]),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.black,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5.w),
                        child: Icon(Icons.accessibility_new,
                            color: AppColors.white, size: 20.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: widget.onPickImage,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.athensGray1,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.w),
                        child: Icon(Icons.attach_file,
                            size: 24.sp, color: AppColors.grayChateau),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: selected == InputMode.text
                        ? TextField(
                            controller: widget.controller,
                            textInputAction: TextInputAction.send,
                            onSubmitted: (_) {},
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 9.h,
                                horizontal: 12.w,
                              ),
                              fillColor: AppColors.grayChateau,
                              filled: true,
                              hintText: "Type your message...",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                                borderSide:
                                    BorderSide(color: AppColors.grayChateau),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                                borderSide:
                                    BorderSide(color: AppColors.grayChateau),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                                borderSide: BorderSide(
                                  color: AppColors.grayChateau,
                                ),
                              ),
                            ),
                            style: BrainUpTextStyles.text16Normal
                                .copyWith(color: AppColors.black),
                          )
                        : InkWell(
                            onTap: () {
                              setState(() {
                                _isListening = !_isListening;
                              });
                              widget.onVoiceInput();
                            },
                            child: Container(
                              height: 40.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColors.athensGray1,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.mic,
                                    color: _isListening
                                        ? Colors.red
                                        : AppColors.grayChateau,
                                  ),
                                  SizedBox(width: 8.w),
                                  Text(
                                    _isListening ? "Listening" : "",
                                    style: BrainUpTextStyles.text16Normal
                                        .copyWith(color: AppColors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ),
                  SizedBox(width: 8.w),
                  InkWell(
                    onTap: () {
                      if (selected == InputMode.text) {
                        if (widget.controller.text.trim().isNotEmpty) {
                          widget.onSend();
                          widget.controller.clear();
                        }
                      } else if (selected == InputMode.voice) {
                        widget.onSend();
                        widget.onStopListening?.call();
                        setState(() {
                          _isListening = false;
                        });
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.dodgerblue,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(12.w),
                        child: Icon(
                          Icons.send,
                          size: 20.sp,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

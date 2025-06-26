// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:brainup/presentation/resources/gen/colors.gen.dart';

class MainQuizWidget extends StatelessWidget {
  final String questionText;
  final TextEditingController controller;
  final VoidCallback onSubmit;
  final VoidCallback onSkip;
  final String correctAnswer;
  final String resultStatus;
  final bool showResult;
  final VoidCallback ontaplisten;
  final VoidCallback ontapSpeak;
  final bool isListening;
  const MainQuizWidget({
    Key? key,
    required this.questionText,
    required this.controller,
    required this.onSubmit,
    required this.onSkip,
    required this.correctAnswer,
    required this.resultStatus,
    required this.showResult,
    required this.ontaplisten,
    required this.ontapSpeak,
    required this.isListening,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  AppColors.periwinkle,
                  AppColors.onahau,
                  AppColors.cornflowerBlue
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 0.5, 1.0],
              )),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Center(
                  child: FaIcon(
                    FontAwesomeIcons.robot,
                    size: 35,
                    color: AppColors.cornflowerBlue,
                  ),
                ),
              ),
              Positioned(
                bottom: 5,
                right: 125,
                child: GestureDetector(
                  onTap: ontaplisten,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                        child: FaIcon(
                          FontAwesomeIcons.volumeHigh,
                          size: 12.sp,
                          color: AppColors.cerulean,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: AppColors.athensGray1,
                blurRadius: 3,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 19),
            child: Text(
              questionText,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        if (showResult) ...[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(height: 12),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text("Result",
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                  Text(resultStatus,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: resultStatus.toLowerCase() == 'đúng'
                              ? Colors.green
                              : Colors.red)),
                ],
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "Correct answer",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    Text(correctAnswer,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue)),
                  ],
                ),
              ),
            ],
          ),
        ],
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.athensGray1,
                  hintText: 'Type your answer...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),
            GestureDetector(
              onTap: ontapSpeak,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.onahau),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: FaIcon(
                    FontAwesomeIcons.microphone,
                    color:
                        isListening ? AppColors.cinnabar : AppColors.cerulean,
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton.icon(
              onPressed: () {
                onSkip();
              },
              icon: const Icon(
                Icons.fast_forward,
                color: AppColors.paleSky,
              ),
              label: const Text("Skip",
                  style: TextStyle(fontSize: 12, color: AppColors.paleSky)),
            ),
            InkWell(
              onTap: () {
                onSubmit();
              },
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade400,
                          blurRadius: 2,
                          offset: Offset(0, 2))
                    ],
                    gradient: LinearGradient(
                      colors: [
                        AppColors.cornflowerBlue,
                        AppColors.brightTurquoise
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Center(
                    child: Row(
                      children: [
                        Text(
                          'Submit ',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                        Icon(
                          FontAwesomeIcons.arrowRight,
                          size: 14,
                          color: AppColors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

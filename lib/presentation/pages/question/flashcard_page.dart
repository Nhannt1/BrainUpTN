import 'package:brainup/presentation/pages/home/home_page.dart';
import 'package:brainup/presentation/pages/question/widgets/answer_btn.dart';
import 'package:brainup/presentation/pages/question/widgets/btn_widget.dart';
import 'package:brainup/presentation/pages/question/widgets/deckinfosection.dart';
import 'package:brainup/presentation/pages/question/widgets/flash_card.dart';
import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class QuestionAi extends StatelessWidget {
  const QuestionAi({super.key});
  static const rootLocation = "/QuestionAi";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              context.go(Home.rootLocation);
            },
            child: Icon(
              FontAwesomeIcons.brain,
              color: AppColors.royalBlue,
            )),
        title: Text('BrAInUp',
            style: BrainUpTextStyles.text20Bold
                .copyWith(color: AppColors.governorbay)),
        actions: [
          IconButton(
            icon: Icon(
              Icons.nightlight_round,
              color: AppColors.royalBlue,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          children: [
            DeckInfoSection(
              currentQuestion: 4,
              totalQuestions: 10,
            ),
            SizedBox(
              height: 20.h,
            ),
            Flashcard(),
            SizedBox(
              height: 20.h,
            ),
            AnswerButtons(),
            SizedBox(
              height: 12.h,
            ),
            BtnWidget()
          ],
        ),
      )),
    );
  }
}

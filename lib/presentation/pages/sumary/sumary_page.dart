import 'package:brainup/presentation/pages/home/home_page.dart';
import 'package:brainup/presentation/pages/sumary/widgets/btn_sumary.dart';

import 'package:brainup/presentation/pages/sumary/widgets/format_language.dart';
import 'package:brainup/presentation/pages/sumary/widgets/input_section.dart';
import 'package:brainup/presentation/pages/sumary/widgets/sumary_box.dart';
import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class SumaryPage extends StatelessWidget {
  SumaryPage({super.key});
  static const rootLocation = "/SumaryPage";
  final TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () => context.go(Home.rootLocation),
            child: Icon(Icons.school, color: AppColors.royalBlue)),
        title: Text(
          'Smart Summarizer',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputSectionWidget(controller: inputController),
                SizedBox(height: 20.h),
                SummaryOptions(),
                SizedBox(height: 20.h),
                BtnSumary(),
                SizedBox(height: 20.h),
                SummaryBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

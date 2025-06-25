import 'package:brainup/presentation/pages/home/home_page.dart';
import 'package:brainup/presentation/pages/smart_ai_quizz/widget/adaptive.dart';
import 'package:brainup/presentation/pages/smart_ai_quizz/widget/main_quizz.dart';
import 'package:brainup/presentation/pages/smart_ai_quizz/widget/navigation_btn.dart';
import 'package:brainup/presentation/pages/smart_ai_quizz/widget/progress_bar_quizz.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SmartAiQuizz extends StatelessWidget {
  const SmartAiQuizz({super.key});
  static const rootLocation = "/SmartAiQuizz";
  @override
  Widget build(BuildContext context) {
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Smart AI Quiz", style: TextStyle(fontSize: 18)),
          leading: InkWell(
              onTap: () => context.go(Home.rootLocation),
              child: Icon(Icons.arrow_back)),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: CircleAvatar(
                radius: 18,
                backgroundImage:
                    NetworkImage('https://i.imgur.com/QCNbOAo.png'),
              ),
            )
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ProgressBarWidget(
                    currentQuestion: 2,
                    totalQuestions: 8,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  MainQuizWidget(),
                  SizedBox(
                    height: 25,
                  ),
                  Adaptive(),
                  // NavigationButtons()
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: isKeyboardOpen
            ? null
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: NavigationButtons(),
              ),
      ),
    );
  }
}

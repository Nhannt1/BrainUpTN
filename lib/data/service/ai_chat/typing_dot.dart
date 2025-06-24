import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TypingDots extends StatefulWidget {
  const TypingDots({super.key});

  @override
  State<TypingDots> createState() => _TypingDotsState();
}

class _TypingDotsState extends State<TypingDots>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> dotOne;
  late Animation<double> dotTwo;
  late Animation<double> dotThree;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();

    dotOne = Tween(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.6, curve: Curves.easeInOut),
      ),
    );
    dotTwo = Tween(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.2, 0.8, curve: Curves.easeInOut),
      ),
    );
    dotThree = Tween(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.4, 1.0, curve: Curves.easeInOut),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget dot(Animation<double> animation) => FadeTransition(
        opacity: animation,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: CircleAvatar(radius: 4, backgroundColor: AppColors.royalBlue),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Row(children: [dot(dotOne), dot(dotTwo), dot(dotThree)]);
  }
}

import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationButtons extends StatelessWidget {
  final VoidCallback ontapNext;
  final VoidCallback ontapPre;

  const NavigationButtons({
    super.key,
    required this.ontapNext,
    required this.ontapPre,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: ontapPre,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            backgroundColor: AppColors.athensGray1,
            foregroundColor: AppColors.paleSky,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            child: Row(
              children: [
                Icon(FontAwesomeIcons.chevronLeft),
                Text(
                  ' Prev',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ),
        ElevatedButton(
          onPressed: ontapNext,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            backgroundColor: AppColors.athensGray1,
            foregroundColor: AppColors.paleSky,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            child: Row(
              children: [
                Text('Next ', style: TextStyle(fontSize: 12)),
                Icon(FontAwesomeIcons.chevronRight),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:brainup/shared/utils/constants.dart';
import 'package:flutter/material.dart';

class ChammyToolbar extends StatelessWidget {
  const ChammyToolbar({
    super.key,
    this.onLeftIconPress,
    this.onRightIconPress,
    this.iconLeft,
    this.iconRight,
    this.iconSize,
    this.title,
  });

  final VoidCallback? onLeftIconPress;
  final VoidCallback? onRightIconPress;
  final Widget? iconLeft;
  final Widget? iconRight;
  final double? iconSize;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: onLeftIconPress,
          icon: iconLeft ??
              SizedBox(
                width: iconSize,
                height: iconSize,
              ),
        ),
        Text(title ?? empty, style: ChammyTextStyles.text16Bold),
        IconButton(
          onPressed: onRightIconPress,
          icon: iconRight ??
              SizedBox(
                width: iconSize,
                height: iconSize,
              ),
        )
      ],
    );
  }
}

import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:flutter/material.dart';

class ChammyGradientButton extends StatelessWidget {
  const ChammyGradientButton({
    super.key,
    required this.text,
    required this.colors,
    this.onPressed,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.textStyle,
    this.shape = BoxShape.rectangle,
    this.width,
    this.height,
    this.isEnableButton,
  });

  final String text;
  final List<Color> colors;
  final VoidCallback? onPressed;
  final BorderRadius borderRadius;
  final TextStyle? textStyle;
  final BoxShape shape;
  final double? width;
  final double? height;
  final bool? isEnableButton;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors:
              isEnableButton == true ? colors : [Colors.blueGrey, Colors.grey],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: shape == BoxShape.rectangle ? borderRadius : null,
        shape: shape,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: shape == BoxShape.rectangle ? borderRadius : null,
          onTap: isEnableButton == true ? onPressed : null,
          child: Container(
            alignment: Alignment.center,
            width: width,
            height: height,
            child: Text(
              text,
              style: textStyle ?? BrainUpTextStyles.text16Bold.copyWith(),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

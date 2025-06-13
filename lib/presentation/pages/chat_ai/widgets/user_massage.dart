import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:flutter/material.dart';

class UserMessage extends StatelessWidget {
  final String text;
  final String time;

  const UserMessage({required this.text, required this.time, super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 100,
          top: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.malibu.withAlpha(250),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(text),
            ),
            const SizedBox(height: 4),
            Text(time, style: const TextStyle(fontSize: 10)),
          ],
        ),
      ),
    );
  }
}

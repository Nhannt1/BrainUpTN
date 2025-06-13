import 'package:flutter/material.dart';

class SuggestedActions extends StatelessWidget {
  const SuggestedActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Wrap(
        spacing: 8,
        children: [
          ActionChip(
              label: const Text("Show me memory techniques"), onPressed: () {}),
          ActionChip(label: const Text("Create a quiz"), onPressed: () {}),
          ActionChip(
              label: const Text("Summarize an article"), onPressed: () {}),
          ActionChip(
              label: const Text("Suggest learning schedule"), onPressed: () {}),
        ],
      ),
    );
  }
}

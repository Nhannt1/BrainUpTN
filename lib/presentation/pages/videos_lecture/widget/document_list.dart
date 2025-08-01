import 'package:flutter/material.dart';

class DocumentsList extends StatelessWidget {
  const DocumentsList({super.key});

  @override
  Widget build(BuildContext context) {
    final docs = [
      {
        'title': 'Data Preprocessing Techniques',
        'subtitle': 'Lesson 2 · 28 min',
      },
      {
        'title': 'Neural Networks Fundamentals',
        'subtitle': 'Lesson 3 · 42 min',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Document',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12),
        ...docs.map(
          (doc) => Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              children: [
                Icon(Icons.insert_drive_file,
                    color: Colors.grey.shade800, size: 28),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doc['title']!,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        doc['subtitle']!,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

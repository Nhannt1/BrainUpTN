import 'package:flutter/material.dart';

class ResourcesAttachments extends StatelessWidget {
  const ResourcesAttachments({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Resources & Attachments',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12),

        // Lecture Slides
        ResourceItem(
          icon: Icons.picture_as_pdf,
          iconBg: const Color(0xFFFFEBEB),
          iconColor: Colors.red,
          title: 'Lecture Slides',
          subtitle: 'PDF · 2.4 MB',
          trailing: const Icon(Icons.download, size: 20),
        ),
        const SizedBox(height: 12),

        // Practice Quiz
        ResourceItem(
          icon: Icons.quiz,
          iconBg: const Color(0xFFE8F0FF),
          iconColor: Colors.blue,
          title: 'Practice Quiz',
          subtitle: '10 questions',
          trailing: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: const Size(50, 32),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Start',
              style: TextStyle(fontSize: 13),
            ),
          ),
        ),
        const SizedBox(height: 12),

        // Code Examples
        ResourceItem(
          icon: Icons.code,
          iconBg: const Color(0xFFE8FFF0),
          iconColor: Colors.green,
          title: 'Code Examples',
          subtitle: 'Python notebook',
          trailing: const Icon(Icons.open_in_new, size: 20),
        ),
      ],
    );
  }
}

class ResourceItem extends StatelessWidget {
  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String title;
  final String subtitle;
  final Widget trailing;

  const ResourceItem({
    super.key,
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: iconColor, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500)),
                const SizedBox(height: 4),
                Text(subtitle,
                    style: const TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}

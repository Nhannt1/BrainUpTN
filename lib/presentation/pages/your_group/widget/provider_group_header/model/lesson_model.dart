class Lesson {
  final String grade;
  final String icon;
  final String subjectName;
  final String topic;

  Lesson({
    required this.grade,
    required this.icon,
    required this.subjectName,
    required this.topic,
  });

  factory Lesson.fromMap(Map<String, dynamic> data) {
    return Lesson(
      grade: data['grade'] ?? '',
      icon: data['icon'] ?? '',
      subjectName: data['subjectName'] ?? '',
      topic: data['topic'] ?? '',
    );
  }
}

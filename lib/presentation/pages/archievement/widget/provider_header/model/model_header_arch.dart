class UserModelArch {
  final String name;
  final String title;
  final String avatarUrl;
  final int achivement;
  final int course;
  final int totalPoints;

  UserModelArch({
    required this.name,
    required this.title,
    required this.avatarUrl,
    required this.achivement,
    required this.course,
    required this.totalPoints,
  });

  factory UserModelArch.fromMap(Map<String, dynamic> data) {
    return UserModelArch(
      name: data['fullname'] ?? '',
      title: data['email'] ?? '',
      avatarUrl: data['image'] ?? '',
      achivement: int.tryParse(data['achivement']?.toString() ?? '0') ?? 0,
      course: int.tryParse(data['course']?.toString() ?? '0') ?? 0,
      totalPoints: int.tryParse(data['totalPoints']?.toString() ?? '0') ?? 0,
    );
  }
}

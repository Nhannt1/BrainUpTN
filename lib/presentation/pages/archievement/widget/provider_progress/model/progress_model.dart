class ProgressModel {
  final int completedCourses;
  final int inProgressCourses;

  ProgressModel({
    required this.completedCourses,
    required this.inProgressCourses,
  });

  double get completionPercent {
    final total = completedCourses + inProgressCourses;
    if (total == 0) return 0.0;
    return completedCourses / total;
  }
}

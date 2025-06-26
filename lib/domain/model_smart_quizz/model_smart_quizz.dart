class ModelSmartQuizz {
  final String question;
  String? userAnswer;
  bool? isCorrect;
  String? correctAnswer;
  ModelSmartQuizz(
      {required this.question,
      this.userAnswer,
      this.isCorrect,
      this.correctAnswer});
}

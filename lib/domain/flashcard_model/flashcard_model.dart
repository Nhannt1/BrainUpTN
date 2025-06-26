class FlashcardModel {
  final String question;
  final bool isCorrect; // Đúng hay Sai
  bool?
      userAnsweredCorrectly; // true nếu trả lời đúng, false nếu sai, null nếu chưa trả lời

  FlashcardModel({
    required this.question,
    required this.isCorrect,
    this.userAnsweredCorrectly,
  });
}

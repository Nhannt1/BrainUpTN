import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:brainup/domain/flashcard_model/flashcard_model.dart';
import 'package:brainup/data/source/remote/gemini_service.dart';

class FlashcardState {
  final List<FlashcardModel> flashcards;
  final int currentIndex;
  final bool isLoading;

  FlashcardState({
    required this.flashcards,
    required this.currentIndex,
    required this.isLoading,
  });

  FlashcardState copyWith({
    List<FlashcardModel>? flashcards,
    int? currentIndex,
    bool? isLoading,
  }) {
    return FlashcardState(
      flashcards: flashcards ?? this.flashcards,
      currentIndex: currentIndex ?? this.currentIndex,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class FlashcardNotifier extends StateNotifier<FlashcardState> {
  final GeminiService geminiService;

  FlashcardNotifier(this.geminiService)
      : super(
            FlashcardState(flashcards: [], currentIndex: 0, isLoading: true)) {
    loadFlashcards();
  }

  Future<void> loadFlashcards() async {
    state = state.copyWith(isLoading: true);
    final cards = await geminiService.generateTrueFalseQuestions("Sinh Học");
    state =
        FlashcardState(flashcards: cards, currentIndex: 0, isLoading: false);
  }

  void answerCard(bool userAnswer) {
    final currentCard = state.flashcards[state.currentIndex];
    currentCard.userAnsweredCorrectly = (userAnswer == currentCard.isCorrect);
    state = state.copyWith(); // cập nhật để UI rebuild
  }

  void nextCard() {
    if (state.currentIndex < state.flashcards.length - 1) {
      state = state.copyWith(currentIndex: state.currentIndex + 1);
    }
  }

  void reset() async {
    await loadFlashcards();
  }
}

final flashcardProvider =
    StateNotifierProvider<FlashcardNotifier, FlashcardState>(
  (ref) => FlashcardNotifier(GeminiService()),
);

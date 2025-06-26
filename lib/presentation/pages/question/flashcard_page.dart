import 'package:audioplayers/audioplayers.dart';
import 'package:brainup/data/source/remote/gemini_service.dart';
import 'package:brainup/domain/flashcard_model/flashcard_model.dart';
import 'package:brainup/presentation/pages/home/home_page.dart';
import 'package:brainup/presentation/pages/question/widgets/answer_btn.dart';
import 'package:brainup/presentation/pages/question/widgets/btn_widget.dart';
import 'package:brainup/presentation/pages/question/widgets/deckinfosection.dart';
import 'package:brainup/presentation/pages/question/widgets/finish_card.dart';
import 'package:brainup/presentation/pages/question/widgets/flash_card.dart';
import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class QuestionAi extends StatefulWidget {
  const QuestionAi({super.key});
  static const rootLocation = "/QuestionAi";

  @override
  State<QuestionAi> createState() => _QuestionAiState();
}

class _QuestionAiState extends State<QuestionAi> {
  final GeminiService _geminiService = GeminiService();
  List<FlashcardModel> _flashcards = [];
  int _currentIndex = 0;
  bool _isLoading = true;
  bool _isCardRefreshing = false;
  String _selectedSubject = "Sinh Học";
  int _latestRequestId = 0;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _loadFlashcards();
  }

  Future<void> _loadFlashcards([String? subject]) async {
    final loadingSubject = subject ?? _selectedSubject;
    final requestId = ++_latestRequestId;
    setState(() {
      _isLoading = true;
      _flashcards = [];
      _currentIndex = 0;
    });
    try {
      final cards =
          await _geminiService.generateTrueFalseQuestions(loadingSubject);
      if (requestId != _latestRequestId) {
        print(
            "⛔ Bỏ qua kết quả vì có request mới hơn. ID $requestId != $_latestRequestId");
        return;
      }
      setState(() {
        _flashcards = cards;
        _isLoading = false;
      });
    } catch (e) {
      if (requestId != _latestRequestId) return;
      print("Lỗi khi tải flashcards: $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _resetQuiz() async {
    setState(() {
      _isCardRefreshing = true;
    });

    final newCards = await _geminiService.generateTrueFalseQuestions(
        "$_selectedSubject (không trùng với các câu hỏi trước, thêm yếu tố bất ngờ, năm cụ thể hoặc nhân vật khác nhau)");
    print(_selectedSubject);
    setState(() {
      _flashcards = newCards;
      _currentIndex = 0;
      _isCardRefreshing = false;
    });
  }

  void _handleAnswer(bool userThinksCorrect) async {
    final flashcard = _flashcards[_currentIndex];
    final correctAnswer = flashcard.isCorrect;

    setState(() {
      flashcard.userAnsweredCorrectly = (userThinksCorrect == correctAnswer);
    });
    final soundPath = correctAnswer == userThinksCorrect
        ? 'sound/correct2.mp3'
        : 'sound/wrong.mp3';
    await _audioPlayer.play(AssetSource(soundPath));
  }

  void _nextCard() async {
    await Future.delayed(Duration(seconds: 1));
    if (_currentIndex < _flashcards.length - 1) {
      setState(() {
        _currentIndex++;
      });
    } else {
      await _audioPlayer.play(AssetSource('sound/success.mp3'));
      _showResultDialog();
      print("🎉 Hết bộ câu hỏi!");
    }
  }

  void _showResultDialog() {
    final correct =
        _flashcards.where((f) => f.userAnsweredCorrectly == true).length;
    final total = _flashcards.length;

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => FinishCard(
              correctAnswers: correct,
              totalQuestions: total,
              onRetry: _resetQuiz,
            ));
  }

  @override
  Widget build(BuildContext context) {
    final hasData = _flashcards.isNotEmpty;
    if (_isLoading) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    final currentFlashcard = _flashcards[_currentIndex];
    print(
        "Đang hiển thị Flashcard: ${currentFlashcard.question} (Môn: $_selectedSubject)");
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              context.go(Home.rootLocation);
            },
            child: Icon(
              FontAwesomeIcons.brain,
              color: AppColors.royalBlue,
            )),
        title: Text('BrAInUp',
            style: BrainUpTextStyles.text20Bold
                .copyWith(color: AppColors.governorbay)),
        actions: [
          IconButton(
            icon: Icon(
              Icons.nightlight_round,
              color: AppColors.royalBlue,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DeckInfoSection(
                currentQuestion: hasData ? _currentIndex + 1 : 0,
                totalQuestions: _flashcards.length,
                selectedSubject: _selectedSubject,
                onSubjectChanged: (newSubject) async {
                  print("Subject changed to: $newSubject");

                  setState(() {
                    _selectedSubject = newSubject;
                    // _resetQuiz();
                  });
                  // _selectedSubject = newSubject;
                  // _resetQuiz();
                  await _loadFlashcards(newSubject);
                },
                onReset: _resetQuiz,
              ),
              SizedBox(
                height: 20.h,
              ),
              Flashcard(
                isLoading: _isCardRefreshing,
                question: currentFlashcard.question,
                answer: currentFlashcard.isCorrect ? "True" : "False",
                showAnswer: currentFlashcard.userAnsweredCorrectly != null,
                isCorrect: currentFlashcard.userAnsweredCorrectly,
              ),
              SizedBox(
                height: 20.h,
              ),
              AnswerButtons(
                currentFlashcard: currentFlashcard,
                onAnswer: _handleAnswer,
                onNext: _nextCard,
              ),
              SizedBox(
                height: 12.h,
              ),
              BtnWidget()
            ],
          ),
        ),
      )),
    );
  }
}

import 'package:audioplayers/audioplayers.dart';
import 'package:brainup/data/service/ai_chat/text_speed_bot.dart';
import 'package:brainup/data/source/remote/gemini_service.dart';
import 'package:brainup/domain/model_smart_quizz/model_smart_quizz.dart';
import 'package:brainup/presentation/pages/home/home_page.dart';
import 'package:brainup/presentation/pages/smart_ai_quizz/widget/adaptive.dart';
import 'package:brainup/presentation/pages/smart_ai_quizz/widget/finish_card.dart';
import 'package:brainup/presentation/pages/smart_ai_quizz/widget/main_quizz.dart';
import 'package:brainup/presentation/pages/smart_ai_quizz/widget/navigation_btn.dart';
import 'package:brainup/presentation/pages/smart_ai_quizz/widget/progress_bar_quizz.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SmartAiQuizz extends StatefulWidget {
  const SmartAiQuizz({super.key});
  static const rootLocation = "/SmartAiQuizz";

  @override
  State<SmartAiQuizz> createState() => _SmartAiQuizzState();
}

class _SmartAiQuizzState extends State<SmartAiQuizz> {
  List<ModelSmartQuizz> questions = [];
  int currentIndex = 0;
  bool isLoading = true;
  final TextEditingController _answerController = TextEditingController();
  final GeminiService _geminiService = GeminiService();
  String correctAnswer = '';
  String resultStatus = '';
  bool showResult = false;
  late stt.SpeechToText _speech;
  bool _isListening = false;
  final AudioPlayer _audioPlayer = AudioPlayer();
  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    loadQuestions();
  }

  @override
  void dispose() {
    _answerController.dispose();
    super.dispose();
  }

  Future<void> playFeedbackSound(bool isCorrect) async {
    final path = isCorrect ? 'sound/correct2.mp3' : 'sound/wrong.mp3';
    await _audioPlayer.play(AssetSource(path));
  }

  Future<void> loadQuestions() async {
    questions = await _geminiService.generateOpenEndedQuestions(
        "khoa học,lịch sử,văn hóa,thiên nhiên,con người,thế giới,thể thao,du lịch...");
    setState(() {
      isLoading = false;
    });
  }

  Future<void> submitAnswer() async {
    if (_isListening) {
      stopListening();
    }
    final userAnswer = _answerController.text.trim();
    final currentQuestion = questions[currentIndex];

    if (userAnswer.isEmpty) return;

    final aiFeedback = await _geminiService.checkAnswerWithAI(
      question: currentQuestion.question,
      userAnswer: userAnswer,
    );
    final isCorrect = aiFeedback['isCorrect'] == true;
    setState(() {
      correctAnswer = aiFeedback['correctAnswer'] ?? '';
      resultStatus = aiFeedback['isCorrect'] == true ? 'Đúng' : 'Sai';
      showResult = true;
      questions[currentIndex].userAnswer = userAnswer;
      questions[currentIndex].isCorrect = isCorrect;
      questions[currentIndex].correctAnswer = correctAnswer;
    });
    await playFeedbackSound(isCorrect);
    _answerController.clear();
  }

  void _showResultDialog() {
    final correct = questions.where((q) => q.isCorrect == true).length;
    final total = questions.length;

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => FinishCardAi(
              correctAnswers: correct,
              totalQuestions: total,
              onRetry: resetQuiz,
            ));
  }

  void goToNext() async {
    if (currentIndex < questions.length - 1) {
      setState(() {
        currentIndex++;
        _answerController.text = questions[currentIndex].userAnswer ?? '';
        showResult = false;
      });
    } else {
      await _audioPlayer.play(AssetSource('sound/success.mp3'));
      _showResultDialog();
    }
  }

  void goToPrevious() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
        _answerController.text = questions[currentIndex].userAnswer ?? '';
      });
    }
  }

  Future<void> resetQuiz() async {
    setState(() {
      isLoading = true;
      currentIndex = 0;
      correctAnswer = '';
      resultStatus = '';
      showResult = false;
      _answerController.clear();
    });

    questions = await _geminiService.generateOpenEndedQuestions(
      "Thế giới,thể thao,văn hóa,du lịch,khoa học,lịch sử,thiên nhiên,con người...(khác với câu hỏi trước đó,không gọi lại câu hỏi)",
      previousQuestions: questions.map((q) => q.question).toList(),
    );

    setState(() {
      isLoading = false;
    });
  }

  void startListening() async {
    bool available = await _speech.initialize(
      onStatus: (status) => print('STT status: $status'),
      onError: (error) => print('STT error: $error'),
    );

    if (available) {
      setState(() => _isListening = true);
      _speech.listen(
        onResult: (result) {
          setState(() {
            _answerController.text = result.recognizedWords;
          });
        },
        localeId: 'vi_VN',
      );
    }
  }

  void stopListening() {
    _speech.stop();
    setState(() => _isListening = false);
  }

  @override
  Widget build(BuildContext context) {
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Smart AI Quizz", style: TextStyle(fontSize: 18)),
          leading: InkWell(
              onTap: () => context.go(Home.rootLocation),
              child: Icon(Icons.arrow_back)),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: CircleAvatar(
                radius: 18,
                backgroundImage:
                    NetworkImage('https://i.imgur.com/QCNbOAo.png'),
              ),
            )
          ],
        ),
        body: SafeArea(
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ProgressBarWidget(
                          currentQuestion: currentIndex + 1,
                          totalQuestions: questions.length,
                          ontapReset: resetQuiz,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        MainQuizWidget(
                          isListening: _isListening,
                          ontapSpeak: () {
                            if (_isListening) {
                              stopListening();
                            } else {
                              startListening();
                            }
                          },
                          ontaplisten: () {
                            TextToSpeechService()
                                .speak(questions[currentIndex].question);
                          },
                          questionText: questions[currentIndex].question,
                          controller: _answerController,
                          onSubmit: submitAnswer,
                          onSkip: goToNext,
                          correctAnswer: correctAnswer,
                          resultStatus: resultStatus,
                          showResult: showResult,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Adaptive(),
                        // NavigationButtons()
                      ],
                    ),
                  ),
                ),
        ),
        bottomNavigationBar: isKeyboardOpen
            ? null
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: NavigationButtons(
                  ontapNext: goToNext,
                  ontapPre: goToPrevious,
                ),
              ),
      ),
    );
  }
}

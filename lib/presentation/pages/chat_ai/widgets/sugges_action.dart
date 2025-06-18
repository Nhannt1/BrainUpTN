import 'package:brainup/domain/repository/source/gemini_service.dart';
import 'package:brainup/presentation/pages/chat_ai/widgets/message_model.dart';
import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuggestedActions extends StatefulWidget {
  final Function(String) onSuggestionTap;
  final List<MessageModel> messages;
  const SuggestedActions(
      {super.key, required this.onSuggestionTap, required this.messages});

  @override
  State<SuggestedActions> createState() => _SuggestedActionsState();
}

class _SuggestedActionsState extends State<SuggestedActions> {
  List<String> aiSuggestions = [];
  bool _isLoadingSuggestions = false;
  @override
  void initState() {
    super.initState();
    fetchSuggestions();
  }

  Future<void> fetchSuggestions() async {
    final suggestions =
        await GeminiService().generateSuggestions(widget.messages);
    if (!mounted) return;
    setState(() {
      aiSuggestions = suggestions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 70,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 1.5,
              ),
              child: Wrap(
                runSpacing: 10.h,
                spacing: 10.w,
                children: aiSuggestions.map((text) {
                  return buildTextSuggestion(text, () {
                    widget.onSuggestionTap(text);
                  });
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildTextSuggestion(String text, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        color: AppColors.blacksqueeze,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Text(
          text,
          style: BrainUpTextStyles.text12Normal
              .copyWith(color: AppColors.riverBed),
        ),
      ),
    ),
  );
}

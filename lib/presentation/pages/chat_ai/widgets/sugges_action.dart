import 'package:brainup/data/source/remote/gemini_service.dart';
import 'package:brainup/domain/model_ai/message_model.dart';
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
  State<SuggestedActions> createState() => SuggestedActionsState();
}

class SuggestedActionsState extends State<SuggestedActions> {
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
        padding: EdgeInsets.all(8.w),
        child: SizedBox(
          height: 60.h,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 1.1,
              ),
              child: Wrap(
                runSpacing: 12.h,
                spacing: 12.w,
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
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(5.w),
        child: Text(
          text,
          style: BrainUpTextStyles.text12Normal
              .copyWith(color: AppColors.riverBed),
        ),
      ),
    ),
  );
}

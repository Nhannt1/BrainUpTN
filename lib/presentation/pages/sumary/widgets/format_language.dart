import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SummaryOptions extends StatefulWidget {
  const SummaryOptions({super.key});

  @override
  State<SummaryOptions> createState() => _SummaryOptionsWidgetState();
}

class _SummaryOptionsWidgetState extends State<SummaryOptions> {
  final List<String> formats = ['Bullets', 'Paragraph', 'TL;DR'];
  int selectedFormat = 0;
  String selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Summary Format",
            style: BrainUpTextStyles.text12Normal
                .copyWith(color: AppColors.riverBed),
          ),
          const SizedBox(height: 6),
          Row(
            children: List.generate(formats.length, (index) {
              final isSelected = selectedFormat == index;
              return Padding(
                padding: EdgeInsets.only(right: 6),
                child: ChoiceChip(
                  label: Text(
                    formats[index],
                    style: TextStyle(
                      fontSize: 11,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                  selected: isSelected,
                  onSelected: (_) {
                    setState(() {
                      selectedFormat = index;
                    });
                  },
                  selectedColor: AppColors.royalBlue,
                  backgroundColor: AppColors.athensGray,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  showCheckmark: false,
                ),
              );
            }),
          ),
          const SizedBox(height: 12),
          const Text(
            "Language",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 6),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.athensGray1),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 3),
              child: DropdownButton<String>(
                value: selectedLanguage,
                style: const TextStyle(fontSize: 12, color: Colors.black),
                isDense: true,
                underline: Container(height: 1, color: Colors.grey.shade300),
                items: ['English', 'Vietnamese', 'Japanese']
                    .map((lang) => DropdownMenuItem(
                          value: lang,
                          child: Text(lang),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedLanguage = value!;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

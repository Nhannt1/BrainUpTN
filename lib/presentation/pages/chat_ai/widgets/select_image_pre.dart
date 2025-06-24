// selected_image_preview.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';

class SelectedImagePreview extends StatelessWidget {
  final File selectedImage;
  final VoidCallback onSendPressed;
  final VoidCallback onCancelPressed;

  const SelectedImagePreview({
    Key? key,
    required this.selectedImage,
    required this.onSendPressed,
    required this.onCancelPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: AppColors.athensGray1,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.file(
                  selectedImage,
                  width: 80.w,
                  height: 80.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Text(
                  'Image Choose: ${selectedImage.path.split('/').last.length > 20 ? selectedImage.path.split('/').last.substring(0, 17) + '...' : selectedImage.path.split('/').last}',
                  style: BrainUpTextStyles.text14Normal
                      .copyWith(color: AppColors.riverBed),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: onSendPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.dodgerblue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r)),
                    padding: EdgeInsets.symmetric(vertical: 7.h),
                  ),
                  child: Text(
                    'Send',
                    style: BrainUpTextStyles.text16Normal
                        .copyWith(color: AppColors.white),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: ElevatedButton(
                  onPressed: onCancelPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.athensGray1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r)),
                    padding: EdgeInsets.symmetric(vertical: 7.h),
                  ),
                  child: Text(
                    'Cancel',
                    style: BrainUpTextStyles.text16Normal
                        .copyWith(color: AppColors.riverBed),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

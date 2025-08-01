import 'package:brainup/presentation/pages/profile/widgets/provider_form/bloc/form_bloc.dart';
import 'package:brainup/presentation/pages/profile/widgets/provider_form/bloc/form_event.dart';
import 'package:brainup/presentation/pages/profile/widgets/provider_form/bloc/form_state.dart';
import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormProfile extends StatelessWidget {
  final String userId = FirebaseAuth.instance.currentUser?.uid ?? 'guest';

  Widget build(BuildContext context) {
    return BlocBuilder<FormBloc, FormStatee>(builder: (context, state) {
      if (state is FormInitial) {
        context.read<FormBloc>().add(LoadForm(id: userId));
      }
      if (state is FormLoading) {
        return const Padding(
          padding: EdgeInsets.all(16),
          child: Center(child: CircularProgressIndicator()),
        );
      }
      if (state is FormLoaded) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name",
                style: BrainUpTextStyles.text12Bold.copyWith(
                  color: AppColors.stormGray,
                ),
              ),
              _buildTextField(state.fullname, ""),
              Text(
                "Age",
                style: BrainUpTextStyles.text12Bold.copyWith(
                  color: AppColors.stormGray,
                ),
              ),
              _buildTextField(state.age, ""),
              Text(
                "Email",
                style: BrainUpTextStyles.text12Bold.copyWith(
                  color: AppColors.stormGray,
                ),
              ),
              _buildTextField(state.email, ""),
            ],
          ),
        );
      }
      if (state is FormError) {
        return Text("Error: ${state.message}");
      }

      return const SizedBox.shrink();
    });
  }

  Widget _buildTextField(String label, String initialValue) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Container(
        child: TextField(
          decoration: InputDecoration(
            hintText: label,
            hintStyle: BrainUpTextStyles.text16Normal
                .copyWith(color: AppColors.spunPearl),
            filled: true,
            fillColor: AppColors.white,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: AppColors.athensGray1,
                width: 1.2.w,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: AppColors.athensGray1,
                width: 1.2.w,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: AppColors.athensGray1,
                width: 1.5.w,
              ),
            ),
          ),
          controller: TextEditingController(
            text: initialValue,
          ),
        ),
      ),
    );
  }
}

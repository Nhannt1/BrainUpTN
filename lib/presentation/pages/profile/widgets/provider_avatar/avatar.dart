import 'package:brainup/presentation/pages/profile/widgets/provider_avatar/bloc/avatar_bloc.dart';
import 'package:brainup/presentation/pages/profile/widgets/provider_avatar/bloc/avatar_event.dart';
import 'package:brainup/presentation/pages/profile/widgets/provider_avatar/bloc/avatar_sate.dart';
import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Avatar extends StatefulWidget {
  const Avatar({super.key});

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  final String userId = FirebaseAuth.instance.currentUser?.uid ?? 'guest';

  @override
  void initState() {
    super.initState();
    context.read<AvatarBloc>().add(LoadAvatar(uid: userId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AvatarBloc, AvatarSate>(
      builder: (context, state) {
        if (state is AvatarLoading) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is AvatarLoaded) {
          return Center(
            child: Padding(
              padding: EdgeInsets.only(top: 24.h),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        width: 112.w,
                        height: 112.h,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: AppColors.white, width: 3.w),
                        ),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: state.localFile != null
                              ? FileImage(state.localFile!)
                              : NetworkImage(state.imageUrl) as ImageProvider,
                        ),
                      ),
                      Positioned(
                        bottom: 10.h,
                        right: 10.w,
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: AppColors.white),
                          child: Padding(
                            padding: EdgeInsets.all(2.w),
                            child: InkWell(
                              onTap: () {
                                context
                                    .read<AvatarBloc>()
                                    .add(PickAvatarImage());
                              },
                              child: CircleAvatar(
                                radius: 14.r,
                                backgroundColor: AppColors.cornflowerBlue,
                                child: Icon(Icons.camera_alt,
                                    size: 14.sp, color: AppColors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [AppColors.gold, AppColors.orangepeel]),
                      borderRadius: BorderRadius.circular(999.r),
                    ),
                    child: Text('Premium',
                        style: BrainUpTextStyles.text12Bold
                            .copyWith(color: AppColors.cloudBurstl)),
                  )
                ],
              ),
            ),
          );
        }

        if (state is AvatarErorr) {
          return Text("Error: ${state.messing}");
        }

        return const SizedBox.shrink();
      },
    );
  }
}

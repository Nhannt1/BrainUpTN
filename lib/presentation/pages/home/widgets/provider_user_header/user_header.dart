import 'package:brainup/data/repository/source/local/user_local_data_source.dart';
import 'package:brainup/di/di.dart';
import 'package:brainup/presentation/base/povider_chat_ai/ai_chat_provider.dart';
import 'package:brainup/presentation/pages/home/widgets/provider_user_header/provider/user_header_bloc.dart';
import 'package:brainup/presentation/pages/home/widgets/provider_user_header/provider/user_header_event.dart';
import 'package:brainup/presentation/pages/home/widgets/provider_user_header/provider/user_header_state.dart';
import 'package:brainup/presentation/pages/login/login_page.dart';
import 'package:brainup/presentation/pages/profile/profile_page.dart';
import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:brainup/data/source/local/app_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // thêm import này nếu chưa có

class UserHeader extends StatelessWidget {
  final UserLocalDataSource userLocal = getIt<UserLocalDataSource>();
  final AppDatabase db = AppDatabase();
  final String userId = FirebaseAuth.instance.currentUser?.uid ?? 'guest';

  UserHeader({super.key});

  String getGreetingMessage() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good morning,';
    if (hour < 18) return 'Good afternoon,';
    return 'Good evening,';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserHeaderState>(
      builder: (context, state) {
        if (state is UserInitial) {
          context.read<UserBloc>().add(LoadUser(userId));
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is UserLoading) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is UserLoaded) {
          return _buildUserRow(context, state.fullname, state.imageUrl);
        }

        if (state is UserError) {
          return Text("Error: ${state.message}");
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildUserRow(BuildContext context, String name, String imageUrl) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.athensGray1, width: 1),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => context.go(ProfilePage.rootLocation),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border:
                      Border.all(color: AppColors.cornflowerBlue, width: 2.w),
                ),
                child: CircleAvatar(
                  radius: 22,
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(getGreetingMessage(),
                      style: BrainUpTextStyles.text12Normal
                          .copyWith(color: AppColors.grayChateau)),
                  Text(name,
                      style: BrainUpTextStyles.text16Bold
                          .copyWith(color: AppColors.black)),
                ],
              ),
            ),
            Stack(
              children: [
                InkWell(
                  onTap: () async {
                    await userLocal.saveHasLogin(hasLogin: false);
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.remove('hasShownWelcomePopup');
                    // TODO: Xóa message nếu không dùng Riverpod nữa
                    // Gợi ý: có thể chuyển message state qua Bloc khác nếu cần
                    context.go(LoginPage.rootLocation);
                  },
                  child: Icon(Icons.notifications_none,
                      color: Colors.blue, size: 30.sp),
                ),
                Positioned(
                  right: 2.w,
                  top: 2.h,
                  child: Container(
                    width: 10.w,
                    height: 10.w,
                    decoration: const BoxDecoration(
                      color: AppColors.flamingo,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

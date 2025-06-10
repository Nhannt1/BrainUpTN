import 'package:brainup/presentation/pages/login/login_page.dart';
import 'package:brainup/shared/extensions/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class VerifyEmailPage extends StatelessWidget {
  static const rootLocation = '/VerifyEmailPage';

  const VerifyEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Email Verify'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            Text(
              context.l10n!.averificationemail,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: () async {
                final user = FirebaseAuth.instance.currentUser;
                await user?.reload();
                if (user != null && user.emailVerified) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("successful authentication")),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content:
                            Text(context.l10n!.youHaveNotVerifiedYourMail)),
                  );
                }
              },
              child: Text("I have verify"),
            ),
            ElevatedButton(
              onPressed: () async {
                context.go(LoginPage.rootLocation);
              },
              child: Text("Back to login page"),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:brainup/presentation/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

class VerifyEmailPage extends StatelessWidget {
  static const rootLocation = '/VerifyEmailPage';

  const VerifyEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Xác thực Email'),
        actions: [
          InkWell(
              onTap: () {
                print("da click");
                context.go(LoginPage.rootLocation);
              },
              child: Icon(Icons.arrow_outward))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'A verification email has been sent to your address. Please check and click on the verification link.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
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
                    SnackBar(content: Text('You have not verified your email')),
                  );
                }
              },
              child: Text("I have verify"),
            ),
            ElevatedButton(
              onPressed: () async {
                context.go(LoginPage.rootLocation);
              },
              child: Text("back to login page"),
            ),
          ],
        ),
      ),
    );
  }
}

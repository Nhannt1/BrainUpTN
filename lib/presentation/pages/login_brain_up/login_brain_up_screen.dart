import 'package:brainup/presentation/pages/login_brain_up/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginBrainUpScreen extends StatefulWidget {
  const LoginBrainUpScreen({super.key});
  static const rootLocation = '/LoginBrainUpScreen';

  @override
  State<LoginBrainUpScreen> createState() => _LoginBrainUpScreenState();
}

class _LoginBrainUpScreenState extends State<LoginBrainUpScreen> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BrAInUp',
            style: TextStyle(
                color: Color(0xFF3870EF), fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                //  Đổ bóng
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 4,
                  blurRadius: 5,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 20,
                    children: [
                      _buildTagButton("Login", isLogin, () {
                        setState(() => isLogin = true);
                      }),
                      _buildTagButton("Register", !isLogin, () {
                        setState(() => isLogin = false);
                      })
                    ],
                  ),
                  Expanded(
                      // child: isLogin ? LoginForm() : RegisterForm(),
                      child: LoginForm()),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}

Widget _buildTagButton(String text, bool isSelected, onPressed) {
  return InkWell(
    onTap: onPressed,
    child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFEAF1FE) : Colors.transparent,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isSelected ? Color(0xFF3870EF) : Color(0xFF4B5563),
          ),
        )),
  );
}

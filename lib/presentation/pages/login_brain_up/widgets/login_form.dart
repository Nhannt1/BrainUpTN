import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscuretext = true;
  final _formkey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Email",
                  style: TextStyle(color: Color(0xFF374151)),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: email,
                  style: TextStyle(fontSize: 11),

                  decoration: InputDecoration(
                    fillColor: Color(0xFFF5F7FA),
                    filled: true,
                    hintText: 'your@email.com',
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                      size: 20,
                      color: Color(0xFF9CA3AF),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(color: Colors.grey.shade500),
                    ),

                    // errorBorder: OutlineInputBorder(
                    //   borderSide: BorderSide(color: Colors.grey),
                    //   borderRadius: BorderRadius.circular(12),
                    // ),
                  ),
                  // validator: hàm kiểm tra dữ liệu nhập
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter email';
                    }
                    return null;
                  },
                ),
              ],
            ),

            //const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Password",
                  style: TextStyle(color: Color(0xFF374151)),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: password,
                  obscureText: _obscuretext,
                  style: TextStyle(fontSize: 11),
                  decoration: InputDecoration(
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ), // khi đang focus vẫn không đỏ
                      //borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: FaIcon(
                        FontAwesomeIcons.lock,
                        size: 17,
                        color: Color(0xFF9CA3AF),
                      ),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscuretext = !_obscuretext;
                        });
                      },
                      child: Icon(
                        _obscuretext ? Icons.visibility_off : Icons.visibility,
                        color: Color(0xFF9CA3AF),
                        size: 20, // bạn có thể chỉnh size icon nhỏ lại
                      ),
                    ),
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: 'password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  validator: (value) {
                    // Kiểm tra trống
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter password';
                    }
                    // Kiểm tra độ dài mật khẩu tối thiểu 6 ký tự
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null; // hợp lệ
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Text('Forgot password?',
                          style: TextStyle(
                              color: Color(0xFF3870EF),
                              fontSize: 11,
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xFF3870EF),
                              fontWeight: FontWeight.w500)),
                    ),
                    Text(
                      'Login with OTP',
                      style: TextStyle(
                          color: Color(0xFF374151),
                          fontSize: 11,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ],
            ),

            SizedBox(
              width: 300,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF3870EF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  elevation: 3,
                ),
                onPressed: () async {
                  // final bool check = await LoginUser(
                  //   email: email.text,
                  //   password: password.text,
                  // ); // đăng kí vào firebasestore

                  // if (_formkey.currentState!.validate()) {
                  //   bool success = (await authLogin.signInWithEmail(
                  //     email.text,
                  //     password.text,
                  //   ));
                  //   if (success) {
                  //     // await prefs.Login(); // Lưu trạng thái đăng nhập
                  //     if (!mounted) return;
                  //     // await prefs.Login();
                  //     // context.go(HomeBrainUpScreen
                  //     //     .rootLocation); // Chuyển đến trang home
                  //   } else {
                  //     if (!mounted) return;
                  //     ScaffoldMessenger.of(context).showSnackBar(
                  //       SnackBar(
                  //         content: Text("Email hoặc mật khẩu sai"),
                  //       ),
                  //     );
                  //   }
                  // }
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey.shade400, // màu gạch mờ
                    thickness: 0.6, // độ dày
                  ),
                ),
                Text(
                  'Or login with',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600, // màu chữ mờ
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey.shade400, // màu gạch mờ
                    thickness: 0.6, // độ dày
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialLoginButton(
                  icon: FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.red,
                    size: 20,
                  ),
                  onTap: () async {
                    // final result = await authLogin.signInWithGoogle();
                    // if (result == null) {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //       SnackBar(content: Text("dang nhao thanh cong")));
                    //   if (!context.mounted) return;
                    //   context.go(HomeBrainUpScreen.rootLocation);
                    // } else {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //       SnackBar(content: Text("dang nhap that bai")));
                    // }
                  },
                ),
                const SizedBox(width: 16),
                _buildSocialLoginButton(
                  icon: FaIcon(
                    FontAwesomeIcons.apple,
                    color: Colors.black,
                    size: 20,
                  ),
                  onTap: () {
                    // Đăng nhập Apple
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget _buildSocialLoginButton(
    {required Widget icon, required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Color(0xFFF9FAFB),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Center(child: icon),
    ),
  );
}

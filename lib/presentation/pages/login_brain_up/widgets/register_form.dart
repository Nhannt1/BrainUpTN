import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  bool _obscuretext = true;
  bool _reObscuretext = true;

  final _formkey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();
  final phone = TextEditingController();
  final repassword = TextEditingController();
  bool isCheckedIcon = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Full Name",
                    style: TextStyle(color: Color(0xFF374151)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: name,
                    style: TextStyle(fontSize: 11),

                    decoration: InputDecoration(
                      fillColor: Color(0xFFF5F7FA),
                      filled: true,
                      hintText: 'Enter your name',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      prefixIcon: Icon(Icons.person,
                          size: 20, color: Color(0xFF9CA3AF)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: BorderSide(color: Colors.grey.shade500),
                      ),
                    ),
                    // kiểm tra dữ liệu nhập
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
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
                      prefixIcon:
                          Icon(Icons.email, size: 20, color: Color(0xFF9CA3AF)),
                      filled: true,
                      hintText: 'name@gmail.com',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: BorderSide(color: Colors.grey.shade500),
                      ),
                    ),
                    // kiểm tra dữ liệu nhập
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter email';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Phone Number",
                    style: TextStyle(color: Color(0xFF374151)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: phone,
                    style: TextStyle(fontSize: 11),

                    decoration: InputDecoration(
                      fillColor: Color(0xFFF5F7FA),
                      filled: true,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: FaIcon(FontAwesomeIcons.phone,
                            size: 17, color: Color(0xFF9CA3AF)),
                      ),
                      hintText: 'Enter your phone',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: BorderSide(color: Colors.grey.shade500),
                      ),
                    ),
                    // kiểm tra dữ liệu nhập
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter phone';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
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
                        ),
                        //borderRadius: BorderRadius.circular(20),
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: FaIcon(FontAwesomeIcons.lock,
                            size: 17, color: Color(0xFF9CA3AF)),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscuretext = !_obscuretext;
                          });
                        },
                        child: Icon(
                          _obscuretext
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Color(0xFF9CA3AF),
                          size: 20,
                          // bạn có thể chỉnh size icon nhỏ lại
                        ),
                      ),
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: 'Create a password',
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
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Confirm Password",
                    style: TextStyle(color: Color(0xFF374151)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: repassword,
                    obscureText: _reObscuretext,
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
                        child: FaIcon(FontAwesomeIcons.lock,
                            size: 17, color: Color(0xFF9CA3AF)),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _reObscuretext = !_reObscuretext;
                          });
                        },
                        child: Icon(
                          _reObscuretext
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Color(0xFF9CA3AF),
                          size: 20, // bạn có thể chỉnh size icon nhỏ lại
                        ),
                      ),
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: 'Create a password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    validator: (value) {
                      // Kiểm tra trống
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter password';
                      }

                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      isCheckedIcon
                          ? Icons.check_box
                          : Icons.check_box_outline_blank,
                      color: isCheckedIcon ? Colors.blue : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        isCheckedIcon = !isCheckedIcon;
                      });
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    // child: Text(
                    //     "I agree to the Terms of Service, and Privacy Policy")
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "I agree to the ",
                          style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: "Terms of Service ",
                          style: TextStyle(color: Color(0xFF6366F1))),
                      TextSpan(
                          text: "and, ", style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: "Privacy Policy",
                          style: TextStyle(color: Color(0xFF6366F1))),
                    ])),
                  )
                ],
              ),
              SizedBox(
                height: 15,
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

                    if (_formkey.currentState!.validate()) {
                      //   await authLogin.registerWithEmail(
                      //     email.text,
                      //     password.text,
                      //   );
                      //   name.clear();
                      //   email.clear();
                      //   phone.clear();
                      //   password.clear();
                      //   password.clear();
                      //   repassword.clear();

                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //       SnackBar(content: Text("dang kí thành công ")));
                      //   if (success) {
                      //    // await prefs.Login(); // Lưu trạng thái đăng nhập nếu cần
                      //     if (!mounted) return;
                      //   //  await prefs.Login();
                      //    // context.go('/home'); // Chuyển đến trang home
                      //   } else {
                      //     if (!mounted) return;
                      //     ScaffoldMessenger.of(context).showSnackBar(
                      //       SnackBar(

                      //         content: Text("Email hoặc mật khẩu sai"),
                      //       ),
                      //     );
                      //   }
                    }
                  },
                  child: Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey.shade400, // màu gạch mờ
                      thickness: 0.6, // độ dày
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSocialLoginButton(
                    icon: FaIcon(
                      FontAwesomeIcons.google,
                      color: Colors.red,
                      size: 15,
                    ),
                    text: "Google",
                    onTap: () {
                      // Đăng nhập Google
                    },
                  ),
                  const SizedBox(width: 16),
                  _buildSocialLoginButton(
                    icon: FaIcon(
                      FontAwesomeIcons.apple,
                      color: Colors.black,
                      size: 15,
                    ),
                    text: "Apple",
                    onTap: () {
                      // Đăng nhập Apple
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",
                      style: TextStyle(color: Colors.grey.shade700)),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Sign In",
                    style: TextStyle(color: Colors.blue),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildSocialLoginButton({
  required Widget icon,
  required String text,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Center(
          child: Row(
            children: [
              icon,
              SizedBox(
                width: 7,
              ),
              Text(
                text,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

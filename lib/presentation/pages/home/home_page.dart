import 'package:brainup/presentation/pages/home/widgets/popup_widget.dart';
import 'package:brainup/presentation/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static const rootLocation = '/Home';

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (context) => const PopupWidget(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [],
      )),
    );
  }
}

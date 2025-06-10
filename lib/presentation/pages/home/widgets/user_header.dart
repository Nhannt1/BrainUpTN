import 'package:brainup/data/repository/source/local/preference/share_pref_login.dart';
import 'package:brainup/presentation/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xFF647FFF), width: 2),
              ),
              child: const CircleAvatar(
                radius: 22,
                backgroundImage: NetworkImage(
                  'https://i.imgur.com/QCNbOAo.png',
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Good afternoon,',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                Text(
                  'Sara Lee',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              InkWell(
                onTap: () async {
                  await SharePrefLogin.instance.saveLogout();
                  context.go(LoginPage.rootLocation);
                },
                child: const Icon(Icons.notifications_none,
                    color: Colors.blue, size: 30),
              ),
              Positioned(
                right: 2,
                top: 2,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}

import 'package:brainup/data/repository/source/local/preference/shared_pref_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePrefLogin {
  SharePrefLogin._();
  static final SharePrefLogin instance = SharePrefLogin._();
  Future<void> saveLogin() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(SharedPrefKey.hasLoginPref, true);
  }

  Future<void> saveLogout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(SharedPrefKey.hasLoginPref, false);
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.getBool(SharedPrefKey.hasLoginPref) ?? false;
  }
}

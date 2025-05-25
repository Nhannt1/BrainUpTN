import 'dart:convert';

import 'package:brainup/data/model/user_data.dart';
import 'package:brainup/data/repository/source/local/preference/secure_storage_key.dart';
import 'package:brainup/data/repository/source/local/preference/shared_pref_key.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLocalDataSource {
  UserLocalDataSource(
    this._sharedPreferences,
    this._secureStorage,
  );
  final SharedPreferences _sharedPreferences;
  final FlutterSecureStorage _secureStorage;

  Future<void> saveAccessToken({required String accessToken}) async {
    await _secureStorage.write(key: SecureStorageKey.accessToken, value: accessToken);
  }

  Future<String?> getAccessToken() {
    return _secureStorage.read(key: SecureStorageKey.accessToken);
  }

  Future<void> saveHasLogin({required bool hasLogin}) async {
    await _sharedPreferences.setBool(SharedPrefKey.hasLoginPref, hasLogin);
  }

  bool? getHasLogin() {
    return _sharedPreferences.getBool(SharedPrefKey.hasLoginPref);
  }

  Future<void> saveCurrentUser({required UserData userData}) async {
    await _sharedPreferences.setString(SharedPrefKey.currentUserPref, jsonEncode(userData.toJson()));
  }

  UserData? getCurrentUser({required UserData userData}) {
    String? userString = _sharedPreferences.getString(SharedPrefKey.currentUserPref);
    if (userString != null) {
      Map<String, dynamic> map = jsonDecode(userString);
      return UserData.fromJson(map);
    }
    return null;
  }
}

// ignore_for_file: unused_field

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageServices {
  static late SharedPreferences _pref;

  static Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
  }

  static Future<void> saveUser({
    required userId,
    required token,
    required userEmail,
  }) async {
    await _pref.setString('user_id', userId);
    await _pref.setString('token', token);
    await _pref.setString('email', userEmail);
  }

  static String? getUserId() {
    return _pref.getString('user_id');
  }

  static String? getToken() {
    return _pref.getString('token');
  }

  static String? getEmial() {
    return _pref.getString('email');
  }

  static Future<void> deleteUser() async {
    await _pref.remove("user_id");
    await _pref.remove("token");
    await _pref.remove("email");
  }
}

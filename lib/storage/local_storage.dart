import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static const String _pinKey = "user_pin";

  static Future<void> savePin(String pin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_pinKey, pin);
  }

  static Future<String?> getPin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_pinKey);
  }
}
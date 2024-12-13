import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../Models/register_model.dart'; // For JSON encoding/decoding

class AppController {
  static const String _registerKey = 'register_data';

  static Future<void> saveRegisterData(RegisterModel model) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonData = jsonEncode(model.toJson());
    await prefs.setString(_registerKey, jsonData);
  }

  static Future<RegisterModel?> getRegisterData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonData = prefs.getString(_registerKey);
    if (jsonData != null) {
      return RegisterModel.fromJson(jsonDecode(jsonData));
    }
    return null;
  }
}

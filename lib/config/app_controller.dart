import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../Models/register_model.dart';

class AppController {
  static const String _registerKey = 'register_data';
  static const String _profileKey = 'user_profile';

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

  static Future<void> updateRegisterData({
    required String name,
    required String designation,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Load the existing data
    String? jsonData = prefs.getString(_registerKey);

    if (jsonData != null) {

      Map<String, dynamic> existingData = jsonDecode(jsonData);

      existingData['name'] = name;
      existingData['designation'] = designation;

      await prefs.setString(_registerKey, jsonEncode(existingData));
    } else {

      final newModel = RegisterModel(name: name, designation: designation);
      await prefs.setString(_registerKey, jsonEncode(newModel.toJson()));
    }
  }

  static Future<void> updateProfile({
    required String phone,
    required String dateOfBirth,
    required String email,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? jsonData = prefs.getString(_registerKey);

    if (jsonData != null) {

      Map<String, dynamic> existingData = jsonDecode(jsonData);

      existingData['phone_number'] = phone;
      existingData['dateOfBirth'] = dateOfBirth;
      existingData['email'] = email;
      await prefs.setString(_registerKey, jsonEncode(existingData));
    } else {

      final newModel = RegisterModel(phoneNumber: phone, dateOfBirth:dateOfBirth,email: email );
      await prefs.setString(_registerKey, jsonEncode(newModel.toJson()));
    }
  }

}

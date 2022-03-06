import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static storeName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (kDebugMode) {
      print(name);
    }
    prefs.setString("name", name);
  }

  static Future<String?> loadName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("name");
  }

  static Future<bool> removeName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("name");
  }
}

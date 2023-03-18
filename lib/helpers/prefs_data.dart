import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PrefsData {
  static setPref(String prefKey, data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogin', true);
    prefs.setString(prefKey, json.encode(data));
  }

  static getPref(String prefKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String savedData = prefs.getString(prefKey) ?? '[]';
    return json.decode(savedData);
  }
}

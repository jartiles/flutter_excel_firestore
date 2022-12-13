import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class Prefences {
  static late SharedPreferences _prefs;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static dontShowTutorial() {
    _prefs.setString('show_tutorial', 'dont');
  }

  static Future<String> showTutorial() async {
    return _prefs.getString('show_tutorial') ?? '';
  }
}

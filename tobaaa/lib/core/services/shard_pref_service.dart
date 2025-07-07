import 'package:shared_preferences/shared_preferences.dart';

class ShardPrefService {
  static late SharedPreferences prefs;

  static void init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static setInt(key, value) async {
    prefs.setInt(key, value);
  }

  static getInt(key) {
    return prefs.getInt(key) ?? 1;
  }
}

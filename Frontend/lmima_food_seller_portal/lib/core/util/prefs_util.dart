import 'package:shared_preferences/shared_preferences.dart';

import '../../locator.dart';

class PrefsUtil {
  static final SharedPreferences _prefs = locator<SharedPreferences>();

  static bool containsKey(String key) {
    return _prefs.containsKey(key);
  }

  static String? getString(String key) {
    return _prefs.getString(key);
  }

  static void setString(String key, String value) {
    _prefs.setString(key, value);
  }

  static void remove(String key) {
    _prefs.remove(key);
  }
}

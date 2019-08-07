import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtils {
  static Future<SharedPreferences> _prefsFuture =
      SharedPreferences.getInstance();
  static SharedPreferences _prefsInstance;

  static void init() async {
    _prefsInstance = await _prefsFuture;
  }

  static void dispose() {
    _prefsFuture = null;
    _prefsInstance = null;
  }

  static dynamic get(String key) {
    return _prefsInstance.get(key);
  }

  static Future<dynamic> getF(String key) async {
    dynamic value;
    if (_prefsInstance == null) {
      var instance = await _prefsFuture;
      value = instance.get(key);
    } else {
      value = get(key);
    }
    return value;
  }

  static Future<bool> setBool(String key, bool value) {
    return _prefsInstance.setBool(key, value);
  }

  static Future<bool> setString(String key, String value) {
    return _prefsInstance.setString(key, value);
  }

  static Future<bool> setInt(String key, int value) {
    return _prefsInstance.setInt(key, value);
  }

  static Future<bool> setDouble(String key, double value) {
    return _prefsInstance.setDouble(key, value);
  }

  static Future<bool> setStringList(String key, List<String> value) {
    return _prefsInstance.setStringList(key, value);
  }
}

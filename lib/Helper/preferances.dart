import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  static final Preference preference = Preference();
  Future<bool> saveString(String key, String value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(key, value);
  }

  Future<String?> getString(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(key);
  }

  Future<bool> saveBool(String key, bool value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setBool(key, value);
  }
   

  Future<bool?> getBool({String? key, bool? defVal}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(key!) ?? defVal;
  }
}
mixin PreferenceKey {
  static String database = 'databse';
  static String favouritenewslist = 'favouritenewslist';
}


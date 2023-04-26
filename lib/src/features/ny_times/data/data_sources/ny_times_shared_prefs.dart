import 'package:shared_preferences/shared_preferences.dart';

class NyTimesSharedPrefs {
  final SharedPreferences _preferences;

  NyTimesSharedPrefs(this._preferences);



  /// __________ Clear Storage __________ ///
  Future<bool> clearAllLocalData() async {
    return true;
  }
}

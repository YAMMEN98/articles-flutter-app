import 'package:shared_preferences/shared_preferences.dart';

class NyTimesArticlesSharedPrefs {
  final SharedPreferences _preferences;

  NyTimesArticlesSharedPrefs(this._preferences);

  /// __________ Clear Storage __________ ///
  Future<bool> clearAllLocalData() async {
    return true;
  }
}

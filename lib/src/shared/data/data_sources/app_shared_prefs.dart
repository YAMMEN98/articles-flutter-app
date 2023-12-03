import 'package:ny_times_app/src/shared/domain/entities/language_enum.dart';
import 'package:ny_times_app/src/core/utils/constant/local_storage_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPrefs {
  final SharedPreferences _preferences;

  AppSharedPrefs(this._preferences);

  /// __________ Language __________ ///
  LanguageEnum? getLang() {
    String? data = _preferences.getString(lang);
    if (data == null) {
      return LanguageEnum.en;
    }
    return LanguageEnum.values.firstWhere((element) => element.local == data);
  }

  void setLang(LanguageEnum language) {
    _preferences.setString(lang, language.local);
  }

  /// __________ Dark Theme __________ ///
  bool getIsDarkTheme() {
    return _preferences.getBool(theme) ?? false;
  }

  void setDarkTheme(bool isDark) {
    _preferences.setBool(theme, isDark);
  }
}

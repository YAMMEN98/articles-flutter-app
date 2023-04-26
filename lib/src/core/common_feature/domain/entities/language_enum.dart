import 'package:ny_times_app/main.dart';
import 'package:ny_times_app/src/core/translations/l10n.dart';

enum LanguageEnum {
  ar, // Arabic
  en, // English
}

extension LanguageEnumExtension on LanguageEnum {
  String get local {
    switch (this) {
      case LanguageEnum.ar:
        return "ar";

      case LanguageEnum.en:
        return "en";

      default:
        return "1";
    }
  }

  String get localHeader {
    switch (this) {
      case LanguageEnum.ar:
        return "ar_AE";

      case LanguageEnum.en:
        return "en_US";

      default:
        return "en_US";
    }
  }

  String get langName {
    switch (this) {
      case LanguageEnum.ar:
        return S.of(navigatorKey.currentContext!).arabic;

      case LanguageEnum.en:
        return S.of(navigatorKey.currentContext!).english;

      default:
        return S.of(navigatorKey.currentContext!).english;
    }
  }
}

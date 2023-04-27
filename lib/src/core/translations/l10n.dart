// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `العربية`
  String get arabic {
    return Intl.message(
      'العربية',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `NY Times Most Popular`
  String get ny_times_most_popular {
    return Intl.message(
      'NY Times Most Popular',
      name: 'ny_times_most_popular',
      desc: '',
      args: [],
    );
  }

  /// `Required Field`
  String get required_field {
    return Intl.message(
      'Required Field',
      name: 'required_field',
      desc: '',
      args: [],
    );
  }

  /// `Dark Skin`
  String get dark_skin {
    return Intl.message(
      'Dark Skin',
      name: 'dark_skin',
      desc: '',
      args: [],
    );
  }

  /// `Light Skin`
  String get light_skin {
    return Intl.message(
      'Light Skin',
      name: 'light_skin',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// ` Pull Up Load`
  String get pull_up_load {
    return Intl.message(
      ' Pull Up Load',
      name: 'pull_up_load',
      desc: '',
      args: [],
    );
  }

  /// `Load failed! Click Retry!`
  String get load_failed {
    return Intl.message(
      'Load failed! Click Retry!',
      name: 'load_failed',
      desc: '',
      args: [],
    );
  }

  /// `Release To Load More`
  String get release_to_load {
    return Intl.message(
      'Release To Load More',
      name: 'release_to_load',
      desc: '',
      args: [],
    );
  }

  /// `No Data!`
  String get no_data {
    return Intl.message(
      'No Data!',
      name: 'no_data',
      desc: '',
      args: [],
    );
  }

  /// `Period`
  String get period {
    return Intl.message(
      'Period',
      name: 'period',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Server Error`
  String get server_error {
    return Intl.message(
      'Server Error',
      name: 'server_error',
      desc: '',
      args: [],
    );
  }

  /// `Article Details`
  String get article_details {
    return Intl.message(
      'Article Details',
      name: 'article_details',
      desc: '',
      args: [],
    );
  }

  /// `See More`
  String get see_more {
    return Intl.message(
      'See More',
      name: 'see_more',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

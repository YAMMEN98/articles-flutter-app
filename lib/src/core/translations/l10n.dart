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

  /// `Explore`
  String get explorer {
    return Intl.message(
      'Explore',
      name: 'explorer',
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

  /// `Type to Search`
  String get type_to_search {
    return Intl.message(
      'Type to Search',
      name: 'type_to_search',
      desc: '',
      args: [],
    );
  }

  /// `All Movies`
  String get all_movies {
    return Intl.message(
      'All Movies',
      name: 'all_movies',
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

  /// `No More Data`
  String get no_more_data {
    return Intl.message(
      'No More Data',
      name: 'no_more_data',
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

  /// `Ratings`
  String get ratings {
    return Intl.message(
      'Ratings',
      name: 'ratings',
      desc: '',
      args: [],
    );
  }

  /// `Actors`
  String get actors {
    return Intl.message(
      'Actors',
      name: 'actors',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
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

  /// `Reset`
  String get reset {
    return Intl.message(
      'Reset',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Movie`
  String get movie {
    return Intl.message(
      'Movie',
      name: 'movie',
      desc: '',
      args: [],
    );
  }

  /// `Series`
  String get series {
    return Intl.message(
      'Series',
      name: 'series',
      desc: '',
      args: [],
    );
  }

  /// `Episode`
  String get episode {
    return Intl.message(
      'Episode',
      name: 'episode',
      desc: '',
      args: [],
    );
  }

  /// `Movie Type`
  String get movie_type {
    return Intl.message(
      'Movie Type',
      name: 'movie_type',
      desc: '',
      args: [],
    );
  }

  /// `Type in search field to complete filtering process`
  String get type_in_search_to_filter {
    return Intl.message(
      'Type in search field to complete filtering process',
      name: 'type_in_search_to_filter',
      desc: '',
      args: [],
    );
  }

  /// `Enter Year`
  String get enter_year {
    return Intl.message(
      'Enter Year',
      name: 'enter_year',
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

  /// `Start your search for movies`
  String get start_search {
    return Intl.message(
      'Start your search for movies',
      name: 'start_search',
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

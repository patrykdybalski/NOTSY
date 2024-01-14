// import 'package:flutter/material.dart';
// import 'package:intl/locale.dart';
// import 'package:primary_school/app/root_page/root_page.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class MultiLanguages {
//   final Locale locale;
//   MultiLanguages({this.locale = const Locale.fromSubtags(languageCode: 'pl')});

//   static MultiLanguages? of(BuildContext context) {
//     return Localizations.of<MultiLanguages>(context, MultiLanguages);
//   }

//   void keepLocaleKey(String localeKey) async {
//     final _prefs = await SharedPreferences.getInstance();
//     await _prefs.remove("localeKey");
//     await _prefs.setString("localeKey", localeKey);
//   }

//   Future<String> readLocaleKey() async {
//     final _prefs = await SharedPreferences.getInstance();
//     return _prefs.getString("localeKey") ?? 'en';
//   }

//   void setLocale(BuildContext context, Locale locale) {
//     keepLocaleKey(locale.languageCode);
//     print("key language :${locale.languageCode}");
//     MyApp.setLocale(context, locale);
//   }

//   static const LocalizationsDelegate<MultiLanguages> delegate =
//       _MultiLanguagesDelegate();

//   late Map<String, String> _localizedStrings;

//   Future<bool> load() async {
//     String jsonString = await rootBundle.loadString('lib/l10n/${locale.languageCode}')
//   }
// }

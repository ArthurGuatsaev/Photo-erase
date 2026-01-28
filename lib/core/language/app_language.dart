import 'package:flutter/widgets.dart';

class Language {
  final String code;
  final String name;

  const Language({required this.code, required this.name});

  Locale get locale {
    final parts = code.split('-');
    return parts.length == 2 ? Locale(parts[0], parts[1]) : Locale(parts[0]);
  }
}

class AppLanguages {
  AppLanguages._();

  static const fallback = Locale('en');

  static const List<Language> all = [
    Language(code: 'en', name: 'English'),
    Language(code: 'de', name: 'Deutsch'),
    Language(code: 'pt-BR', name: 'Português (Brasil)'),
    Language(code: 'pt-PT', name: 'Português (Portugal)'),
    Language(code: 'it', name: 'Italiano'),
    Language(code: 'es', name: 'Español'),
    Language(code: 'es-MX', name: 'Español (México)'),
    Language(code: 'fr', name: 'Français'),
    Language(code: 'ko', name: '한국어'),
    Language(code: 'ja', name: '日本語'),
    Language(code: 'nl', name: 'Nederlands'),
    Language(code: 'da', name: 'Dansk'),
    Language(code: 'pl', name: 'Polski'),
    Language(code: 'fi', name: 'Suomi'),
    Language(code: 'hu', name: 'Magyar'),
    Language(code: 'hr', name: 'Hrvatski'),
    Language(code: 'nb', name: 'Norsk Bokmål'),
    Language(code: 'ro', name: 'Română'),
    Language(code: 'sk', name: 'Slovenčina'),
    Language(code: 'tr', name: 'Türkçe'),
    Language(code: 'ms', name: 'Bahasa Melayu'),
    Language(code: 'th', name: 'ไทย'),
    Language(code: 'vi', name: 'Tiếng Việt'),
    Language(code: 'cs', name: 'Čeština'),
    Language(code: 'el', name: 'Ελληνικά'),
    Language(code: 'id', name: 'Bahasa Indonesia'),
  ];

  static final List<Locale> supportedLocales = List<Locale>.unmodifiable(
    all.map((l) => l.locale),
  );

  static Language fromLocale(Locale locale) {
    final fullCode = (locale.countryCode == null || locale.countryCode!.isEmpty)
        ? locale.languageCode
        : '${locale.languageCode}-${locale.countryCode}';
    for (final l in all) {
      if (l.code == fullCode) return l;
    }
    for (final l in all) {
      if (l.code == locale.languageCode) return l;
    }
    return Language(code: fullCode, name: fullCode);
  }
}

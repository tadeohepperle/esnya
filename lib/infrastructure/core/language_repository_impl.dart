import 'package:esnya/domain/core/language.dart';
import 'package:esnya/domain/core/language_repository.dart';
import 'package:intl/intl.dart';

class LanguageRepositoryImpl implements LanguageRepository {
  @override
  Language get currentLanguage {
    final localeShort = Intl.systemLocale.substring(0, 2);
    return Language.languages.firstWhere(
        (l) => l.locale.languageCode == localeShort,
        orElse: () => Language.defaultLanguage);
  }
}

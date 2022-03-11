import 'package:esnya/presentation/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'language.freezed.dart';

@freezed
abstract class Language with _$Language {
  const factory Language(
      {required String name,
      required String nativeName,
      required Locale locale}) = _Language;

  static const Language german = Language(
      name: "German", nativeName: "Deutsch", locale: Locale('de', 'DE'));
  static const Language english = Language(
      name: "English", nativeName: "English", locale: Locale('en', 'US'));
  static const List<Language> languages = [english, german];
  static get defaultLanguage => english;
}

import 'package:esnya_shared_resources/language/language_repository.dart';
import 'package:esnya_shared_resources/language/models/language.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LanguageRepository)
class LanguageRepositoryImpl extends LanguageRepository {
  @override
  Language get currentLanguage => Language.english; // TODO: has to change
}

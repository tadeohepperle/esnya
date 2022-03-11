import 'package:esnya/domain/core/language.dart';
import 'package:esnya/domain/food_data/text_processing/text_processing_repository.dart';
import '../../../domain/core/data_structures.dart';
import '../../../domain/core/language_repository.dart';
import 'fragmentizing/fragmentizing_engine.dart';
import 'fragmentizing/fragmentizing_engine_de.dart';
import 'fragmentizing/fragmentizing_engine_en.dart';

class TextProcessingRepositoryImpl implements TextProcessingRepository {
  LanguageRepository languageRepository;
  TextProcessingRepositoryImpl(this.languageRepository);

  @override
  Future<FragmentizeResult> fragmentize(String text) {
    FragmentizingEngine engine =
        fragmentizingEngines[languageRepository.currentLanguage] ??
            standardFragmentizingEngine;
    return engine.fragmentize(text);
  }

  static final standardFragmentizingEngine = FragmentizingEngineEN();
  static final fragmentizingEngines = {
    Language.english: standardFragmentizingEngine,
    Language.german: FragmentizingEngineDE(),
  };
}

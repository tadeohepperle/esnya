import 'package:esnya/domain/food_data/text_processing/text_processing_repository.dart';
import 'package:intl/intl.dart';
import '../../../domain/core/data_structures.dart';
import 'fragmentizing/fragmentizing_engine.dart';
import 'fragmentizing/fragmentizing_engine_de.dart';
import 'fragmentizing/fragmentizing_engine_en.dart';

class TextProcessingRepositoryImpl implements TextProcessingRepository {
  @override
  Future<FragmentizeResult> fragmentize(String text) {
    final localeShort = Intl.systemLocale.substring(0, 2);
    FragmentizingEngine engine =
        fragmentizingEngines[localeShort] ?? standardFragmentizingEngine;
    return engine.fragmentize(text);
  }

  static final standardFragmentizingEngine = FragmentizingEngineEN();
  static final fragmentizingEngines = {
    'en': standardFragmentizingEngine,
    'de': FragmentizingEngineDE(),
  };
}

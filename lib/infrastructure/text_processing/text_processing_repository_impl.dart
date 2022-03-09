import 'package:esnya/domain/text_processing/text_processing_repository.dart';
import 'package:esnya/infrastructure/text_processing/fragmentizing/fragmentizing_engine.dart';
import 'package:esnya/infrastructure/text_processing/fragmentizing/fragmentizing_engine_en.dart';
import 'package:intl/intl.dart';
import 'fragmentizing/fragmentizing_engine_de.dart';

class TextProcessingRepositoryImpl implements TextProcessingRepository {
  @override
  FragmentizeResult fragmentize(String text) {
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

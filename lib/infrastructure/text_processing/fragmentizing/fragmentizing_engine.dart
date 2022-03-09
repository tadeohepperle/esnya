import 'package:esnya/domain/text_processing/text_processing_repository.dart';
import 'package:kt_dart/kt.dart';

abstract class FragmentizingEngine {
  FragmentizeResult fragmentize(String text);
}

import '../../core/data_structures.dart';

abstract class TextProcessingRepository {
  Future<FragmentizeResult> fragmentize(String text);
}

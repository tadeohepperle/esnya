import '../../../../domain/core/data_structures.dart';
import 'fragmentizing_engine.dart';

class FragmentizingEngineDE implements FragmentizingEngine {
  @override
  Future<FragmentizeResult> fragmentize(String text) {
    throw Exception("err");
  }

  @override
  Future<num> numberStringToText(String numberString) {
    // TODO: implement numberStringToText
    throw UnimplementedError();
  }
}
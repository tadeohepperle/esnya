import 'package:dartz/dartz.dart';
import 'package:esnya/domain/core/failures.dart';
import 'package:kt_dart/kt.dart';

import '../../core/data_structures.dart';
import '../food_data.dart';

abstract class TextProcessingRepository {
  Future<FragmentizeResult> fragmentize(String text);
}

import 'package:dartz/dartz.dart';
import 'package:esnya/domain/core/failures.dart';
import 'package:kt_dart/kt.dart';

import '../core/data_structures.dart';
import '../food_data/food_data.dart';

typedef FragmentizeResult = Future<
    Either<TextFragmentizeFailure, KtList<Tuple2<IntRange, FoodItemString>>>>;

abstract class TextProcessingRepository {
  FragmentizeResult fragmentize(String text);
}

import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';

import 'package:esnya/domain/core/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../food_data/entities/food_item_string.dart';

part 'data_structures.freezed.dart';

typedef FragmentizeResult
    = Either<TextFragmentizeFailure, KtList<Tuple2<IntRange, FoodItemString>>>;

@freezed
abstract class IntRange with _$IntRange {
  const factory IntRange(int start, int end) = _IntRange;
}

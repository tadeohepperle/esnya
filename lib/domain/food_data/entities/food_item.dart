import 'package:dartz/dartz.dart';
import 'package:esnya/domain/core/unique_id.dart';
import 'package:esnya/domain/food_data/entities/food_item_string.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/failures.dart';
import 'food.dart';
import 'amount.dart';

part 'food_item.freezed.dart';

@freezed
class FoodItemValue with _$FoodItemValue {
  factory FoodItemValue({required Amount amount, required Food food}) =
      _FoodItemValue;
}

@freezed
abstract class FoodItem with _$FoodItem {
  const FoodItem._();
  const factory FoodItem({
    required FoodItemString string,
    required Option<Either<Failure, FoodItemValue>> value,
    required UniqueId uniqueId,
  }) = _FoodItem;
  factory FoodItem.create(FoodItemString string) => FoodItem(
        string: string,
        value: none(),
        uniqueId: UniqueId(),
      );
}


// TODO: transform into validated value object! but async!!!!

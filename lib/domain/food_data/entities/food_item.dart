import 'package:esnya/domain/food_data/entities/food_item_status.dart';
import 'package:esnya/domain/food_data/entities/food_item_string.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'food.dart';
import 'amount.dart';

part 'food_item.freezed.dart';

@freezed
abstract class FoodItem with _$FoodItem {
  const factory FoodItem({
    required FoodItemString foodItemString,
    required FoodItemStatus status,
    Food? food,
    Amount? amount,
  }) = _FoodItem;
  factory FoodItem.created(FoodItemString foodItemString) => FoodItem(
        foodItemString: foodItemString,
        status: FoodItemStatusCreated(),
      );
}

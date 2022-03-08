import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_item_status.freezed.dart';

@freezed
abstract class FoodItemStatus with _$FoodItemStatus {
  const factory FoodItemStatus.created() = FoodItemStatusCreated;
  const factory FoodItemStatus.loading() = FoodItemStatusLoading;
  const factory FoodItemStatus.success() = FoodItemStatusSuccess;
  const factory FoodItemStatus.error(String message) = FoodItemStatusError;
}

import 'package:esnya_shared_resources/core/core.dart';
import 'package:esnya_shared_resources/food_mapping/models/food_mapping_result.dart';
import 'package:esnya_shared_resources/text_processing/models/food_item_string.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_item_entry_wrapper.freezed.dart';

/// can be seen as a preliminary FoodItemEntry that can be either processing, failed or successful in the recognition of the food.
/// A FoodItemEntry is always successful and stored in Firestore, while FoodItemEntryWrapper is only used in the food input bloc to represent temporary states.
@freezed
abstract class FoodItemEntryWrapper with _$FoodItemEntryWrapper {
  const factory FoodItemEntryWrapper.success(FoodItemEntry entry) =
      FoodItemEntrySuccess;

  const factory FoodItemEntryWrapper.processing({
    required UniqueId uniqueId,
    required DateTime dateTime,
    // label from FoodItemString
    required String inputFoodName,
    // comes from FoodItemString directly
    required Amount amount,
  }) = FoodItemEntryProcessing;

  const factory FoodItemEntryWrapper.failed({
    required UniqueId uniqueId,
    required DateTime dateTime,
    // label from FoodItemString
    required String inputFoodName,
    // comes from FoodItemString directly
    required Amount amount,
  }) = FoodItemEntryFailed;
}

extension FoodItemEntryWrapperX on FoodItemEntryWrapper {
  FoodItemEntrySuccess toSuccess(FoodMappingResult result) {
    return map(
      success: (_) => FoodItemEntrySuccess(
        FoodItemEntry(
          id: _.id,
          dateTime: _.entry.dateTime,
          input: result.input,
          foodMappingObject: result.foodMappingObject,
          foodItem: FoodItem(_.entry.foodItem.amount, result.food),
        ),
      ),
      processing: (_) => FoodItemEntrySuccess(
        FoodItemEntry(
          id: _.id,
          dateTime: _.dateTime,
          input: result.input,
          foodMappingObject: result.foodMappingObject,
          foodItem: FoodItem(_.amount, result.food),
        ),
      ),
      failed: (_) => FoodItemEntrySuccess(
        FoodItemEntry(
          id: _.id,
          dateTime: _.dateTime,
          input: result.input,
          foodMappingObject: result.foodMappingObject,
          foodItem: FoodItem(_.amount, result.food),
        ),
      ),
    );
  }

  FoodItemEntryFailed toFailed() {
    return map(
      success: (_) => FoodItemEntryFailed(
        uniqueId: id,
        amount: _.entry.foodItem.amount,
        dateTime: _.entry.dateTime,
        inputFoodName: _.entry.input,
      ),
      processing: (_) => FoodItemEntryFailed(
        uniqueId: id,
        amount: _.amount,
        dateTime: _.dateTime,
        inputFoodName: _.inputFoodName,
      ),
      failed: (_) => FoodItemEntryFailed(
        uniqueId: id,
        amount: _.amount,
        dateTime: _.dateTime,
        inputFoodName: _.inputFoodName,
      ),
    );
  }

  String get inputString => map(
      success: (_) => _.entry.input,
      processing: (_) => _.inputFoodName,
      failed: (_) => _.inputFoodName);

  UniqueId get id => map(
      success: (_) => _.entry.id,
      processing: (_) => _.uniqueId,
      failed: (_) => _.uniqueId);
}

extension FoodItemStringX on FoodItemString {
  FoodItemEntryProcessing toFoodItemEntryProcessing() {
    return FoodItemEntryProcessing(
      uniqueId: UniqueId.orderedFromTime(),
      dateTime: DateTime.now(),
      // the input user has given, uncorrected.
      inputFoodName: label,
      amount: Amount(unitGuess, numberGuess),
    );
  }
}

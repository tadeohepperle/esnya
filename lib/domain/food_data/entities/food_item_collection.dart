import 'package:esnya/domain/core/unique_id.dart';
import 'package:esnya/domain/food_data/entities/food_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:kt_dart/collection.dart';

abstract class FoodItemCollection extends ChangeNotifier {
  KtList<FoodItem> items = <FoodItem>[].toImmutableList();
  final UniqueId uniqueId;
  FoodItemCollection(this.uniqueId);

  Future<void> syncUp();

  void add();
}

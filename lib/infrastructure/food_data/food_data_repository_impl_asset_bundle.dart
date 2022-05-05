import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:esnya/injection_environments.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

const String assetKeyFoodCsv = 'assets/f.csv';

Future<List<Food>> _loadFoodsFromAssets() async {
  final csvString = await rootBundle.loadString(assetKeyFoodCsv);
  return CsvHelpers.objectsFromCsv(csvString, Food.fromList, header: true);
}

@isolate2
@LazySingleton(as: FoodDataRepository)
class FoodDataRepositoryImplAssetBundle extends FoodDataRepositoryLocalImpl {
  FoodDataRepositoryImplAssetBundle() : super(right(_loadFoodsFromAssets));
}

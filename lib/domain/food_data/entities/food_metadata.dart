import 'package:equatable/equatable.dart';
import 'package:esnya/domain/food_data/entities/measure_unit.dart';
import 'package:esnya/presentation/core/core.dart';

import 'amount.dart';

@immutable
class FoodMetadata extends Equatable {
  final double density;
  final Amount servingAmount;
  // TODO things like custom serving sizes for example one glass of whiskey different to one glass of beer...
  const FoodMetadata({double? density, Amount? servingAmount})
      : density = density ?? 1,
        servingAmount = servingAmount ?? const Amount(250);

  @override
  List<Object?> get props => [density];
}

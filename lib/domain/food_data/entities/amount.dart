import 'package:equatable/equatable.dart';
import 'package:esnya/domain/food_data/entities/food_metadata.dart';
import 'package:esnya/domain/food_data/entities/measure_unit.dart';
import 'package:esnya/presentation/core/core.dart';

@immutable
class Amount extends Equatable {
  final MeasureUnit unit;
  final num number; //

  const Amount(this.number, [this.unit = MeasureUnit.g]);

  @override
  List<Object?> get props => [unit, number];

  Amount convertTo(MeasureUnit otherUnit, FoodMetadata foodMetadata) {
    // TODO: implement
    throw UnimplementedError();
  }
}

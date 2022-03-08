import 'package:freezed_annotation/freezed_annotation.dart';
part 'amount.freezed.dart';

///
/// represents food items saved in database.
@freezed
class Amount with _$Amount {
  const factory Amount.numerical(num number) = AmountNumerical;
  const factory Amount.mass(num number, AmountMassUnit unit) = AmountMass;
  const factory Amount.volume(num number, AmountVolumeUnit unit) = AmountVolume;
}

enum AmountMassUnit { kg, g, oz, lb }

enum AmountVolumeUnit { tsp, tbsp, ml, l, cup }

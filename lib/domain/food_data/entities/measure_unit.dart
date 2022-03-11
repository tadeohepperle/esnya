import 'package:equatable/equatable.dart';

class MeasureUnit extends Equatable {
  final MeasureUnitMode mode;
  final num baseUnitEquivalent; //
  const MeasureUnit._(this.mode, this.baseUnitEquivalent);

  static const MeasureUnit noUnit = MeasureUnit._(MeasureUnitMode.noUnit, 1);

  static const MeasureUnit g = MeasureUnit._(MeasureUnitMode.mass, 1);
  static const MeasureUnit kg = MeasureUnit._(MeasureUnitMode.mass, 1000);
  static const MeasureUnit ton = MeasureUnit._(MeasureUnitMode.mass, 100000);
  static const MeasureUnit mg = MeasureUnit._(MeasureUnitMode.mass, 0.001);
  static const MeasureUnit oz = MeasureUnit._(MeasureUnitMode.mass, 28.3495);
  static const MeasureUnit lbs = MeasureUnit._(MeasureUnitMode.mass, 453.592);

  static const MeasureUnit ml = MeasureUnit._(MeasureUnitMode.volume, 1);
  static const MeasureUnit l = MeasureUnit._(MeasureUnitMode.volume, 1000);
  static const MeasureUnit tsp = MeasureUnit._(MeasureUnitMode.volume, 4.92893);
  static const MeasureUnit tbsp =
      MeasureUnit._(MeasureUnitMode.volume, 14.7868);
  static const MeasureUnit cup =
      MeasureUnit._(MeasureUnitMode.volume, 236.5888);
  static const MeasureUnit gallon =
      MeasureUnit._(MeasureUnitMode.mass, 3785.4208);

  @override
  List<Object?> get props => [mode, baseUnitEquivalent];

  @override
  String toString() {
    return unitNames[unitNames.keys.firstWhere((c) => c == this)] ??
        'unitError';
    // String unitName =
    //     unitNames[unitNames.keys.firstWhere((c) => c == this)] ?? 'noUnit';
    // Map<MeasureUnitMode, String> unitModeNames = {
    //   MeasureUnitMode.noUnit: 'NOUNIT',
    //   MeasureUnitMode.mass: 'MASS',
    //   MeasureUnitMode.volume: 'VOLUME'
    // };
    // return 'MeasureUnit($unitName, ${unitModeNames[mode]}, baseEquivalent: $baseUnitEquivalent)';
  }

  static final unitNames = {
    noUnit: 'noUnit',
    g: 'g',
    kg: 'kg',
    ton: 'ton',
    mg: 'mg',
    oz: 'oz',
    lbs: 'lbs',
    ml: 'ml',
    l: 'l',
    tsp: 'tsp',
    tbsp: 'tbsp',
    cup: 'cup',
    gallon: 'gallon'
  };
}

enum MeasureUnitMode { noUnit, mass, volume }

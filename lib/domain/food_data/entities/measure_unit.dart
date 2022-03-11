import 'package:equatable/equatable.dart';

class MeasureUnit extends Equatable {
  final MeasureUnitMode mode;
  final num baseUnitEquivalent; //
  const MeasureUnit(this.mode, this.baseUnitEquivalent);

  static const MeasureUnit noUnit = MeasureUnit(MeasureUnitMode.noUnit, 1);

  static const MeasureUnit g = MeasureUnit(MeasureUnitMode.mass, 1);
  static const MeasureUnit kg = MeasureUnit(MeasureUnitMode.mass, 1000);
  static const MeasureUnit ton = MeasureUnit(MeasureUnitMode.mass, 100000);
  static const MeasureUnit mg = MeasureUnit(MeasureUnitMode.mass, 0.001);
  static const MeasureUnit oz = MeasureUnit(MeasureUnitMode.mass, 28.3495);
  static const MeasureUnit lbs = MeasureUnit(MeasureUnitMode.mass, 453.592);

  static const MeasureUnit ml = MeasureUnit(MeasureUnitMode.volume, 1);
  static const MeasureUnit l = MeasureUnit(MeasureUnitMode.volume, 1000);
  static const MeasureUnit tsp = MeasureUnit(MeasureUnitMode.volume, 4.92893);
  static const MeasureUnit tbsp = MeasureUnit(MeasureUnitMode.volume, 14.7868);
  static const MeasureUnit cup = MeasureUnit(MeasureUnitMode.volume, 236.5888);
  static const MeasureUnit gallon =
      MeasureUnit(MeasureUnitMode.mass, 3785.4208);

  @override
  List<Object?> get props => [mode, baseUnitEquivalent];

  @override
  String toString() {
    String unitName =
        unitNames[unitNames.keys.firstWhere((c) => c == this)] ?? 'noUnit';
    Map<MeasureUnitMode, String> unitModeNames = {
      MeasureUnitMode.noUnit: 'NOUNIT',
      MeasureUnitMode.mass: 'MASS',
      MeasureUnitMode.volume: 'VOLUME'
    };
    return 'MeasureUnit($unitName, ${unitModeNames[mode]}, baseEquivalent: $baseUnitEquivalent)';
  }

  static final unitNames = {
    noUnit: 'noUnit',
    g: 'g',
    kg: 'kg',
    ton: 'ton',
    mg: 'mg',
    oz: 'oz',
    lbs: 'lbs',
    ml: 'm',
    l: 'l',
    tsp: 'tsp',
    tbsp: 'tbsp',
    cup: 'cup',
    gallon: 'gallon'
  };
}

enum MeasureUnitMode { noUnit, mass, volume }

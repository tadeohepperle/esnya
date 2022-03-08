// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'amount.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AmountTearOff {
  const _$AmountTearOff();

  AmountNumerical numerical(num number) {
    return AmountNumerical(
      number,
    );
  }

  AmountMass mass(num number, AmountMassUnit unit) {
    return AmountMass(
      number,
      unit,
    );
  }

  AmountVolume volume(num number, AmountVolumeUnit unit) {
    return AmountVolume(
      number,
      unit,
    );
  }
}

/// @nodoc
const $Amount = _$AmountTearOff();

/// @nodoc
mixin _$Amount {
  num get number => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(num number) numerical,
    required TResult Function(num number, AmountMassUnit unit) mass,
    required TResult Function(num number, AmountVolumeUnit unit) volume,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(num number)? numerical,
    TResult Function(num number, AmountMassUnit unit)? mass,
    TResult Function(num number, AmountVolumeUnit unit)? volume,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(num number)? numerical,
    TResult Function(num number, AmountMassUnit unit)? mass,
    TResult Function(num number, AmountVolumeUnit unit)? volume,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AmountNumerical value) numerical,
    required TResult Function(AmountMass value) mass,
    required TResult Function(AmountVolume value) volume,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AmountNumerical value)? numerical,
    TResult Function(AmountMass value)? mass,
    TResult Function(AmountVolume value)? volume,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AmountNumerical value)? numerical,
    TResult Function(AmountMass value)? mass,
    TResult Function(AmountVolume value)? volume,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AmountCopyWith<Amount> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AmountCopyWith<$Res> {
  factory $AmountCopyWith(Amount value, $Res Function(Amount) then) =
      _$AmountCopyWithImpl<$Res>;
  $Res call({num number});
}

/// @nodoc
class _$AmountCopyWithImpl<$Res> implements $AmountCopyWith<$Res> {
  _$AmountCopyWithImpl(this._value, this._then);

  final Amount _value;
  // ignore: unused_field
  final $Res Function(Amount) _then;

  @override
  $Res call({
    Object? number = freezed,
  }) {
    return _then(_value.copyWith(
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
abstract class $AmountNumericalCopyWith<$Res> implements $AmountCopyWith<$Res> {
  factory $AmountNumericalCopyWith(
          AmountNumerical value, $Res Function(AmountNumerical) then) =
      _$AmountNumericalCopyWithImpl<$Res>;
  @override
  $Res call({num number});
}

/// @nodoc
class _$AmountNumericalCopyWithImpl<$Res> extends _$AmountCopyWithImpl<$Res>
    implements $AmountNumericalCopyWith<$Res> {
  _$AmountNumericalCopyWithImpl(
      AmountNumerical _value, $Res Function(AmountNumerical) _then)
      : super(_value, (v) => _then(v as AmountNumerical));

  @override
  AmountNumerical get _value => super._value as AmountNumerical;

  @override
  $Res call({
    Object? number = freezed,
  }) {
    return _then(AmountNumerical(
      number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc

class _$AmountNumerical implements AmountNumerical {
  const _$AmountNumerical(this.number);

  @override
  final num number;

  @override
  String toString() {
    return 'Amount.numerical(number: $number)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AmountNumerical &&
            const DeepCollectionEquality().equals(other.number, number));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(number));

  @JsonKey(ignore: true)
  @override
  $AmountNumericalCopyWith<AmountNumerical> get copyWith =>
      _$AmountNumericalCopyWithImpl<AmountNumerical>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(num number) numerical,
    required TResult Function(num number, AmountMassUnit unit) mass,
    required TResult Function(num number, AmountVolumeUnit unit) volume,
  }) {
    return numerical(number);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(num number)? numerical,
    TResult Function(num number, AmountMassUnit unit)? mass,
    TResult Function(num number, AmountVolumeUnit unit)? volume,
  }) {
    return numerical?.call(number);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(num number)? numerical,
    TResult Function(num number, AmountMassUnit unit)? mass,
    TResult Function(num number, AmountVolumeUnit unit)? volume,
    required TResult orElse(),
  }) {
    if (numerical != null) {
      return numerical(number);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AmountNumerical value) numerical,
    required TResult Function(AmountMass value) mass,
    required TResult Function(AmountVolume value) volume,
  }) {
    return numerical(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AmountNumerical value)? numerical,
    TResult Function(AmountMass value)? mass,
    TResult Function(AmountVolume value)? volume,
  }) {
    return numerical?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AmountNumerical value)? numerical,
    TResult Function(AmountMass value)? mass,
    TResult Function(AmountVolume value)? volume,
    required TResult orElse(),
  }) {
    if (numerical != null) {
      return numerical(this);
    }
    return orElse();
  }
}

abstract class AmountNumerical implements Amount {
  const factory AmountNumerical(num number) = _$AmountNumerical;

  @override
  num get number;
  @override
  @JsonKey(ignore: true)
  $AmountNumericalCopyWith<AmountNumerical> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AmountMassCopyWith<$Res> implements $AmountCopyWith<$Res> {
  factory $AmountMassCopyWith(
          AmountMass value, $Res Function(AmountMass) then) =
      _$AmountMassCopyWithImpl<$Res>;
  @override
  $Res call({num number, AmountMassUnit unit});
}

/// @nodoc
class _$AmountMassCopyWithImpl<$Res> extends _$AmountCopyWithImpl<$Res>
    implements $AmountMassCopyWith<$Res> {
  _$AmountMassCopyWithImpl(AmountMass _value, $Res Function(AmountMass) _then)
      : super(_value, (v) => _then(v as AmountMass));

  @override
  AmountMass get _value => super._value as AmountMass;

  @override
  $Res call({
    Object? number = freezed,
    Object? unit = freezed,
  }) {
    return _then(AmountMass(
      number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as num,
      unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as AmountMassUnit,
    ));
  }
}

/// @nodoc

class _$AmountMass implements AmountMass {
  const _$AmountMass(this.number, this.unit);

  @override
  final num number;
  @override
  final AmountMassUnit unit;

  @override
  String toString() {
    return 'Amount.mass(number: $number, unit: $unit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AmountMass &&
            const DeepCollectionEquality().equals(other.number, number) &&
            const DeepCollectionEquality().equals(other.unit, unit));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(number),
      const DeepCollectionEquality().hash(unit));

  @JsonKey(ignore: true)
  @override
  $AmountMassCopyWith<AmountMass> get copyWith =>
      _$AmountMassCopyWithImpl<AmountMass>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(num number) numerical,
    required TResult Function(num number, AmountMassUnit unit) mass,
    required TResult Function(num number, AmountVolumeUnit unit) volume,
  }) {
    return mass(number, unit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(num number)? numerical,
    TResult Function(num number, AmountMassUnit unit)? mass,
    TResult Function(num number, AmountVolumeUnit unit)? volume,
  }) {
    return mass?.call(number, unit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(num number)? numerical,
    TResult Function(num number, AmountMassUnit unit)? mass,
    TResult Function(num number, AmountVolumeUnit unit)? volume,
    required TResult orElse(),
  }) {
    if (mass != null) {
      return mass(number, unit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AmountNumerical value) numerical,
    required TResult Function(AmountMass value) mass,
    required TResult Function(AmountVolume value) volume,
  }) {
    return mass(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AmountNumerical value)? numerical,
    TResult Function(AmountMass value)? mass,
    TResult Function(AmountVolume value)? volume,
  }) {
    return mass?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AmountNumerical value)? numerical,
    TResult Function(AmountMass value)? mass,
    TResult Function(AmountVolume value)? volume,
    required TResult orElse(),
  }) {
    if (mass != null) {
      return mass(this);
    }
    return orElse();
  }
}

abstract class AmountMass implements Amount {
  const factory AmountMass(num number, AmountMassUnit unit) = _$AmountMass;

  @override
  num get number;
  AmountMassUnit get unit;
  @override
  @JsonKey(ignore: true)
  $AmountMassCopyWith<AmountMass> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AmountVolumeCopyWith<$Res> implements $AmountCopyWith<$Res> {
  factory $AmountVolumeCopyWith(
          AmountVolume value, $Res Function(AmountVolume) then) =
      _$AmountVolumeCopyWithImpl<$Res>;
  @override
  $Res call({num number, AmountVolumeUnit unit});
}

/// @nodoc
class _$AmountVolumeCopyWithImpl<$Res> extends _$AmountCopyWithImpl<$Res>
    implements $AmountVolumeCopyWith<$Res> {
  _$AmountVolumeCopyWithImpl(
      AmountVolume _value, $Res Function(AmountVolume) _then)
      : super(_value, (v) => _then(v as AmountVolume));

  @override
  AmountVolume get _value => super._value as AmountVolume;

  @override
  $Res call({
    Object? number = freezed,
    Object? unit = freezed,
  }) {
    return _then(AmountVolume(
      number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as num,
      unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as AmountVolumeUnit,
    ));
  }
}

/// @nodoc

class _$AmountVolume implements AmountVolume {
  const _$AmountVolume(this.number, this.unit);

  @override
  final num number;
  @override
  final AmountVolumeUnit unit;

  @override
  String toString() {
    return 'Amount.volume(number: $number, unit: $unit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AmountVolume &&
            const DeepCollectionEquality().equals(other.number, number) &&
            const DeepCollectionEquality().equals(other.unit, unit));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(number),
      const DeepCollectionEquality().hash(unit));

  @JsonKey(ignore: true)
  @override
  $AmountVolumeCopyWith<AmountVolume> get copyWith =>
      _$AmountVolumeCopyWithImpl<AmountVolume>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(num number) numerical,
    required TResult Function(num number, AmountMassUnit unit) mass,
    required TResult Function(num number, AmountVolumeUnit unit) volume,
  }) {
    return volume(number, unit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(num number)? numerical,
    TResult Function(num number, AmountMassUnit unit)? mass,
    TResult Function(num number, AmountVolumeUnit unit)? volume,
  }) {
    return volume?.call(number, unit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(num number)? numerical,
    TResult Function(num number, AmountMassUnit unit)? mass,
    TResult Function(num number, AmountVolumeUnit unit)? volume,
    required TResult orElse(),
  }) {
    if (volume != null) {
      return volume(number, unit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AmountNumerical value) numerical,
    required TResult Function(AmountMass value) mass,
    required TResult Function(AmountVolume value) volume,
  }) {
    return volume(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AmountNumerical value)? numerical,
    TResult Function(AmountMass value)? mass,
    TResult Function(AmountVolume value)? volume,
  }) {
    return volume?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AmountNumerical value)? numerical,
    TResult Function(AmountMass value)? mass,
    TResult Function(AmountVolume value)? volume,
    required TResult orElse(),
  }) {
    if (volume != null) {
      return volume(this);
    }
    return orElse();
  }
}

abstract class AmountVolume implements Amount {
  const factory AmountVolume(num number, AmountVolumeUnit unit) =
      _$AmountVolume;

  @override
  num get number;
  AmountVolumeUnit get unit;
  @override
  @JsonKey(ignore: true)
  $AmountVolumeCopyWith<AmountVolume> get copyWith =>
      throw _privateConstructorUsedError;
}

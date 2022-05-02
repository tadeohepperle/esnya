// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'daily_nutrient_target.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DailyNutrientTarget _$DailyNutrientTargetFromJson(Map<String, dynamic> json) {
  return _DailyNutrientTarget.fromJson(json);
}

/// @nodoc
mixin _$DailyNutrientTarget {
  @NutrientTypeConverter()
  NutrientType get nutrientType => throw _privateConstructorUsedError;
  @AmountConverter()
  Amount get amount => throw _privateConstructorUsedError;
  DailyNutrientTargetMode get mode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DailyNutrientTargetCopyWith<DailyNutrientTarget> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyNutrientTargetCopyWith<$Res> {
  factory $DailyNutrientTargetCopyWith(
          DailyNutrientTarget value, $Res Function(DailyNutrientTarget) then) =
      _$DailyNutrientTargetCopyWithImpl<$Res>;
  $Res call(
      {@NutrientTypeConverter() NutrientType nutrientType,
      @AmountConverter() Amount amount,
      DailyNutrientTargetMode mode});

  $NutrientTypeCopyWith<$Res> get nutrientType;
  $AmountCopyWith<$Res> get amount;
}

/// @nodoc
class _$DailyNutrientTargetCopyWithImpl<$Res>
    implements $DailyNutrientTargetCopyWith<$Res> {
  _$DailyNutrientTargetCopyWithImpl(this._value, this._then);

  final DailyNutrientTarget _value;
  // ignore: unused_field
  final $Res Function(DailyNutrientTarget) _then;

  @override
  $Res call({
    Object? nutrientType = freezed,
    Object? amount = freezed,
    Object? mode = freezed,
  }) {
    return _then(_value.copyWith(
      nutrientType: nutrientType == freezed
          ? _value.nutrientType
          : nutrientType // ignore: cast_nullable_to_non_nullable
              as NutrientType,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
      mode: mode == freezed
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as DailyNutrientTargetMode,
    ));
  }

  @override
  $NutrientTypeCopyWith<$Res> get nutrientType {
    return $NutrientTypeCopyWith<$Res>(_value.nutrientType, (value) {
      return _then(_value.copyWith(nutrientType: value));
    });
  }

  @override
  $AmountCopyWith<$Res> get amount {
    return $AmountCopyWith<$Res>(_value.amount, (value) {
      return _then(_value.copyWith(amount: value));
    });
  }
}

/// @nodoc
abstract class _$DailyNutrientTargetCopyWith<$Res>
    implements $DailyNutrientTargetCopyWith<$Res> {
  factory _$DailyNutrientTargetCopyWith(_DailyNutrientTarget value,
          $Res Function(_DailyNutrientTarget) then) =
      __$DailyNutrientTargetCopyWithImpl<$Res>;
  @override
  $Res call(
      {@NutrientTypeConverter() NutrientType nutrientType,
      @AmountConverter() Amount amount,
      DailyNutrientTargetMode mode});

  @override
  $NutrientTypeCopyWith<$Res> get nutrientType;
  @override
  $AmountCopyWith<$Res> get amount;
}

/// @nodoc
class __$DailyNutrientTargetCopyWithImpl<$Res>
    extends _$DailyNutrientTargetCopyWithImpl<$Res>
    implements _$DailyNutrientTargetCopyWith<$Res> {
  __$DailyNutrientTargetCopyWithImpl(
      _DailyNutrientTarget _value, $Res Function(_DailyNutrientTarget) _then)
      : super(_value, (v) => _then(v as _DailyNutrientTarget));

  @override
  _DailyNutrientTarget get _value => super._value as _DailyNutrientTarget;

  @override
  $Res call({
    Object? nutrientType = freezed,
    Object? amount = freezed,
    Object? mode = freezed,
  }) {
    return _then(_DailyNutrientTarget(
      nutrientType: nutrientType == freezed
          ? _value.nutrientType
          : nutrientType // ignore: cast_nullable_to_non_nullable
              as NutrientType,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
      mode: mode == freezed
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as DailyNutrientTargetMode,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DailyNutrientTarget implements _DailyNutrientTarget {
  const _$_DailyNutrientTarget(
      {@NutrientTypeConverter() required this.nutrientType,
      @AmountConverter() required this.amount,
      required this.mode});

  factory _$_DailyNutrientTarget.fromJson(Map<String, dynamic> json) =>
      _$$_DailyNutrientTargetFromJson(json);

  @override
  @NutrientTypeConverter()
  final NutrientType nutrientType;
  @override
  @AmountConverter()
  final Amount amount;
  @override
  final DailyNutrientTargetMode mode;

  @override
  String toString() {
    return 'DailyNutrientTarget(nutrientType: $nutrientType, amount: $amount, mode: $mode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DailyNutrientTarget &&
            const DeepCollectionEquality()
                .equals(other.nutrientType, nutrientType) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.mode, mode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(nutrientType),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(mode));

  @JsonKey(ignore: true)
  @override
  _$DailyNutrientTargetCopyWith<_DailyNutrientTarget> get copyWith =>
      __$DailyNutrientTargetCopyWithImpl<_DailyNutrientTarget>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DailyNutrientTargetToJson(this);
  }
}

abstract class _DailyNutrientTarget implements DailyNutrientTarget {
  const factory _DailyNutrientTarget(
      {@NutrientTypeConverter() required final NutrientType nutrientType,
      @AmountConverter() required final Amount amount,
      required final DailyNutrientTargetMode mode}) = _$_DailyNutrientTarget;

  factory _DailyNutrientTarget.fromJson(Map<String, dynamic> json) =
      _$_DailyNutrientTarget.fromJson;

  @override
  @NutrientTypeConverter()
  NutrientType get nutrientType => throw _privateConstructorUsedError;
  @override
  @AmountConverter()
  Amount get amount => throw _privateConstructorUsedError;
  @override
  DailyNutrientTargetMode get mode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DailyNutrientTargetCopyWith<_DailyNutrientTarget> get copyWith =>
      throw _privateConstructorUsedError;
}

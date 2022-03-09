// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'food_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FoodItemValueTearOff {
  const _$FoodItemValueTearOff();

  _FoodItemValue call({required Amount amount, required Food food}) {
    return _FoodItemValue(
      amount: amount,
      food: food,
    );
  }
}

/// @nodoc
const $FoodItemValue = _$FoodItemValueTearOff();

/// @nodoc
mixin _$FoodItemValue {
  Amount get amount => throw _privateConstructorUsedError;
  Food get food => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FoodItemValueCopyWith<FoodItemValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodItemValueCopyWith<$Res> {
  factory $FoodItemValueCopyWith(
          FoodItemValue value, $Res Function(FoodItemValue) then) =
      _$FoodItemValueCopyWithImpl<$Res>;
  $Res call({Amount amount, Food food});

  $AmountCopyWith<$Res> get amount;
  $FoodCopyWith<$Res> get food;
}

/// @nodoc
class _$FoodItemValueCopyWithImpl<$Res>
    implements $FoodItemValueCopyWith<$Res> {
  _$FoodItemValueCopyWithImpl(this._value, this._then);

  final FoodItemValue _value;
  // ignore: unused_field
  final $Res Function(FoodItemValue) _then;

  @override
  $Res call({
    Object? amount = freezed,
    Object? food = freezed,
  }) {
    return _then(_value.copyWith(
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
      food: food == freezed
          ? _value.food
          : food // ignore: cast_nullable_to_non_nullable
              as Food,
    ));
  }

  @override
  $AmountCopyWith<$Res> get amount {
    return $AmountCopyWith<$Res>(_value.amount, (value) {
      return _then(_value.copyWith(amount: value));
    });
  }

  @override
  $FoodCopyWith<$Res> get food {
    return $FoodCopyWith<$Res>(_value.food, (value) {
      return _then(_value.copyWith(food: value));
    });
  }
}

/// @nodoc
abstract class _$FoodItemValueCopyWith<$Res>
    implements $FoodItemValueCopyWith<$Res> {
  factory _$FoodItemValueCopyWith(
          _FoodItemValue value, $Res Function(_FoodItemValue) then) =
      __$FoodItemValueCopyWithImpl<$Res>;
  @override
  $Res call({Amount amount, Food food});

  @override
  $AmountCopyWith<$Res> get amount;
  @override
  $FoodCopyWith<$Res> get food;
}

/// @nodoc
class __$FoodItemValueCopyWithImpl<$Res>
    extends _$FoodItemValueCopyWithImpl<$Res>
    implements _$FoodItemValueCopyWith<$Res> {
  __$FoodItemValueCopyWithImpl(
      _FoodItemValue _value, $Res Function(_FoodItemValue) _then)
      : super(_value, (v) => _then(v as _FoodItemValue));

  @override
  _FoodItemValue get _value => super._value as _FoodItemValue;

  @override
  $Res call({
    Object? amount = freezed,
    Object? food = freezed,
  }) {
    return _then(_FoodItemValue(
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
      food: food == freezed
          ? _value.food
          : food // ignore: cast_nullable_to_non_nullable
              as Food,
    ));
  }
}

/// @nodoc

class _$_FoodItemValue implements _FoodItemValue {
  _$_FoodItemValue({required this.amount, required this.food});

  @override
  final Amount amount;
  @override
  final Food food;

  @override
  String toString() {
    return 'FoodItemValue(amount: $amount, food: $food)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FoodItemValue &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.food, food));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(food));

  @JsonKey(ignore: true)
  @override
  _$FoodItemValueCopyWith<_FoodItemValue> get copyWith =>
      __$FoodItemValueCopyWithImpl<_FoodItemValue>(this, _$identity);
}

abstract class _FoodItemValue implements FoodItemValue {
  factory _FoodItemValue({required Amount amount, required Food food}) =
      _$_FoodItemValue;

  @override
  Amount get amount;
  @override
  Food get food;
  @override
  @JsonKey(ignore: true)
  _$FoodItemValueCopyWith<_FoodItemValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$FoodItemTearOff {
  const _$FoodItemTearOff();

  _FoodItem call(
      {required FoodItemString string,
      required Option<Either<Failure, FoodItemValue>> value,
      required UniqueId uniqueId}) {
    return _FoodItem(
      string: string,
      value: value,
      uniqueId: uniqueId,
    );
  }
}

/// @nodoc
const $FoodItem = _$FoodItemTearOff();

/// @nodoc
mixin _$FoodItem {
  FoodItemString get string => throw _privateConstructorUsedError;
  Option<Either<Failure, FoodItemValue>> get value =>
      throw _privateConstructorUsedError;
  UniqueId get uniqueId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FoodItemCopyWith<FoodItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodItemCopyWith<$Res> {
  factory $FoodItemCopyWith(FoodItem value, $Res Function(FoodItem) then) =
      _$FoodItemCopyWithImpl<$Res>;
  $Res call(
      {FoodItemString string,
      Option<Either<Failure, FoodItemValue>> value,
      UniqueId uniqueId});

  $FoodItemStringCopyWith<$Res> get string;
}

/// @nodoc
class _$FoodItemCopyWithImpl<$Res> implements $FoodItemCopyWith<$Res> {
  _$FoodItemCopyWithImpl(this._value, this._then);

  final FoodItem _value;
  // ignore: unused_field
  final $Res Function(FoodItem) _then;

  @override
  $Res call({
    Object? string = freezed,
    Object? value = freezed,
    Object? uniqueId = freezed,
  }) {
    return _then(_value.copyWith(
      string: string == freezed
          ? _value.string
          : string // ignore: cast_nullable_to_non_nullable
              as FoodItemString,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Option<Either<Failure, FoodItemValue>>,
      uniqueId: uniqueId == freezed
          ? _value.uniqueId
          : uniqueId // ignore: cast_nullable_to_non_nullable
              as UniqueId,
    ));
  }

  @override
  $FoodItemStringCopyWith<$Res> get string {
    return $FoodItemStringCopyWith<$Res>(_value.string, (value) {
      return _then(_value.copyWith(string: value));
    });
  }
}

/// @nodoc
abstract class _$FoodItemCopyWith<$Res> implements $FoodItemCopyWith<$Res> {
  factory _$FoodItemCopyWith(_FoodItem value, $Res Function(_FoodItem) then) =
      __$FoodItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {FoodItemString string,
      Option<Either<Failure, FoodItemValue>> value,
      UniqueId uniqueId});

  @override
  $FoodItemStringCopyWith<$Res> get string;
}

/// @nodoc
class __$FoodItemCopyWithImpl<$Res> extends _$FoodItemCopyWithImpl<$Res>
    implements _$FoodItemCopyWith<$Res> {
  __$FoodItemCopyWithImpl(_FoodItem _value, $Res Function(_FoodItem) _then)
      : super(_value, (v) => _then(v as _FoodItem));

  @override
  _FoodItem get _value => super._value as _FoodItem;

  @override
  $Res call({
    Object? string = freezed,
    Object? value = freezed,
    Object? uniqueId = freezed,
  }) {
    return _then(_FoodItem(
      string: string == freezed
          ? _value.string
          : string // ignore: cast_nullable_to_non_nullable
              as FoodItemString,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Option<Either<Failure, FoodItemValue>>,
      uniqueId: uniqueId == freezed
          ? _value.uniqueId
          : uniqueId // ignore: cast_nullable_to_non_nullable
              as UniqueId,
    ));
  }
}

/// @nodoc

class _$_FoodItem extends _FoodItem {
  const _$_FoodItem(
      {required this.string, required this.value, required this.uniqueId})
      : super._();

  @override
  final FoodItemString string;
  @override
  final Option<Either<Failure, FoodItemValue>> value;
  @override
  final UniqueId uniqueId;

  @override
  String toString() {
    return 'FoodItem(string: $string, value: $value, uniqueId: $uniqueId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FoodItem &&
            const DeepCollectionEquality().equals(other.string, string) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            const DeepCollectionEquality().equals(other.uniqueId, uniqueId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(string),
      const DeepCollectionEquality().hash(value),
      const DeepCollectionEquality().hash(uniqueId));

  @JsonKey(ignore: true)
  @override
  _$FoodItemCopyWith<_FoodItem> get copyWith =>
      __$FoodItemCopyWithImpl<_FoodItem>(this, _$identity);
}

abstract class _FoodItem extends FoodItem {
  const factory _FoodItem(
      {required FoodItemString string,
      required Option<Either<Failure, FoodItemValue>> value,
      required UniqueId uniqueId}) = _$_FoodItem;
  const _FoodItem._() : super._();

  @override
  FoodItemString get string;
  @override
  Option<Either<Failure, FoodItemValue>> get value;
  @override
  UniqueId get uniqueId;
  @override
  @JsonKey(ignore: true)
  _$FoodItemCopyWith<_FoodItem> get copyWith =>
      throw _privateConstructorUsedError;
}

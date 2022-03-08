// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'food_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FoodItemTearOff {
  const _$FoodItemTearOff();

  _FoodItem call(
      {required FoodItemString foodItemString,
      required FoodItemStatus status,
      Food? food,
      Amount? amount}) {
    return _FoodItem(
      foodItemString: foodItemString,
      status: status,
      food: food,
      amount: amount,
    );
  }
}

/// @nodoc
const $FoodItem = _$FoodItemTearOff();

/// @nodoc
mixin _$FoodItem {
  FoodItemString get foodItemString => throw _privateConstructorUsedError;
  FoodItemStatus get status => throw _privateConstructorUsedError;
  Food? get food => throw _privateConstructorUsedError;
  Amount? get amount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FoodItemCopyWith<FoodItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodItemCopyWith<$Res> {
  factory $FoodItemCopyWith(FoodItem value, $Res Function(FoodItem) then) =
      _$FoodItemCopyWithImpl<$Res>;
  $Res call(
      {FoodItemString foodItemString,
      FoodItemStatus status,
      Food? food,
      Amount? amount});

  $FoodItemStringCopyWith<$Res> get foodItemString;
  $FoodItemStatusCopyWith<$Res> get status;
  $FoodCopyWith<$Res>? get food;
  $AmountCopyWith<$Res>? get amount;
}

/// @nodoc
class _$FoodItemCopyWithImpl<$Res> implements $FoodItemCopyWith<$Res> {
  _$FoodItemCopyWithImpl(this._value, this._then);

  final FoodItem _value;
  // ignore: unused_field
  final $Res Function(FoodItem) _then;

  @override
  $Res call({
    Object? foodItemString = freezed,
    Object? status = freezed,
    Object? food = freezed,
    Object? amount = freezed,
  }) {
    return _then(_value.copyWith(
      foodItemString: foodItemString == freezed
          ? _value.foodItemString
          : foodItemString // ignore: cast_nullable_to_non_nullable
              as FoodItemString,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FoodItemStatus,
      food: food == freezed
          ? _value.food
          : food // ignore: cast_nullable_to_non_nullable
              as Food?,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount?,
    ));
  }

  @override
  $FoodItemStringCopyWith<$Res> get foodItemString {
    return $FoodItemStringCopyWith<$Res>(_value.foodItemString, (value) {
      return _then(_value.copyWith(foodItemString: value));
    });
  }

  @override
  $FoodItemStatusCopyWith<$Res> get status {
    return $FoodItemStatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value));
    });
  }

  @override
  $FoodCopyWith<$Res>? get food {
    if (_value.food == null) {
      return null;
    }

    return $FoodCopyWith<$Res>(_value.food!, (value) {
      return _then(_value.copyWith(food: value));
    });
  }

  @override
  $AmountCopyWith<$Res>? get amount {
    if (_value.amount == null) {
      return null;
    }

    return $AmountCopyWith<$Res>(_value.amount!, (value) {
      return _then(_value.copyWith(amount: value));
    });
  }
}

/// @nodoc
abstract class _$FoodItemCopyWith<$Res> implements $FoodItemCopyWith<$Res> {
  factory _$FoodItemCopyWith(_FoodItem value, $Res Function(_FoodItem) then) =
      __$FoodItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {FoodItemString foodItemString,
      FoodItemStatus status,
      Food? food,
      Amount? amount});

  @override
  $FoodItemStringCopyWith<$Res> get foodItemString;
  @override
  $FoodItemStatusCopyWith<$Res> get status;
  @override
  $FoodCopyWith<$Res>? get food;
  @override
  $AmountCopyWith<$Res>? get amount;
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
    Object? foodItemString = freezed,
    Object? status = freezed,
    Object? food = freezed,
    Object? amount = freezed,
  }) {
    return _then(_FoodItem(
      foodItemString: foodItemString == freezed
          ? _value.foodItemString
          : foodItemString // ignore: cast_nullable_to_non_nullable
              as FoodItemString,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FoodItemStatus,
      food: food == freezed
          ? _value.food
          : food // ignore: cast_nullable_to_non_nullable
              as Food?,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount?,
    ));
  }
}

/// @nodoc

class _$_FoodItem implements _FoodItem {
  const _$_FoodItem(
      {required this.foodItemString,
      required this.status,
      this.food,
      this.amount});

  @override
  final FoodItemString foodItemString;
  @override
  final FoodItemStatus status;
  @override
  final Food? food;
  @override
  final Amount? amount;

  @override
  String toString() {
    return 'FoodItem(foodItemString: $foodItemString, status: $status, food: $food, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FoodItem &&
            const DeepCollectionEquality()
                .equals(other.foodItemString, foodItemString) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.food, food) &&
            const DeepCollectionEquality().equals(other.amount, amount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(foodItemString),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(food),
      const DeepCollectionEquality().hash(amount));

  @JsonKey(ignore: true)
  @override
  _$FoodItemCopyWith<_FoodItem> get copyWith =>
      __$FoodItemCopyWithImpl<_FoodItem>(this, _$identity);
}

abstract class _FoodItem implements FoodItem {
  const factory _FoodItem(
      {required FoodItemString foodItemString,
      required FoodItemStatus status,
      Food? food,
      Amount? amount}) = _$_FoodItem;

  @override
  FoodItemString get foodItemString;
  @override
  FoodItemStatus get status;
  @override
  Food? get food;
  @override
  Amount? get amount;
  @override
  @JsonKey(ignore: true)
  _$FoodItemCopyWith<_FoodItem> get copyWith =>
      throw _privateConstructorUsedError;
}

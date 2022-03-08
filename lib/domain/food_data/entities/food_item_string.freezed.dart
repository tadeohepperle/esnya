// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'food_item_string.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FoodItemStringTearOff {
  const _$FoodItemStringTearOff();

  _FoodItemString call(String text,
      {IntRange? number, IntRange? unit, IntRange? label}) {
    return _FoodItemString(
      text,
      number: number,
      unit: unit,
      label: label,
    );
  }
}

/// @nodoc
const $FoodItemString = _$FoodItemStringTearOff();

/// @nodoc
mixin _$FoodItemString {
  String get text => throw _privateConstructorUsedError;
  IntRange? get number => throw _privateConstructorUsedError;
  IntRange? get unit => throw _privateConstructorUsedError;
  IntRange? get label => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FoodItemStringCopyWith<FoodItemString> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodItemStringCopyWith<$Res> {
  factory $FoodItemStringCopyWith(
          FoodItemString value, $Res Function(FoodItemString) then) =
      _$FoodItemStringCopyWithImpl<$Res>;
  $Res call({String text, IntRange? number, IntRange? unit, IntRange? label});
}

/// @nodoc
class _$FoodItemStringCopyWithImpl<$Res>
    implements $FoodItemStringCopyWith<$Res> {
  _$FoodItemStringCopyWithImpl(this._value, this._then);

  final FoodItemString _value;
  // ignore: unused_field
  final $Res Function(FoodItemString) _then;

  @override
  $Res call({
    Object? text = freezed,
    Object? number = freezed,
    Object? unit = freezed,
    Object? label = freezed,
  }) {
    return _then(_value.copyWith(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as IntRange?,
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as IntRange?,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as IntRange?,
    ));
  }
}

/// @nodoc
abstract class _$FoodItemStringCopyWith<$Res>
    implements $FoodItemStringCopyWith<$Res> {
  factory _$FoodItemStringCopyWith(
          _FoodItemString value, $Res Function(_FoodItemString) then) =
      __$FoodItemStringCopyWithImpl<$Res>;
  @override
  $Res call({String text, IntRange? number, IntRange? unit, IntRange? label});
}

/// @nodoc
class __$FoodItemStringCopyWithImpl<$Res>
    extends _$FoodItemStringCopyWithImpl<$Res>
    implements _$FoodItemStringCopyWith<$Res> {
  __$FoodItemStringCopyWithImpl(
      _FoodItemString _value, $Res Function(_FoodItemString) _then)
      : super(_value, (v) => _then(v as _FoodItemString));

  @override
  _FoodItemString get _value => super._value as _FoodItemString;

  @override
  $Res call({
    Object? text = freezed,
    Object? number = freezed,
    Object? unit = freezed,
    Object? label = freezed,
  }) {
    return _then(_FoodItemString(
      text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as IntRange?,
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as IntRange?,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as IntRange?,
    ));
  }
}

/// @nodoc

class _$_FoodItemString implements _FoodItemString {
  const _$_FoodItemString(this.text, {this.number, this.unit, this.label});

  @override
  final String text;
  @override
  final IntRange? number;
  @override
  final IntRange? unit;
  @override
  final IntRange? label;

  @override
  String toString() {
    return 'FoodItemString(text: $text, number: $number, unit: $unit, label: $label)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FoodItemString &&
            const DeepCollectionEquality().equals(other.text, text) &&
            const DeepCollectionEquality().equals(other.number, number) &&
            const DeepCollectionEquality().equals(other.unit, unit) &&
            const DeepCollectionEquality().equals(other.label, label));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(text),
      const DeepCollectionEquality().hash(number),
      const DeepCollectionEquality().hash(unit),
      const DeepCollectionEquality().hash(label));

  @JsonKey(ignore: true)
  @override
  _$FoodItemStringCopyWith<_FoodItemString> get copyWith =>
      __$FoodItemStringCopyWithImpl<_FoodItemString>(this, _$identity);
}

abstract class _FoodItemString implements FoodItemString {
  const factory _FoodItemString(String text,
      {IntRange? number, IntRange? unit, IntRange? label}) = _$_FoodItemString;

  @override
  String get text;
  @override
  IntRange? get number;
  @override
  IntRange? get unit;
  @override
  IntRange? get label;
  @override
  @JsonKey(ignore: true)
  _$FoodItemStringCopyWith<_FoodItemString> get copyWith =>
      throw _privateConstructorUsedError;
}

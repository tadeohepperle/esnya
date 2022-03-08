// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'food.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FoodTearOff {
  const _$FoodTearOff();

  _Food call(
      {required String id,
      required String name,
      required MacroNutrients nutrients,
      num? kcal,
      num? density}) {
    return _Food(
      id: id,
      name: name,
      nutrients: nutrients,
      kcal: kcal,
      density: density,
    );
  }
}

/// @nodoc
const $Food = _$FoodTearOff();

/// @nodoc
mixin _$Food {
  String get id =>
      throw _privateConstructorUsedError; // TODO: maybe UniqueID instead
  String get name =>
      throw _privateConstructorUsedError; // TODO: replace with map for internationalization.
  MacroNutrients get nutrients =>
      throw _privateConstructorUsedError; // TODO: add micronutrients
  num? get kcal => throw _privateConstructorUsedError;
  num? get density => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FoodCopyWith<Food> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodCopyWith<$Res> {
  factory $FoodCopyWith(Food value, $Res Function(Food) then) =
      _$FoodCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      MacroNutrients nutrients,
      num? kcal,
      num? density});

  $MacroNutrientsCopyWith<$Res> get nutrients;
}

/// @nodoc
class _$FoodCopyWithImpl<$Res> implements $FoodCopyWith<$Res> {
  _$FoodCopyWithImpl(this._value, this._then);

  final Food _value;
  // ignore: unused_field
  final $Res Function(Food) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? nutrients = freezed,
    Object? kcal = freezed,
    Object? density = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nutrients: nutrients == freezed
          ? _value.nutrients
          : nutrients // ignore: cast_nullable_to_non_nullable
              as MacroNutrients,
      kcal: kcal == freezed
          ? _value.kcal
          : kcal // ignore: cast_nullable_to_non_nullable
              as num?,
      density: density == freezed
          ? _value.density
          : density // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }

  @override
  $MacroNutrientsCopyWith<$Res> get nutrients {
    return $MacroNutrientsCopyWith<$Res>(_value.nutrients, (value) {
      return _then(_value.copyWith(nutrients: value));
    });
  }
}

/// @nodoc
abstract class _$FoodCopyWith<$Res> implements $FoodCopyWith<$Res> {
  factory _$FoodCopyWith(_Food value, $Res Function(_Food) then) =
      __$FoodCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      MacroNutrients nutrients,
      num? kcal,
      num? density});

  @override
  $MacroNutrientsCopyWith<$Res> get nutrients;
}

/// @nodoc
class __$FoodCopyWithImpl<$Res> extends _$FoodCopyWithImpl<$Res>
    implements _$FoodCopyWith<$Res> {
  __$FoodCopyWithImpl(_Food _value, $Res Function(_Food) _then)
      : super(_value, (v) => _then(v as _Food));

  @override
  _Food get _value => super._value as _Food;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? nutrients = freezed,
    Object? kcal = freezed,
    Object? density = freezed,
  }) {
    return _then(_Food(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nutrients: nutrients == freezed
          ? _value.nutrients
          : nutrients // ignore: cast_nullable_to_non_nullable
              as MacroNutrients,
      kcal: kcal == freezed
          ? _value.kcal
          : kcal // ignore: cast_nullable_to_non_nullable
              as num?,
      density: density == freezed
          ? _value.density
          : density // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }
}

/// @nodoc

class _$_Food implements _Food {
  const _$_Food(
      {required this.id,
      required this.name,
      required this.nutrients,
      this.kcal,
      this.density});

  @override
  final String id;
  @override // TODO: maybe UniqueID instead
  final String name;
  @override // TODO: replace with map for internationalization.
  final MacroNutrients nutrients;
  @override // TODO: add micronutrients
  final num? kcal;
  @override
  final num? density;

  @override
  String toString() {
    return 'Food(id: $id, name: $name, nutrients: $nutrients, kcal: $kcal, density: $density)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Food &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.nutrients, nutrients) &&
            const DeepCollectionEquality().equals(other.kcal, kcal) &&
            const DeepCollectionEquality().equals(other.density, density));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(nutrients),
      const DeepCollectionEquality().hash(kcal),
      const DeepCollectionEquality().hash(density));

  @JsonKey(ignore: true)
  @override
  _$FoodCopyWith<_Food> get copyWith =>
      __$FoodCopyWithImpl<_Food>(this, _$identity);
}

abstract class _Food implements Food {
  const factory _Food(
      {required String id,
      required String name,
      required MacroNutrients nutrients,
      num? kcal,
      num? density}) = _$_Food;

  @override
  String get id;
  @override // TODO: maybe UniqueID instead
  String get name;
  @override // TODO: replace with map for internationalization.
  MacroNutrients get nutrients;
  @override // TODO: add micronutrients
  num? get kcal;
  @override
  num? get density;
  @override
  @JsonKey(ignore: true)
  _$FoodCopyWith<_Food> get copyWith => throw _privateConstructorUsedError;
}

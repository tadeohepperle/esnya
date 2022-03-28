// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_screen_tab_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomeScreenTabTypeTearOff {
  const _$HomeScreenTabTypeTearOff();

  _HomeScreenTabType call(NameAndPath nameAndPath) {
    return _HomeScreenTabType(
      nameAndPath,
    );
  }
}

/// @nodoc
const $HomeScreenTabType = _$HomeScreenTabTypeTearOff();

/// @nodoc
mixin _$HomeScreenTabType {
  NameAndPath get nameAndPath => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeScreenTabTypeCopyWith<HomeScreenTabType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeScreenTabTypeCopyWith<$Res> {
  factory $HomeScreenTabTypeCopyWith(
          HomeScreenTabType value, $Res Function(HomeScreenTabType) then) =
      _$HomeScreenTabTypeCopyWithImpl<$Res>;
  $Res call({NameAndPath nameAndPath});

  $NameAndPathCopyWith<$Res> get nameAndPath;
}

/// @nodoc
class _$HomeScreenTabTypeCopyWithImpl<$Res>
    implements $HomeScreenTabTypeCopyWith<$Res> {
  _$HomeScreenTabTypeCopyWithImpl(this._value, this._then);

  final HomeScreenTabType _value;
  // ignore: unused_field
  final $Res Function(HomeScreenTabType) _then;

  @override
  $Res call({
    Object? nameAndPath = freezed,
  }) {
    return _then(_value.copyWith(
      nameAndPath: nameAndPath == freezed
          ? _value.nameAndPath
          : nameAndPath // ignore: cast_nullable_to_non_nullable
              as NameAndPath,
    ));
  }

  @override
  $NameAndPathCopyWith<$Res> get nameAndPath {
    return $NameAndPathCopyWith<$Res>(_value.nameAndPath, (value) {
      return _then(_value.copyWith(nameAndPath: value));
    });
  }
}

/// @nodoc
abstract class _$HomeScreenTabTypeCopyWith<$Res>
    implements $HomeScreenTabTypeCopyWith<$Res> {
  factory _$HomeScreenTabTypeCopyWith(
          _HomeScreenTabType value, $Res Function(_HomeScreenTabType) then) =
      __$HomeScreenTabTypeCopyWithImpl<$Res>;
  @override
  $Res call({NameAndPath nameAndPath});

  @override
  $NameAndPathCopyWith<$Res> get nameAndPath;
}

/// @nodoc
class __$HomeScreenTabTypeCopyWithImpl<$Res>
    extends _$HomeScreenTabTypeCopyWithImpl<$Res>
    implements _$HomeScreenTabTypeCopyWith<$Res> {
  __$HomeScreenTabTypeCopyWithImpl(
      _HomeScreenTabType _value, $Res Function(_HomeScreenTabType) _then)
      : super(_value, (v) => _then(v as _HomeScreenTabType));

  @override
  _HomeScreenTabType get _value => super._value as _HomeScreenTabType;

  @override
  $Res call({
    Object? nameAndPath = freezed,
  }) {
    return _then(_HomeScreenTabType(
      nameAndPath == freezed
          ? _value.nameAndPath
          : nameAndPath // ignore: cast_nullable_to_non_nullable
              as NameAndPath,
    ));
  }
}

/// @nodoc

class _$_HomeScreenTabType extends _HomeScreenTabType {
  const _$_HomeScreenTabType(this.nameAndPath) : super._();

  @override
  final NameAndPath nameAndPath;

  @override
  String toString() {
    return 'HomeScreenTabType(nameAndPath: $nameAndPath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeScreenTabType &&
            const DeepCollectionEquality()
                .equals(other.nameAndPath, nameAndPath));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(nameAndPath));

  @JsonKey(ignore: true)
  @override
  _$HomeScreenTabTypeCopyWith<_HomeScreenTabType> get copyWith =>
      __$HomeScreenTabTypeCopyWithImpl<_HomeScreenTabType>(this, _$identity);
}

abstract class _HomeScreenTabType extends HomeScreenTabType {
  const factory _HomeScreenTabType(NameAndPath nameAndPath) =
      _$_HomeScreenTabType;
  const _HomeScreenTabType._() : super._();

  @override
  NameAndPath get nameAndPath;
  @override
  @JsonKey(ignore: true)
  _$HomeScreenTabTypeCopyWith<_HomeScreenTabType> get copyWith =>
      throw _privateConstructorUsedError;
}

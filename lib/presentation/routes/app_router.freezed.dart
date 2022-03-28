// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_router.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NameAndPathTearOff {
  const _$NameAndPathTearOff();

  _NameAndPath call(String name, String path) {
    return _NameAndPath(
      name,
      path,
    );
  }
}

/// @nodoc
const $NameAndPath = _$NameAndPathTearOff();

/// @nodoc
mixin _$NameAndPath {
  String get name => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NameAndPathCopyWith<NameAndPath> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NameAndPathCopyWith<$Res> {
  factory $NameAndPathCopyWith(
          NameAndPath value, $Res Function(NameAndPath) then) =
      _$NameAndPathCopyWithImpl<$Res>;
  $Res call({String name, String path});
}

/// @nodoc
class _$NameAndPathCopyWithImpl<$Res> implements $NameAndPathCopyWith<$Res> {
  _$NameAndPathCopyWithImpl(this._value, this._then);

  final NameAndPath _value;
  // ignore: unused_field
  final $Res Function(NameAndPath) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? path = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$NameAndPathCopyWith<$Res>
    implements $NameAndPathCopyWith<$Res> {
  factory _$NameAndPathCopyWith(
          _NameAndPath value, $Res Function(_NameAndPath) then) =
      __$NameAndPathCopyWithImpl<$Res>;
  @override
  $Res call({String name, String path});
}

/// @nodoc
class __$NameAndPathCopyWithImpl<$Res> extends _$NameAndPathCopyWithImpl<$Res>
    implements _$NameAndPathCopyWith<$Res> {
  __$NameAndPathCopyWithImpl(
      _NameAndPath _value, $Res Function(_NameAndPath) _then)
      : super(_value, (v) => _then(v as _NameAndPath));

  @override
  _NameAndPath get _value => super._value as _NameAndPath;

  @override
  $Res call({
    Object? name = freezed,
    Object? path = freezed,
  }) {
    return _then(_NameAndPath(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_NameAndPath extends _NameAndPath {
  const _$_NameAndPath(this.name, this.path) : super._();

  @override
  final String name;
  @override
  final String path;

  @override
  String toString() {
    return 'NameAndPath(name: $name, path: $path)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NameAndPath &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.path, path));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(path));

  @JsonKey(ignore: true)
  @override
  _$NameAndPathCopyWith<_NameAndPath> get copyWith =>
      __$NameAndPathCopyWithImpl<_NameAndPath>(this, _$identity);
}

abstract class _NameAndPath extends NameAndPath {
  const factory _NameAndPath(String name, String path) = _$_NameAndPath;
  const _NameAndPath._() : super._();

  @override
  String get name;
  @override
  String get path;
  @override
  @JsonKey(ignore: true)
  _$NameAndPathCopyWith<_NameAndPath> get copyWith =>
      throw _privateConstructorUsedError;
}

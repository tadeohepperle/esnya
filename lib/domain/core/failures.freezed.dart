// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ValueFailureTearOff {
  const _$ValueFailureTearOff();

  InvalidEmail<T> invalidEmail<T>({required String failedValue}) {
    return InvalidEmail<T>(
      failedValue: failedValue,
    );
  }

  InvalidPassword<T> invalidPassword<T>({required String failedValue}) {
    return InvalidPassword<T>(
      failedValue: failedValue,
    );
  }
}

/// @nodoc
const $ValueFailure = _$ValueFailureTearOff();

/// @nodoc
mixin _$ValueFailure<T> {
  String get failedValue => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) invalidEmail,
    required TResult Function(String failedValue) invalidPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? invalidEmail,
    TResult Function(String failedValue)? invalidPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? invalidEmail,
    TResult Function(String failedValue)? invalidPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(InvalidPassword<T> value) invalidPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(InvalidPassword<T> value)? invalidPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(InvalidPassword<T> value)? invalidPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ValueFailureCopyWith<T, ValueFailure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValueFailureCopyWith<T, $Res> {
  factory $ValueFailureCopyWith(
          ValueFailure<T> value, $Res Function(ValueFailure<T>) then) =
      _$ValueFailureCopyWithImpl<T, $Res>;
  $Res call({String failedValue});
}

/// @nodoc
class _$ValueFailureCopyWithImpl<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  _$ValueFailureCopyWithImpl(this._value, this._then);

  final ValueFailure<T> _value;
  // ignore: unused_field
  final $Res Function(ValueFailure<T>) _then;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_value.copyWith(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class $InvalidEmailCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $InvalidEmailCopyWith(
          InvalidEmail<T> value, $Res Function(InvalidEmail<T>) then) =
      _$InvalidEmailCopyWithImpl<T, $Res>;
  @override
  $Res call({String failedValue});
}

/// @nodoc
class _$InvalidEmailCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $InvalidEmailCopyWith<T, $Res> {
  _$InvalidEmailCopyWithImpl(
      InvalidEmail<T> _value, $Res Function(InvalidEmail<T>) _then)
      : super(_value, (v) => _then(v as InvalidEmail<T>));

  @override
  InvalidEmail<T> get _value => super._value as InvalidEmail<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(InvalidEmail<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InvalidEmail<T> extends InvalidEmail<T> {
  const _$InvalidEmail({required this.failedValue}) : super._();

  @override
  final String failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.invalidEmail(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvalidEmail<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  $InvalidEmailCopyWith<T, InvalidEmail<T>> get copyWith =>
      _$InvalidEmailCopyWithImpl<T, InvalidEmail<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) invalidEmail,
    required TResult Function(String failedValue) invalidPassword,
  }) {
    return invalidEmail(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? invalidEmail,
    TResult Function(String failedValue)? invalidPassword,
  }) {
    return invalidEmail?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? invalidEmail,
    TResult Function(String failedValue)? invalidPassword,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(InvalidPassword<T> value) invalidPassword,
  }) {
    return invalidEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(InvalidPassword<T> value)? invalidPassword,
  }) {
    return invalidEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(InvalidPassword<T> value)? invalidPassword,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail(this);
    }
    return orElse();
  }
}

abstract class InvalidEmail<T> extends ValueFailure<T> {
  const factory InvalidEmail({required String failedValue}) = _$InvalidEmail<T>;
  const InvalidEmail._() : super._();

  @override
  String get failedValue;
  @override
  @JsonKey(ignore: true)
  $InvalidEmailCopyWith<T, InvalidEmail<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvalidPasswordCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $InvalidPasswordCopyWith(
          InvalidPassword<T> value, $Res Function(InvalidPassword<T>) then) =
      _$InvalidPasswordCopyWithImpl<T, $Res>;
  @override
  $Res call({String failedValue});
}

/// @nodoc
class _$InvalidPasswordCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $InvalidPasswordCopyWith<T, $Res> {
  _$InvalidPasswordCopyWithImpl(
      InvalidPassword<T> _value, $Res Function(InvalidPassword<T>) _then)
      : super(_value, (v) => _then(v as InvalidPassword<T>));

  @override
  InvalidPassword<T> get _value => super._value as InvalidPassword<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(InvalidPassword<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InvalidPassword<T> extends InvalidPassword<T> {
  const _$InvalidPassword({required this.failedValue}) : super._();

  @override
  final String failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.invalidPassword(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvalidPassword<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  $InvalidPasswordCopyWith<T, InvalidPassword<T>> get copyWith =>
      _$InvalidPasswordCopyWithImpl<T, InvalidPassword<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) invalidEmail,
    required TResult Function(String failedValue) invalidPassword,
  }) {
    return invalidPassword(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? invalidEmail,
    TResult Function(String failedValue)? invalidPassword,
  }) {
    return invalidPassword?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? invalidEmail,
    TResult Function(String failedValue)? invalidPassword,
    required TResult orElse(),
  }) {
    if (invalidPassword != null) {
      return invalidPassword(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(InvalidPassword<T> value) invalidPassword,
  }) {
    return invalidPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(InvalidPassword<T> value)? invalidPassword,
  }) {
    return invalidPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(InvalidPassword<T> value)? invalidPassword,
    required TResult orElse(),
  }) {
    if (invalidPassword != null) {
      return invalidPassword(this);
    }
    return orElse();
  }
}

abstract class InvalidPassword<T> extends ValueFailure<T> {
  const factory InvalidPassword({required String failedValue}) =
      _$InvalidPassword<T>;
  const InvalidPassword._() : super._();

  @override
  String get failedValue;
  @override
  @JsonKey(ignore: true)
  $InvalidPasswordCopyWith<T, InvalidPassword<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$TextFragmentizeFailureTearOff {
  const _$TextFragmentizeFailureTearOff();

  _TextFragmentizeFailure unexpected() {
    return const _TextFragmentizeFailure();
  }
}

/// @nodoc
const $TextFragmentizeFailure = _$TextFragmentizeFailureTearOff();

/// @nodoc
mixin _$TextFragmentizeFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unexpected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TextFragmentizeFailure value) unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TextFragmentizeFailure value)? unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TextFragmentizeFailure value)? unexpected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextFragmentizeFailureCopyWith<$Res> {
  factory $TextFragmentizeFailureCopyWith(TextFragmentizeFailure value,
          $Res Function(TextFragmentizeFailure) then) =
      _$TextFragmentizeFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$TextFragmentizeFailureCopyWithImpl<$Res>
    implements $TextFragmentizeFailureCopyWith<$Res> {
  _$TextFragmentizeFailureCopyWithImpl(this._value, this._then);

  final TextFragmentizeFailure _value;
  // ignore: unused_field
  final $Res Function(TextFragmentizeFailure) _then;
}

/// @nodoc
abstract class _$TextFragmentizeFailureCopyWith<$Res> {
  factory _$TextFragmentizeFailureCopyWith(_TextFragmentizeFailure value,
          $Res Function(_TextFragmentizeFailure) then) =
      __$TextFragmentizeFailureCopyWithImpl<$Res>;
}

/// @nodoc
class __$TextFragmentizeFailureCopyWithImpl<$Res>
    extends _$TextFragmentizeFailureCopyWithImpl<$Res>
    implements _$TextFragmentizeFailureCopyWith<$Res> {
  __$TextFragmentizeFailureCopyWithImpl(_TextFragmentizeFailure _value,
      $Res Function(_TextFragmentizeFailure) _then)
      : super(_value, (v) => _then(v as _TextFragmentizeFailure));

  @override
  _TextFragmentizeFailure get _value => super._value as _TextFragmentizeFailure;
}

/// @nodoc

class _$_TextFragmentizeFailure extends _TextFragmentizeFailure {
  const _$_TextFragmentizeFailure() : super._();

  @override
  String toString() {
    return 'TextFragmentizeFailure.unexpected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _TextFragmentizeFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unexpected,
  }) {
    return unexpected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unexpected,
  }) {
    return unexpected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unexpected,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TextFragmentizeFailure value) unexpected,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TextFragmentizeFailure value)? unexpected,
  }) {
    return unexpected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TextFragmentizeFailure value)? unexpected,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class _TextFragmentizeFailure extends TextFragmentizeFailure {
  const factory _TextFragmentizeFailure() = _$_TextFragmentizeFailure;
  const _TextFragmentizeFailure._() : super._();
}

/// @nodoc
class _$FoodFetchingFailureTearOff {
  const _$FoodFetchingFailureTearOff();

  _FoodFetchingNetworkFailure networkFailure() {
    return const _FoodFetchingNetworkFailure();
  }

  _FoodFetchingUnknownUnit unknownUnit() {
    return const _FoodFetchingUnknownUnit();
  }

  _FoodFetchingUnknownFood unknownFood() {
    return const _FoodFetchingUnknownFood();
  }

  _FoodFetchingLocalDataNotFound localDataNotFound() {
    return const _FoodFetchingLocalDataNotFound();
  }
}

/// @nodoc
const $FoodFetchingFailure = _$FoodFetchingFailureTearOff();

/// @nodoc
mixin _$FoodFetchingFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() networkFailure,
    required TResult Function() unknownUnit,
    required TResult Function() unknownFood,
    required TResult Function() localDataNotFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? networkFailure,
    TResult Function()? unknownUnit,
    TResult Function()? unknownFood,
    TResult Function()? localDataNotFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? networkFailure,
    TResult Function()? unknownUnit,
    TResult Function()? unknownFood,
    TResult Function()? localDataNotFound,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FoodFetchingNetworkFailure value) networkFailure,
    required TResult Function(_FoodFetchingUnknownUnit value) unknownUnit,
    required TResult Function(_FoodFetchingUnknownFood value) unknownFood,
    required TResult Function(_FoodFetchingLocalDataNotFound value)
        localDataNotFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FoodFetchingNetworkFailure value)? networkFailure,
    TResult Function(_FoodFetchingUnknownUnit value)? unknownUnit,
    TResult Function(_FoodFetchingUnknownFood value)? unknownFood,
    TResult Function(_FoodFetchingLocalDataNotFound value)? localDataNotFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FoodFetchingNetworkFailure value)? networkFailure,
    TResult Function(_FoodFetchingUnknownUnit value)? unknownUnit,
    TResult Function(_FoodFetchingUnknownFood value)? unknownFood,
    TResult Function(_FoodFetchingLocalDataNotFound value)? localDataNotFound,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodFetchingFailureCopyWith<$Res> {
  factory $FoodFetchingFailureCopyWith(
          FoodFetchingFailure value, $Res Function(FoodFetchingFailure) then) =
      _$FoodFetchingFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$FoodFetchingFailureCopyWithImpl<$Res>
    implements $FoodFetchingFailureCopyWith<$Res> {
  _$FoodFetchingFailureCopyWithImpl(this._value, this._then);

  final FoodFetchingFailure _value;
  // ignore: unused_field
  final $Res Function(FoodFetchingFailure) _then;
}

/// @nodoc
abstract class _$FoodFetchingNetworkFailureCopyWith<$Res> {
  factory _$FoodFetchingNetworkFailureCopyWith(
          _FoodFetchingNetworkFailure value,
          $Res Function(_FoodFetchingNetworkFailure) then) =
      __$FoodFetchingNetworkFailureCopyWithImpl<$Res>;
}

/// @nodoc
class __$FoodFetchingNetworkFailureCopyWithImpl<$Res>
    extends _$FoodFetchingFailureCopyWithImpl<$Res>
    implements _$FoodFetchingNetworkFailureCopyWith<$Res> {
  __$FoodFetchingNetworkFailureCopyWithImpl(_FoodFetchingNetworkFailure _value,
      $Res Function(_FoodFetchingNetworkFailure) _then)
      : super(_value, (v) => _then(v as _FoodFetchingNetworkFailure));

  @override
  _FoodFetchingNetworkFailure get _value =>
      super._value as _FoodFetchingNetworkFailure;
}

/// @nodoc

class _$_FoodFetchingNetworkFailure extends _FoodFetchingNetworkFailure {
  const _$_FoodFetchingNetworkFailure() : super._();

  @override
  String toString() {
    return 'FoodFetchingFailure.networkFailure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FoodFetchingNetworkFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() networkFailure,
    required TResult Function() unknownUnit,
    required TResult Function() unknownFood,
    required TResult Function() localDataNotFound,
  }) {
    return networkFailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? networkFailure,
    TResult Function()? unknownUnit,
    TResult Function()? unknownFood,
    TResult Function()? localDataNotFound,
  }) {
    return networkFailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? networkFailure,
    TResult Function()? unknownUnit,
    TResult Function()? unknownFood,
    TResult Function()? localDataNotFound,
    required TResult orElse(),
  }) {
    if (networkFailure != null) {
      return networkFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FoodFetchingNetworkFailure value) networkFailure,
    required TResult Function(_FoodFetchingUnknownUnit value) unknownUnit,
    required TResult Function(_FoodFetchingUnknownFood value) unknownFood,
    required TResult Function(_FoodFetchingLocalDataNotFound value)
        localDataNotFound,
  }) {
    return networkFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FoodFetchingNetworkFailure value)? networkFailure,
    TResult Function(_FoodFetchingUnknownUnit value)? unknownUnit,
    TResult Function(_FoodFetchingUnknownFood value)? unknownFood,
    TResult Function(_FoodFetchingLocalDataNotFound value)? localDataNotFound,
  }) {
    return networkFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FoodFetchingNetworkFailure value)? networkFailure,
    TResult Function(_FoodFetchingUnknownUnit value)? unknownUnit,
    TResult Function(_FoodFetchingUnknownFood value)? unknownFood,
    TResult Function(_FoodFetchingLocalDataNotFound value)? localDataNotFound,
    required TResult orElse(),
  }) {
    if (networkFailure != null) {
      return networkFailure(this);
    }
    return orElse();
  }
}

abstract class _FoodFetchingNetworkFailure extends FoodFetchingFailure {
  const factory _FoodFetchingNetworkFailure() = _$_FoodFetchingNetworkFailure;
  const _FoodFetchingNetworkFailure._() : super._();
}

/// @nodoc
abstract class _$FoodFetchingUnknownUnitCopyWith<$Res> {
  factory _$FoodFetchingUnknownUnitCopyWith(_FoodFetchingUnknownUnit value,
          $Res Function(_FoodFetchingUnknownUnit) then) =
      __$FoodFetchingUnknownUnitCopyWithImpl<$Res>;
}

/// @nodoc
class __$FoodFetchingUnknownUnitCopyWithImpl<$Res>
    extends _$FoodFetchingFailureCopyWithImpl<$Res>
    implements _$FoodFetchingUnknownUnitCopyWith<$Res> {
  __$FoodFetchingUnknownUnitCopyWithImpl(_FoodFetchingUnknownUnit _value,
      $Res Function(_FoodFetchingUnknownUnit) _then)
      : super(_value, (v) => _then(v as _FoodFetchingUnknownUnit));

  @override
  _FoodFetchingUnknownUnit get _value =>
      super._value as _FoodFetchingUnknownUnit;
}

/// @nodoc

class _$_FoodFetchingUnknownUnit extends _FoodFetchingUnknownUnit {
  const _$_FoodFetchingUnknownUnit() : super._();

  @override
  String toString() {
    return 'FoodFetchingFailure.unknownUnit()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _FoodFetchingUnknownUnit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() networkFailure,
    required TResult Function() unknownUnit,
    required TResult Function() unknownFood,
    required TResult Function() localDataNotFound,
  }) {
    return unknownUnit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? networkFailure,
    TResult Function()? unknownUnit,
    TResult Function()? unknownFood,
    TResult Function()? localDataNotFound,
  }) {
    return unknownUnit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? networkFailure,
    TResult Function()? unknownUnit,
    TResult Function()? unknownFood,
    TResult Function()? localDataNotFound,
    required TResult orElse(),
  }) {
    if (unknownUnit != null) {
      return unknownUnit();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FoodFetchingNetworkFailure value) networkFailure,
    required TResult Function(_FoodFetchingUnknownUnit value) unknownUnit,
    required TResult Function(_FoodFetchingUnknownFood value) unknownFood,
    required TResult Function(_FoodFetchingLocalDataNotFound value)
        localDataNotFound,
  }) {
    return unknownUnit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FoodFetchingNetworkFailure value)? networkFailure,
    TResult Function(_FoodFetchingUnknownUnit value)? unknownUnit,
    TResult Function(_FoodFetchingUnknownFood value)? unknownFood,
    TResult Function(_FoodFetchingLocalDataNotFound value)? localDataNotFound,
  }) {
    return unknownUnit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FoodFetchingNetworkFailure value)? networkFailure,
    TResult Function(_FoodFetchingUnknownUnit value)? unknownUnit,
    TResult Function(_FoodFetchingUnknownFood value)? unknownFood,
    TResult Function(_FoodFetchingLocalDataNotFound value)? localDataNotFound,
    required TResult orElse(),
  }) {
    if (unknownUnit != null) {
      return unknownUnit(this);
    }
    return orElse();
  }
}

abstract class _FoodFetchingUnknownUnit extends FoodFetchingFailure {
  const factory _FoodFetchingUnknownUnit() = _$_FoodFetchingUnknownUnit;
  const _FoodFetchingUnknownUnit._() : super._();
}

/// @nodoc
abstract class _$FoodFetchingUnknownFoodCopyWith<$Res> {
  factory _$FoodFetchingUnknownFoodCopyWith(_FoodFetchingUnknownFood value,
          $Res Function(_FoodFetchingUnknownFood) then) =
      __$FoodFetchingUnknownFoodCopyWithImpl<$Res>;
}

/// @nodoc
class __$FoodFetchingUnknownFoodCopyWithImpl<$Res>
    extends _$FoodFetchingFailureCopyWithImpl<$Res>
    implements _$FoodFetchingUnknownFoodCopyWith<$Res> {
  __$FoodFetchingUnknownFoodCopyWithImpl(_FoodFetchingUnknownFood _value,
      $Res Function(_FoodFetchingUnknownFood) _then)
      : super(_value, (v) => _then(v as _FoodFetchingUnknownFood));

  @override
  _FoodFetchingUnknownFood get _value =>
      super._value as _FoodFetchingUnknownFood;
}

/// @nodoc

class _$_FoodFetchingUnknownFood extends _FoodFetchingUnknownFood {
  const _$_FoodFetchingUnknownFood() : super._();

  @override
  String toString() {
    return 'FoodFetchingFailure.unknownFood()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _FoodFetchingUnknownFood);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() networkFailure,
    required TResult Function() unknownUnit,
    required TResult Function() unknownFood,
    required TResult Function() localDataNotFound,
  }) {
    return unknownFood();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? networkFailure,
    TResult Function()? unknownUnit,
    TResult Function()? unknownFood,
    TResult Function()? localDataNotFound,
  }) {
    return unknownFood?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? networkFailure,
    TResult Function()? unknownUnit,
    TResult Function()? unknownFood,
    TResult Function()? localDataNotFound,
    required TResult orElse(),
  }) {
    if (unknownFood != null) {
      return unknownFood();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FoodFetchingNetworkFailure value) networkFailure,
    required TResult Function(_FoodFetchingUnknownUnit value) unknownUnit,
    required TResult Function(_FoodFetchingUnknownFood value) unknownFood,
    required TResult Function(_FoodFetchingLocalDataNotFound value)
        localDataNotFound,
  }) {
    return unknownFood(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FoodFetchingNetworkFailure value)? networkFailure,
    TResult Function(_FoodFetchingUnknownUnit value)? unknownUnit,
    TResult Function(_FoodFetchingUnknownFood value)? unknownFood,
    TResult Function(_FoodFetchingLocalDataNotFound value)? localDataNotFound,
  }) {
    return unknownFood?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FoodFetchingNetworkFailure value)? networkFailure,
    TResult Function(_FoodFetchingUnknownUnit value)? unknownUnit,
    TResult Function(_FoodFetchingUnknownFood value)? unknownFood,
    TResult Function(_FoodFetchingLocalDataNotFound value)? localDataNotFound,
    required TResult orElse(),
  }) {
    if (unknownFood != null) {
      return unknownFood(this);
    }
    return orElse();
  }
}

abstract class _FoodFetchingUnknownFood extends FoodFetchingFailure {
  const factory _FoodFetchingUnknownFood() = _$_FoodFetchingUnknownFood;
  const _FoodFetchingUnknownFood._() : super._();
}

/// @nodoc
abstract class _$FoodFetchingLocalDataNotFoundCopyWith<$Res> {
  factory _$FoodFetchingLocalDataNotFoundCopyWith(
          _FoodFetchingLocalDataNotFound value,
          $Res Function(_FoodFetchingLocalDataNotFound) then) =
      __$FoodFetchingLocalDataNotFoundCopyWithImpl<$Res>;
}

/// @nodoc
class __$FoodFetchingLocalDataNotFoundCopyWithImpl<$Res>
    extends _$FoodFetchingFailureCopyWithImpl<$Res>
    implements _$FoodFetchingLocalDataNotFoundCopyWith<$Res> {
  __$FoodFetchingLocalDataNotFoundCopyWithImpl(
      _FoodFetchingLocalDataNotFound _value,
      $Res Function(_FoodFetchingLocalDataNotFound) _then)
      : super(_value, (v) => _then(v as _FoodFetchingLocalDataNotFound));

  @override
  _FoodFetchingLocalDataNotFound get _value =>
      super._value as _FoodFetchingLocalDataNotFound;
}

/// @nodoc

class _$_FoodFetchingLocalDataNotFound extends _FoodFetchingLocalDataNotFound {
  const _$_FoodFetchingLocalDataNotFound() : super._();

  @override
  String toString() {
    return 'FoodFetchingFailure.localDataNotFound()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FoodFetchingLocalDataNotFound);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() networkFailure,
    required TResult Function() unknownUnit,
    required TResult Function() unknownFood,
    required TResult Function() localDataNotFound,
  }) {
    return localDataNotFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? networkFailure,
    TResult Function()? unknownUnit,
    TResult Function()? unknownFood,
    TResult Function()? localDataNotFound,
  }) {
    return localDataNotFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? networkFailure,
    TResult Function()? unknownUnit,
    TResult Function()? unknownFood,
    TResult Function()? localDataNotFound,
    required TResult orElse(),
  }) {
    if (localDataNotFound != null) {
      return localDataNotFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FoodFetchingNetworkFailure value) networkFailure,
    required TResult Function(_FoodFetchingUnknownUnit value) unknownUnit,
    required TResult Function(_FoodFetchingUnknownFood value) unknownFood,
    required TResult Function(_FoodFetchingLocalDataNotFound value)
        localDataNotFound,
  }) {
    return localDataNotFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FoodFetchingNetworkFailure value)? networkFailure,
    TResult Function(_FoodFetchingUnknownUnit value)? unknownUnit,
    TResult Function(_FoodFetchingUnknownFood value)? unknownFood,
    TResult Function(_FoodFetchingLocalDataNotFound value)? localDataNotFound,
  }) {
    return localDataNotFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FoodFetchingNetworkFailure value)? networkFailure,
    TResult Function(_FoodFetchingUnknownUnit value)? unknownUnit,
    TResult Function(_FoodFetchingUnknownFood value)? unknownFood,
    TResult Function(_FoodFetchingLocalDataNotFound value)? localDataNotFound,
    required TResult orElse(),
  }) {
    if (localDataNotFound != null) {
      return localDataNotFound(this);
    }
    return orElse();
  }
}

abstract class _FoodFetchingLocalDataNotFound extends FoodFetchingFailure {
  const factory _FoodFetchingLocalDataNotFound() =
      _$_FoodFetchingLocalDataNotFound;
  const _FoodFetchingLocalDataNotFound._() : super._();
}

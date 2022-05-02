// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
  const factory InvalidEmail({required final String failedValue}) =
      _$InvalidEmail<T>;
  const InvalidEmail._() : super._();

  @override
  String get failedValue => throw _privateConstructorUsedError;
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
  const factory InvalidPassword({required final String failedValue}) =
      _$InvalidPassword<T>;
  const InvalidPassword._() : super._();

  @override
  String get failedValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $InvalidPasswordCopyWith<T, InvalidPassword<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ApiFailure {
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
    required TResult Function(_ApiFailureUnexpected value) unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ApiFailureUnexpected value)? unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ApiFailureUnexpected value)? unexpected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiFailureCopyWith<$Res> {
  factory $ApiFailureCopyWith(
          ApiFailure value, $Res Function(ApiFailure) then) =
      _$ApiFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$ApiFailureCopyWithImpl<$Res> implements $ApiFailureCopyWith<$Res> {
  _$ApiFailureCopyWithImpl(this._value, this._then);

  final ApiFailure _value;
  // ignore: unused_field
  final $Res Function(ApiFailure) _then;
}

/// @nodoc
abstract class _$ApiFailureUnexpectedCopyWith<$Res> {
  factory _$ApiFailureUnexpectedCopyWith(_ApiFailureUnexpected value,
          $Res Function(_ApiFailureUnexpected) then) =
      __$ApiFailureUnexpectedCopyWithImpl<$Res>;
}

/// @nodoc
class __$ApiFailureUnexpectedCopyWithImpl<$Res>
    extends _$ApiFailureCopyWithImpl<$Res>
    implements _$ApiFailureUnexpectedCopyWith<$Res> {
  __$ApiFailureUnexpectedCopyWithImpl(
      _ApiFailureUnexpected _value, $Res Function(_ApiFailureUnexpected) _then)
      : super(_value, (v) => _then(v as _ApiFailureUnexpected));

  @override
  _ApiFailureUnexpected get _value => super._value as _ApiFailureUnexpected;
}

/// @nodoc

class _$_ApiFailureUnexpected extends _ApiFailureUnexpected {
  const _$_ApiFailureUnexpected() : super._();

  @override
  String toString() {
    return 'ApiFailure.unexpected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ApiFailureUnexpected);
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
    required TResult Function(_ApiFailureUnexpected value) unexpected,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ApiFailureUnexpected value)? unexpected,
  }) {
    return unexpected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ApiFailureUnexpected value)? unexpected,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class _ApiFailureUnexpected extends ApiFailure {
  const factory _ApiFailureUnexpected() = _$_ApiFailureUnexpected;
  const _ApiFailureUnexpected._() : super._();
}

/// @nodoc
mixin _$FireStoreFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notFound,
    required TResult Function() unexpected,
    required TResult Function() insufficientPermission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? notFound,
    TResult Function()? unexpected,
    TResult Function()? insufficientPermission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notFound,
    TResult Function()? unexpected,
    TResult Function()? insufficientPermission,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FireStoreFailureNotFound value) notFound,
    required TResult Function(FireStoreFailureUnexpected value) unexpected,
    required TResult Function(FireStoreFailureInsufficientPermission value)
        insufficientPermission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FireStoreFailureNotFound value)? notFound,
    TResult Function(FireStoreFailureUnexpected value)? unexpected,
    TResult Function(FireStoreFailureInsufficientPermission value)?
        insufficientPermission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FireStoreFailureNotFound value)? notFound,
    TResult Function(FireStoreFailureUnexpected value)? unexpected,
    TResult Function(FireStoreFailureInsufficientPermission value)?
        insufficientPermission,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FireStoreFailureCopyWith<$Res> {
  factory $FireStoreFailureCopyWith(
          FireStoreFailure value, $Res Function(FireStoreFailure) then) =
      _$FireStoreFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$FireStoreFailureCopyWithImpl<$Res>
    implements $FireStoreFailureCopyWith<$Res> {
  _$FireStoreFailureCopyWithImpl(this._value, this._then);

  final FireStoreFailure _value;
  // ignore: unused_field
  final $Res Function(FireStoreFailure) _then;
}

/// @nodoc
abstract class $FireStoreFailureNotFoundCopyWith<$Res> {
  factory $FireStoreFailureNotFoundCopyWith(FireStoreFailureNotFound value,
          $Res Function(FireStoreFailureNotFound) then) =
      _$FireStoreFailureNotFoundCopyWithImpl<$Res>;
}

/// @nodoc
class _$FireStoreFailureNotFoundCopyWithImpl<$Res>
    extends _$FireStoreFailureCopyWithImpl<$Res>
    implements $FireStoreFailureNotFoundCopyWith<$Res> {
  _$FireStoreFailureNotFoundCopyWithImpl(FireStoreFailureNotFound _value,
      $Res Function(FireStoreFailureNotFound) _then)
      : super(_value, (v) => _then(v as FireStoreFailureNotFound));

  @override
  FireStoreFailureNotFound get _value =>
      super._value as FireStoreFailureNotFound;
}

/// @nodoc

class _$FireStoreFailureNotFound extends FireStoreFailureNotFound {
  const _$FireStoreFailureNotFound() : super._();

  @override
  String toString() {
    return 'FireStoreFailure.notFound()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FireStoreFailureNotFound);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notFound,
    required TResult Function() unexpected,
    required TResult Function() insufficientPermission,
  }) {
    return notFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? notFound,
    TResult Function()? unexpected,
    TResult Function()? insufficientPermission,
  }) {
    return notFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notFound,
    TResult Function()? unexpected,
    TResult Function()? insufficientPermission,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FireStoreFailureNotFound value) notFound,
    required TResult Function(FireStoreFailureUnexpected value) unexpected,
    required TResult Function(FireStoreFailureInsufficientPermission value)
        insufficientPermission,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FireStoreFailureNotFound value)? notFound,
    TResult Function(FireStoreFailureUnexpected value)? unexpected,
    TResult Function(FireStoreFailureInsufficientPermission value)?
        insufficientPermission,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FireStoreFailureNotFound value)? notFound,
    TResult Function(FireStoreFailureUnexpected value)? unexpected,
    TResult Function(FireStoreFailureInsufficientPermission value)?
        insufficientPermission,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class FireStoreFailureNotFound extends FireStoreFailure {
  const factory FireStoreFailureNotFound() = _$FireStoreFailureNotFound;
  const FireStoreFailureNotFound._() : super._();
}

/// @nodoc
abstract class $FireStoreFailureUnexpectedCopyWith<$Res> {
  factory $FireStoreFailureUnexpectedCopyWith(FireStoreFailureUnexpected value,
          $Res Function(FireStoreFailureUnexpected) then) =
      _$FireStoreFailureUnexpectedCopyWithImpl<$Res>;
}

/// @nodoc
class _$FireStoreFailureUnexpectedCopyWithImpl<$Res>
    extends _$FireStoreFailureCopyWithImpl<$Res>
    implements $FireStoreFailureUnexpectedCopyWith<$Res> {
  _$FireStoreFailureUnexpectedCopyWithImpl(FireStoreFailureUnexpected _value,
      $Res Function(FireStoreFailureUnexpected) _then)
      : super(_value, (v) => _then(v as FireStoreFailureUnexpected));

  @override
  FireStoreFailureUnexpected get _value =>
      super._value as FireStoreFailureUnexpected;
}

/// @nodoc

class _$FireStoreFailureUnexpected extends FireStoreFailureUnexpected {
  const _$FireStoreFailureUnexpected() : super._();

  @override
  String toString() {
    return 'FireStoreFailure.unexpected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FireStoreFailureUnexpected);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notFound,
    required TResult Function() unexpected,
    required TResult Function() insufficientPermission,
  }) {
    return unexpected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? notFound,
    TResult Function()? unexpected,
    TResult Function()? insufficientPermission,
  }) {
    return unexpected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notFound,
    TResult Function()? unexpected,
    TResult Function()? insufficientPermission,
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
    required TResult Function(FireStoreFailureNotFound value) notFound,
    required TResult Function(FireStoreFailureUnexpected value) unexpected,
    required TResult Function(FireStoreFailureInsufficientPermission value)
        insufficientPermission,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FireStoreFailureNotFound value)? notFound,
    TResult Function(FireStoreFailureUnexpected value)? unexpected,
    TResult Function(FireStoreFailureInsufficientPermission value)?
        insufficientPermission,
  }) {
    return unexpected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FireStoreFailureNotFound value)? notFound,
    TResult Function(FireStoreFailureUnexpected value)? unexpected,
    TResult Function(FireStoreFailureInsufficientPermission value)?
        insufficientPermission,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class FireStoreFailureUnexpected extends FireStoreFailure {
  const factory FireStoreFailureUnexpected() = _$FireStoreFailureUnexpected;
  const FireStoreFailureUnexpected._() : super._();
}

/// @nodoc
abstract class $FireStoreFailureInsufficientPermissionCopyWith<$Res> {
  factory $FireStoreFailureInsufficientPermissionCopyWith(
          FireStoreFailureInsufficientPermission value,
          $Res Function(FireStoreFailureInsufficientPermission) then) =
      _$FireStoreFailureInsufficientPermissionCopyWithImpl<$Res>;
}

/// @nodoc
class _$FireStoreFailureInsufficientPermissionCopyWithImpl<$Res>
    extends _$FireStoreFailureCopyWithImpl<$Res>
    implements $FireStoreFailureInsufficientPermissionCopyWith<$Res> {
  _$FireStoreFailureInsufficientPermissionCopyWithImpl(
      FireStoreFailureInsufficientPermission _value,
      $Res Function(FireStoreFailureInsufficientPermission) _then)
      : super(
            _value, (v) => _then(v as FireStoreFailureInsufficientPermission));

  @override
  FireStoreFailureInsufficientPermission get _value =>
      super._value as FireStoreFailureInsufficientPermission;
}

/// @nodoc

class _$FireStoreFailureInsufficientPermission
    extends FireStoreFailureInsufficientPermission {
  const _$FireStoreFailureInsufficientPermission() : super._();

  @override
  String toString() {
    return 'FireStoreFailure.insufficientPermission()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FireStoreFailureInsufficientPermission);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notFound,
    required TResult Function() unexpected,
    required TResult Function() insufficientPermission,
  }) {
    return insufficientPermission();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? notFound,
    TResult Function()? unexpected,
    TResult Function()? insufficientPermission,
  }) {
    return insufficientPermission?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notFound,
    TResult Function()? unexpected,
    TResult Function()? insufficientPermission,
    required TResult orElse(),
  }) {
    if (insufficientPermission != null) {
      return insufficientPermission();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FireStoreFailureNotFound value) notFound,
    required TResult Function(FireStoreFailureUnexpected value) unexpected,
    required TResult Function(FireStoreFailureInsufficientPermission value)
        insufficientPermission,
  }) {
    return insufficientPermission(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FireStoreFailureNotFound value)? notFound,
    TResult Function(FireStoreFailureUnexpected value)? unexpected,
    TResult Function(FireStoreFailureInsufficientPermission value)?
        insufficientPermission,
  }) {
    return insufficientPermission?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FireStoreFailureNotFound value)? notFound,
    TResult Function(FireStoreFailureUnexpected value)? unexpected,
    TResult Function(FireStoreFailureInsufficientPermission value)?
        insufficientPermission,
    required TResult orElse(),
  }) {
    if (insufficientPermission != null) {
      return insufficientPermission(this);
    }
    return orElse();
  }
}

abstract class FireStoreFailureInsufficientPermission extends FireStoreFailure {
  const factory FireStoreFailureInsufficientPermission() =
      _$FireStoreFailureInsufficientPermission;
  const FireStoreFailureInsufficientPermission._() : super._();
}

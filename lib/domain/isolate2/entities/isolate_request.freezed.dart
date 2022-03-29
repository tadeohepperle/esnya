// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'isolate_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$IsolateRequestTearOff {
  const _$IsolateRequestTearOff();

  IsolateRequestHelloWorld helloWorld(String message) {
    return IsolateRequestHelloWorld(
      message,
    );
  }
}

/// @nodoc
const $IsolateRequest = _$IsolateRequestTearOff();

/// @nodoc
mixin _$IsolateRequest {
  String get message => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) helloWorld,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? helloWorld,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? helloWorld,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IsolateRequestHelloWorld value) helloWorld,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(IsolateRequestHelloWorld value)? helloWorld,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IsolateRequestHelloWorld value)? helloWorld,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IsolateRequestCopyWith<IsolateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IsolateRequestCopyWith<$Res> {
  factory $IsolateRequestCopyWith(
          IsolateRequest value, $Res Function(IsolateRequest) then) =
      _$IsolateRequestCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$IsolateRequestCopyWithImpl<$Res>
    implements $IsolateRequestCopyWith<$Res> {
  _$IsolateRequestCopyWithImpl(this._value, this._then);

  final IsolateRequest _value;
  // ignore: unused_field
  final $Res Function(IsolateRequest) _then;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class $IsolateRequestHelloWorldCopyWith<$Res>
    implements $IsolateRequestCopyWith<$Res> {
  factory $IsolateRequestHelloWorldCopyWith(IsolateRequestHelloWorld value,
          $Res Function(IsolateRequestHelloWorld) then) =
      _$IsolateRequestHelloWorldCopyWithImpl<$Res>;
  @override
  $Res call({String message});
}

/// @nodoc
class _$IsolateRequestHelloWorldCopyWithImpl<$Res>
    extends _$IsolateRequestCopyWithImpl<$Res>
    implements $IsolateRequestHelloWorldCopyWith<$Res> {
  _$IsolateRequestHelloWorldCopyWithImpl(IsolateRequestHelloWorld _value,
      $Res Function(IsolateRequestHelloWorld) _then)
      : super(_value, (v) => _then(v as IsolateRequestHelloWorld));

  @override
  IsolateRequestHelloWorld get _value =>
      super._value as IsolateRequestHelloWorld;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(IsolateRequestHelloWorld(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$IsolateRequestHelloWorld implements IsolateRequestHelloWorld {
  const _$IsolateRequestHelloWorld(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'IsolateRequest.helloWorld(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IsolateRequestHelloWorld &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  $IsolateRequestHelloWorldCopyWith<IsolateRequestHelloWorld> get copyWith =>
      _$IsolateRequestHelloWorldCopyWithImpl<IsolateRequestHelloWorld>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) helloWorld,
  }) {
    return helloWorld(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? helloWorld,
  }) {
    return helloWorld?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? helloWorld,
    required TResult orElse(),
  }) {
    if (helloWorld != null) {
      return helloWorld(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IsolateRequestHelloWorld value) helloWorld,
  }) {
    return helloWorld(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(IsolateRequestHelloWorld value)? helloWorld,
  }) {
    return helloWorld?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IsolateRequestHelloWorld value)? helloWorld,
    required TResult orElse(),
  }) {
    if (helloWorld != null) {
      return helloWorld(this);
    }
    return orElse();
  }
}

abstract class IsolateRequestHelloWorld implements IsolateRequest {
  const factory IsolateRequestHelloWorld(String message) =
      _$IsolateRequestHelloWorld;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  $IsolateRequestHelloWorldCopyWith<IsolateRequestHelloWorld> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'isolate_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$IsolateResponseTearOff {
  const _$IsolateResponseTearOff();

  _IsolateResponse call(
      {required IsolateRequest request, required Object payload}) {
    return _IsolateResponse(
      request: request,
      payload: payload,
    );
  }
}

/// @nodoc
const $IsolateResponse = _$IsolateResponseTearOff();

/// @nodoc
mixin _$IsolateResponse {
  IsolateRequest get request => throw _privateConstructorUsedError;
  Object get payload => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IsolateResponseCopyWith<IsolateResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IsolateResponseCopyWith<$Res> {
  factory $IsolateResponseCopyWith(
          IsolateResponse value, $Res Function(IsolateResponse) then) =
      _$IsolateResponseCopyWithImpl<$Res>;
  $Res call({IsolateRequest request, Object payload});

  $IsolateRequestCopyWith<$Res> get request;
}

/// @nodoc
class _$IsolateResponseCopyWithImpl<$Res>
    implements $IsolateResponseCopyWith<$Res> {
  _$IsolateResponseCopyWithImpl(this._value, this._then);

  final IsolateResponse _value;
  // ignore: unused_field
  final $Res Function(IsolateResponse) _then;

  @override
  $Res call({
    Object? request = freezed,
    Object? payload = freezed,
  }) {
    return _then(_value.copyWith(
      request: request == freezed
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as IsolateRequest,
      payload: payload == freezed
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Object,
    ));
  }

  @override
  $IsolateRequestCopyWith<$Res> get request {
    return $IsolateRequestCopyWith<$Res>(_value.request, (value) {
      return _then(_value.copyWith(request: value));
    });
  }
}

/// @nodoc
abstract class _$IsolateResponseCopyWith<$Res>
    implements $IsolateResponseCopyWith<$Res> {
  factory _$IsolateResponseCopyWith(
          _IsolateResponse value, $Res Function(_IsolateResponse) then) =
      __$IsolateResponseCopyWithImpl<$Res>;
  @override
  $Res call({IsolateRequest request, Object payload});

  @override
  $IsolateRequestCopyWith<$Res> get request;
}

/// @nodoc
class __$IsolateResponseCopyWithImpl<$Res>
    extends _$IsolateResponseCopyWithImpl<$Res>
    implements _$IsolateResponseCopyWith<$Res> {
  __$IsolateResponseCopyWithImpl(
      _IsolateResponse _value, $Res Function(_IsolateResponse) _then)
      : super(_value, (v) => _then(v as _IsolateResponse));

  @override
  _IsolateResponse get _value => super._value as _IsolateResponse;

  @override
  $Res call({
    Object? request = freezed,
    Object? payload = freezed,
  }) {
    return _then(_IsolateResponse(
      request: request == freezed
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as IsolateRequest,
      payload: payload == freezed
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Object,
    ));
  }
}

/// @nodoc

class _$_IsolateResponse implements _IsolateResponse {
  const _$_IsolateResponse({required this.request, required this.payload});

  @override
  final IsolateRequest request;
  @override
  final Object payload;

  @override
  String toString() {
    return 'IsolateResponse(request: $request, payload: $payload)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IsolateResponse &&
            const DeepCollectionEquality().equals(other.request, request) &&
            const DeepCollectionEquality().equals(other.payload, payload));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(request),
      const DeepCollectionEquality().hash(payload));

  @JsonKey(ignore: true)
  @override
  _$IsolateResponseCopyWith<_IsolateResponse> get copyWith =>
      __$IsolateResponseCopyWithImpl<_IsolateResponse>(this, _$identity);
}

abstract class _IsolateResponse implements IsolateResponse {
  const factory _IsolateResponse(
      {required IsolateRequest request,
      required Object payload}) = _$_IsolateResponse;

  @override
  IsolateRequest get request;
  @override
  Object get payload;
  @override
  @JsonKey(ignore: true)
  _$IsolateResponseCopyWith<_IsolateResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

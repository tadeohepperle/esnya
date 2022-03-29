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

  IsolateRequestFoodMappingRepositoryMapInput foodMappingRepositoryMapInput(
      String input) {
    return IsolateRequestFoodMappingRepositoryMapInput(
      input,
    );
  }

  IsolateRequestFoodDataRepositoryGetFoodFromID foodDataRepositoryGetFoodFromID(
      String id) {
    return IsolateRequestFoodDataRepositoryGetFoodFromID(
      id,
    );
  }
}

/// @nodoc
const $IsolateRequest = _$IsolateRequestTearOff();

/// @nodoc
mixin _$IsolateRequest {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) helloWorld,
    required TResult Function(String input) foodMappingRepositoryMapInput,
    required TResult Function(String id) foodDataRepositoryGetFoodFromID,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? helloWorld,
    TResult Function(String input)? foodMappingRepositoryMapInput,
    TResult Function(String id)? foodDataRepositoryGetFoodFromID,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? helloWorld,
    TResult Function(String input)? foodMappingRepositoryMapInput,
    TResult Function(String id)? foodDataRepositoryGetFoodFromID,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IsolateRequestHelloWorld value) helloWorld,
    required TResult Function(IsolateRequestFoodMappingRepositoryMapInput value)
        foodMappingRepositoryMapInput,
    required TResult Function(
            IsolateRequestFoodDataRepositoryGetFoodFromID value)
        foodDataRepositoryGetFoodFromID,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(IsolateRequestHelloWorld value)? helloWorld,
    TResult Function(IsolateRequestFoodMappingRepositoryMapInput value)?
        foodMappingRepositoryMapInput,
    TResult Function(IsolateRequestFoodDataRepositoryGetFoodFromID value)?
        foodDataRepositoryGetFoodFromID,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IsolateRequestHelloWorld value)? helloWorld,
    TResult Function(IsolateRequestFoodMappingRepositoryMapInput value)?
        foodMappingRepositoryMapInput,
    TResult Function(IsolateRequestFoodDataRepositoryGetFoodFromID value)?
        foodDataRepositoryGetFoodFromID,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IsolateRequestCopyWith<$Res> {
  factory $IsolateRequestCopyWith(
          IsolateRequest value, $Res Function(IsolateRequest) then) =
      _$IsolateRequestCopyWithImpl<$Res>;
}

/// @nodoc
class _$IsolateRequestCopyWithImpl<$Res>
    implements $IsolateRequestCopyWith<$Res> {
  _$IsolateRequestCopyWithImpl(this._value, this._then);

  final IsolateRequest _value;
  // ignore: unused_field
  final $Res Function(IsolateRequest) _then;
}

/// @nodoc
abstract class $IsolateRequestHelloWorldCopyWith<$Res> {
  factory $IsolateRequestHelloWorldCopyWith(IsolateRequestHelloWorld value,
          $Res Function(IsolateRequestHelloWorld) then) =
      _$IsolateRequestHelloWorldCopyWithImpl<$Res>;
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
    required TResult Function(String input) foodMappingRepositoryMapInput,
    required TResult Function(String id) foodDataRepositoryGetFoodFromID,
  }) {
    return helloWorld(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? helloWorld,
    TResult Function(String input)? foodMappingRepositoryMapInput,
    TResult Function(String id)? foodDataRepositoryGetFoodFromID,
  }) {
    return helloWorld?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? helloWorld,
    TResult Function(String input)? foodMappingRepositoryMapInput,
    TResult Function(String id)? foodDataRepositoryGetFoodFromID,
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
    required TResult Function(IsolateRequestFoodMappingRepositoryMapInput value)
        foodMappingRepositoryMapInput,
    required TResult Function(
            IsolateRequestFoodDataRepositoryGetFoodFromID value)
        foodDataRepositoryGetFoodFromID,
  }) {
    return helloWorld(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(IsolateRequestHelloWorld value)? helloWorld,
    TResult Function(IsolateRequestFoodMappingRepositoryMapInput value)?
        foodMappingRepositoryMapInput,
    TResult Function(IsolateRequestFoodDataRepositoryGetFoodFromID value)?
        foodDataRepositoryGetFoodFromID,
  }) {
    return helloWorld?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IsolateRequestHelloWorld value)? helloWorld,
    TResult Function(IsolateRequestFoodMappingRepositoryMapInput value)?
        foodMappingRepositoryMapInput,
    TResult Function(IsolateRequestFoodDataRepositoryGetFoodFromID value)?
        foodDataRepositoryGetFoodFromID,
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

  String get message;
  @JsonKey(ignore: true)
  $IsolateRequestHelloWorldCopyWith<IsolateRequestHelloWorld> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IsolateRequestFoodMappingRepositoryMapInputCopyWith<$Res> {
  factory $IsolateRequestFoodMappingRepositoryMapInputCopyWith(
          IsolateRequestFoodMappingRepositoryMapInput value,
          $Res Function(IsolateRequestFoodMappingRepositoryMapInput) then) =
      _$IsolateRequestFoodMappingRepositoryMapInputCopyWithImpl<$Res>;
  $Res call({String input});
}

/// @nodoc
class _$IsolateRequestFoodMappingRepositoryMapInputCopyWithImpl<$Res>
    extends _$IsolateRequestCopyWithImpl<$Res>
    implements $IsolateRequestFoodMappingRepositoryMapInputCopyWith<$Res> {
  _$IsolateRequestFoodMappingRepositoryMapInputCopyWithImpl(
      IsolateRequestFoodMappingRepositoryMapInput _value,
      $Res Function(IsolateRequestFoodMappingRepositoryMapInput) _then)
      : super(_value,
            (v) => _then(v as IsolateRequestFoodMappingRepositoryMapInput));

  @override
  IsolateRequestFoodMappingRepositoryMapInput get _value =>
      super._value as IsolateRequestFoodMappingRepositoryMapInput;

  @override
  $Res call({
    Object? input = freezed,
  }) {
    return _then(IsolateRequestFoodMappingRepositoryMapInput(
      input == freezed
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$IsolateRequestFoodMappingRepositoryMapInput
    implements IsolateRequestFoodMappingRepositoryMapInput {
  const _$IsolateRequestFoodMappingRepositoryMapInput(this.input);

  @override
  final String input;

  @override
  String toString() {
    return 'IsolateRequest.foodMappingRepositoryMapInput(input: $input)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IsolateRequestFoodMappingRepositoryMapInput &&
            const DeepCollectionEquality().equals(other.input, input));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(input));

  @JsonKey(ignore: true)
  @override
  $IsolateRequestFoodMappingRepositoryMapInputCopyWith<
          IsolateRequestFoodMappingRepositoryMapInput>
      get copyWith => _$IsolateRequestFoodMappingRepositoryMapInputCopyWithImpl<
          IsolateRequestFoodMappingRepositoryMapInput>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) helloWorld,
    required TResult Function(String input) foodMappingRepositoryMapInput,
    required TResult Function(String id) foodDataRepositoryGetFoodFromID,
  }) {
    return foodMappingRepositoryMapInput(input);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? helloWorld,
    TResult Function(String input)? foodMappingRepositoryMapInput,
    TResult Function(String id)? foodDataRepositoryGetFoodFromID,
  }) {
    return foodMappingRepositoryMapInput?.call(input);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? helloWorld,
    TResult Function(String input)? foodMappingRepositoryMapInput,
    TResult Function(String id)? foodDataRepositoryGetFoodFromID,
    required TResult orElse(),
  }) {
    if (foodMappingRepositoryMapInput != null) {
      return foodMappingRepositoryMapInput(input);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IsolateRequestHelloWorld value) helloWorld,
    required TResult Function(IsolateRequestFoodMappingRepositoryMapInput value)
        foodMappingRepositoryMapInput,
    required TResult Function(
            IsolateRequestFoodDataRepositoryGetFoodFromID value)
        foodDataRepositoryGetFoodFromID,
  }) {
    return foodMappingRepositoryMapInput(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(IsolateRequestHelloWorld value)? helloWorld,
    TResult Function(IsolateRequestFoodMappingRepositoryMapInput value)?
        foodMappingRepositoryMapInput,
    TResult Function(IsolateRequestFoodDataRepositoryGetFoodFromID value)?
        foodDataRepositoryGetFoodFromID,
  }) {
    return foodMappingRepositoryMapInput?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IsolateRequestHelloWorld value)? helloWorld,
    TResult Function(IsolateRequestFoodMappingRepositoryMapInput value)?
        foodMappingRepositoryMapInput,
    TResult Function(IsolateRequestFoodDataRepositoryGetFoodFromID value)?
        foodDataRepositoryGetFoodFromID,
    required TResult orElse(),
  }) {
    if (foodMappingRepositoryMapInput != null) {
      return foodMappingRepositoryMapInput(this);
    }
    return orElse();
  }
}

abstract class IsolateRequestFoodMappingRepositoryMapInput
    implements IsolateRequest {
  const factory IsolateRequestFoodMappingRepositoryMapInput(String input) =
      _$IsolateRequestFoodMappingRepositoryMapInput;

  String get input;
  @JsonKey(ignore: true)
  $IsolateRequestFoodMappingRepositoryMapInputCopyWith<
          IsolateRequestFoodMappingRepositoryMapInput>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IsolateRequestFoodDataRepositoryGetFoodFromIDCopyWith<$Res> {
  factory $IsolateRequestFoodDataRepositoryGetFoodFromIDCopyWith(
          IsolateRequestFoodDataRepositoryGetFoodFromID value,
          $Res Function(IsolateRequestFoodDataRepositoryGetFoodFromID) then) =
      _$IsolateRequestFoodDataRepositoryGetFoodFromIDCopyWithImpl<$Res>;
  $Res call({String id});
}

/// @nodoc
class _$IsolateRequestFoodDataRepositoryGetFoodFromIDCopyWithImpl<$Res>
    extends _$IsolateRequestCopyWithImpl<$Res>
    implements $IsolateRequestFoodDataRepositoryGetFoodFromIDCopyWith<$Res> {
  _$IsolateRequestFoodDataRepositoryGetFoodFromIDCopyWithImpl(
      IsolateRequestFoodDataRepositoryGetFoodFromID _value,
      $Res Function(IsolateRequestFoodDataRepositoryGetFoodFromID) _then)
      : super(_value,
            (v) => _then(v as IsolateRequestFoodDataRepositoryGetFoodFromID));

  @override
  IsolateRequestFoodDataRepositoryGetFoodFromID get _value =>
      super._value as IsolateRequestFoodDataRepositoryGetFoodFromID;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(IsolateRequestFoodDataRepositoryGetFoodFromID(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$IsolateRequestFoodDataRepositoryGetFoodFromID
    implements IsolateRequestFoodDataRepositoryGetFoodFromID {
  const _$IsolateRequestFoodDataRepositoryGetFoodFromID(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'IsolateRequest.foodDataRepositoryGetFoodFromID(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IsolateRequestFoodDataRepositoryGetFoodFromID &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  $IsolateRequestFoodDataRepositoryGetFoodFromIDCopyWith<
          IsolateRequestFoodDataRepositoryGetFoodFromID>
      get copyWith =>
          _$IsolateRequestFoodDataRepositoryGetFoodFromIDCopyWithImpl<
              IsolateRequestFoodDataRepositoryGetFoodFromID>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) helloWorld,
    required TResult Function(String input) foodMappingRepositoryMapInput,
    required TResult Function(String id) foodDataRepositoryGetFoodFromID,
  }) {
    return foodDataRepositoryGetFoodFromID(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? helloWorld,
    TResult Function(String input)? foodMappingRepositoryMapInput,
    TResult Function(String id)? foodDataRepositoryGetFoodFromID,
  }) {
    return foodDataRepositoryGetFoodFromID?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? helloWorld,
    TResult Function(String input)? foodMappingRepositoryMapInput,
    TResult Function(String id)? foodDataRepositoryGetFoodFromID,
    required TResult orElse(),
  }) {
    if (foodDataRepositoryGetFoodFromID != null) {
      return foodDataRepositoryGetFoodFromID(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IsolateRequestHelloWorld value) helloWorld,
    required TResult Function(IsolateRequestFoodMappingRepositoryMapInput value)
        foodMappingRepositoryMapInput,
    required TResult Function(
            IsolateRequestFoodDataRepositoryGetFoodFromID value)
        foodDataRepositoryGetFoodFromID,
  }) {
    return foodDataRepositoryGetFoodFromID(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(IsolateRequestHelloWorld value)? helloWorld,
    TResult Function(IsolateRequestFoodMappingRepositoryMapInput value)?
        foodMappingRepositoryMapInput,
    TResult Function(IsolateRequestFoodDataRepositoryGetFoodFromID value)?
        foodDataRepositoryGetFoodFromID,
  }) {
    return foodDataRepositoryGetFoodFromID?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IsolateRequestHelloWorld value)? helloWorld,
    TResult Function(IsolateRequestFoodMappingRepositoryMapInput value)?
        foodMappingRepositoryMapInput,
    TResult Function(IsolateRequestFoodDataRepositoryGetFoodFromID value)?
        foodDataRepositoryGetFoodFromID,
    required TResult orElse(),
  }) {
    if (foodDataRepositoryGetFoodFromID != null) {
      return foodDataRepositoryGetFoodFromID(this);
    }
    return orElse();
  }
}

abstract class IsolateRequestFoodDataRepositoryGetFoodFromID
    implements IsolateRequest {
  const factory IsolateRequestFoodDataRepositoryGetFoodFromID(String id) =
      _$IsolateRequestFoodDataRepositoryGetFoodFromID;

  String get id;
  @JsonKey(ignore: true)
  $IsolateRequestFoodDataRepositoryGetFoodFromIDCopyWith<
          IsolateRequestFoodDataRepositoryGetFoodFromID>
      get copyWith => throw _privateConstructorUsedError;
}

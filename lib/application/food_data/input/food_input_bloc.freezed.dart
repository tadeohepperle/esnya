// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'food_input_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FoodInputEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) setVolatileText,
    required TResult Function() saveVolatileText,
    required TResult Function(FoodItemEntryWrapper entry) fetchFood,
    required TResult Function(String contextId) setContext,
    required TResult Function(FoodInputMode mode) setFoodInputMode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String value)? setVolatileText,
    TResult Function()? saveVolatileText,
    TResult Function(FoodItemEntryWrapper entry)? fetchFood,
    TResult Function(String contextId)? setContext,
    TResult Function(FoodInputMode mode)? setFoodInputMode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? setVolatileText,
    TResult Function()? saveVolatileText,
    TResult Function(FoodItemEntryWrapper entry)? fetchFood,
    TResult Function(String contextId)? setContext,
    TResult Function(FoodInputMode mode)? setFoodInputMode,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetVolatileText value) setVolatileText,
    required TResult Function(_SaveVolatileText value) saveVolatileText,
    required TResult Function(_FetchFood value) fetchFood,
    required TResult Function(_SetContext value) setContext,
    required TResult Function(_SetFoodInputMode value) setFoodInputMode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SetVolatileText value)? setVolatileText,
    TResult Function(_SaveVolatileText value)? saveVolatileText,
    TResult Function(_FetchFood value)? fetchFood,
    TResult Function(_SetContext value)? setContext,
    TResult Function(_SetFoodInputMode value)? setFoodInputMode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetVolatileText value)? setVolatileText,
    TResult Function(_SaveVolatileText value)? saveVolatileText,
    TResult Function(_FetchFood value)? fetchFood,
    TResult Function(_SetContext value)? setContext,
    TResult Function(_SetFoodInputMode value)? setFoodInputMode,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodInputEventCopyWith<$Res> {
  factory $FoodInputEventCopyWith(
          FoodInputEvent value, $Res Function(FoodInputEvent) then) =
      _$FoodInputEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$FoodInputEventCopyWithImpl<$Res>
    implements $FoodInputEventCopyWith<$Res> {
  _$FoodInputEventCopyWithImpl(this._value, this._then);

  final FoodInputEvent _value;
  // ignore: unused_field
  final $Res Function(FoodInputEvent) _then;
}

/// @nodoc
abstract class _$SetVolatileTextCopyWith<$Res> {
  factory _$SetVolatileTextCopyWith(
          _SetVolatileText value, $Res Function(_SetVolatileText) then) =
      __$SetVolatileTextCopyWithImpl<$Res>;
  $Res call({String value});
}

/// @nodoc
class __$SetVolatileTextCopyWithImpl<$Res>
    extends _$FoodInputEventCopyWithImpl<$Res>
    implements _$SetVolatileTextCopyWith<$Res> {
  __$SetVolatileTextCopyWithImpl(
      _SetVolatileText _value, $Res Function(_SetVolatileText) _then)
      : super(_value, (v) => _then(v as _SetVolatileText));

  @override
  _SetVolatileText get _value => super._value as _SetVolatileText;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_SetVolatileText(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SetVolatileText implements _SetVolatileText {
  const _$_SetVolatileText(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'FoodInputEvent.setVolatileText(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SetVolatileText &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$SetVolatileTextCopyWith<_SetVolatileText> get copyWith =>
      __$SetVolatileTextCopyWithImpl<_SetVolatileText>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) setVolatileText,
    required TResult Function() saveVolatileText,
    required TResult Function(FoodItemEntryWrapper entry) fetchFood,
    required TResult Function(String contextId) setContext,
    required TResult Function(FoodInputMode mode) setFoodInputMode,
  }) {
    return setVolatileText(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String value)? setVolatileText,
    TResult Function()? saveVolatileText,
    TResult Function(FoodItemEntryWrapper entry)? fetchFood,
    TResult Function(String contextId)? setContext,
    TResult Function(FoodInputMode mode)? setFoodInputMode,
  }) {
    return setVolatileText?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? setVolatileText,
    TResult Function()? saveVolatileText,
    TResult Function(FoodItemEntryWrapper entry)? fetchFood,
    TResult Function(String contextId)? setContext,
    TResult Function(FoodInputMode mode)? setFoodInputMode,
    required TResult orElse(),
  }) {
    if (setVolatileText != null) {
      return setVolatileText(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetVolatileText value) setVolatileText,
    required TResult Function(_SaveVolatileText value) saveVolatileText,
    required TResult Function(_FetchFood value) fetchFood,
    required TResult Function(_SetContext value) setContext,
    required TResult Function(_SetFoodInputMode value) setFoodInputMode,
  }) {
    return setVolatileText(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SetVolatileText value)? setVolatileText,
    TResult Function(_SaveVolatileText value)? saveVolatileText,
    TResult Function(_FetchFood value)? fetchFood,
    TResult Function(_SetContext value)? setContext,
    TResult Function(_SetFoodInputMode value)? setFoodInputMode,
  }) {
    return setVolatileText?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetVolatileText value)? setVolatileText,
    TResult Function(_SaveVolatileText value)? saveVolatileText,
    TResult Function(_FetchFood value)? fetchFood,
    TResult Function(_SetContext value)? setContext,
    TResult Function(_SetFoodInputMode value)? setFoodInputMode,
    required TResult orElse(),
  }) {
    if (setVolatileText != null) {
      return setVolatileText(this);
    }
    return orElse();
  }
}

abstract class _SetVolatileText implements FoodInputEvent {
  const factory _SetVolatileText(final String value) = _$_SetVolatileText;

  String get value => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$SetVolatileTextCopyWith<_SetVolatileText> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SaveVolatileTextCopyWith<$Res> {
  factory _$SaveVolatileTextCopyWith(
          _SaveVolatileText value, $Res Function(_SaveVolatileText) then) =
      __$SaveVolatileTextCopyWithImpl<$Res>;
}

/// @nodoc
class __$SaveVolatileTextCopyWithImpl<$Res>
    extends _$FoodInputEventCopyWithImpl<$Res>
    implements _$SaveVolatileTextCopyWith<$Res> {
  __$SaveVolatileTextCopyWithImpl(
      _SaveVolatileText _value, $Res Function(_SaveVolatileText) _then)
      : super(_value, (v) => _then(v as _SaveVolatileText));

  @override
  _SaveVolatileText get _value => super._value as _SaveVolatileText;
}

/// @nodoc

class _$_SaveVolatileText implements _SaveVolatileText {
  const _$_SaveVolatileText();

  @override
  String toString() {
    return 'FoodInputEvent.saveVolatileText()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SaveVolatileText);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) setVolatileText,
    required TResult Function() saveVolatileText,
    required TResult Function(FoodItemEntryWrapper entry) fetchFood,
    required TResult Function(String contextId) setContext,
    required TResult Function(FoodInputMode mode) setFoodInputMode,
  }) {
    return saveVolatileText();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String value)? setVolatileText,
    TResult Function()? saveVolatileText,
    TResult Function(FoodItemEntryWrapper entry)? fetchFood,
    TResult Function(String contextId)? setContext,
    TResult Function(FoodInputMode mode)? setFoodInputMode,
  }) {
    return saveVolatileText?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? setVolatileText,
    TResult Function()? saveVolatileText,
    TResult Function(FoodItemEntryWrapper entry)? fetchFood,
    TResult Function(String contextId)? setContext,
    TResult Function(FoodInputMode mode)? setFoodInputMode,
    required TResult orElse(),
  }) {
    if (saveVolatileText != null) {
      return saveVolatileText();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetVolatileText value) setVolatileText,
    required TResult Function(_SaveVolatileText value) saveVolatileText,
    required TResult Function(_FetchFood value) fetchFood,
    required TResult Function(_SetContext value) setContext,
    required TResult Function(_SetFoodInputMode value) setFoodInputMode,
  }) {
    return saveVolatileText(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SetVolatileText value)? setVolatileText,
    TResult Function(_SaveVolatileText value)? saveVolatileText,
    TResult Function(_FetchFood value)? fetchFood,
    TResult Function(_SetContext value)? setContext,
    TResult Function(_SetFoodInputMode value)? setFoodInputMode,
  }) {
    return saveVolatileText?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetVolatileText value)? setVolatileText,
    TResult Function(_SaveVolatileText value)? saveVolatileText,
    TResult Function(_FetchFood value)? fetchFood,
    TResult Function(_SetContext value)? setContext,
    TResult Function(_SetFoodInputMode value)? setFoodInputMode,
    required TResult orElse(),
  }) {
    if (saveVolatileText != null) {
      return saveVolatileText(this);
    }
    return orElse();
  }
}

abstract class _SaveVolatileText implements FoodInputEvent {
  const factory _SaveVolatileText() = _$_SaveVolatileText;
}

/// @nodoc
abstract class _$FetchFoodCopyWith<$Res> {
  factory _$FetchFoodCopyWith(
          _FetchFood value, $Res Function(_FetchFood) then) =
      __$FetchFoodCopyWithImpl<$Res>;
  $Res call({FoodItemEntryWrapper entry});

  $FoodItemEntryWrapperCopyWith<$Res> get entry;
}

/// @nodoc
class __$FetchFoodCopyWithImpl<$Res> extends _$FoodInputEventCopyWithImpl<$Res>
    implements _$FetchFoodCopyWith<$Res> {
  __$FetchFoodCopyWithImpl(_FetchFood _value, $Res Function(_FetchFood) _then)
      : super(_value, (v) => _then(v as _FetchFood));

  @override
  _FetchFood get _value => super._value as _FetchFood;

  @override
  $Res call({
    Object? entry = freezed,
  }) {
    return _then(_FetchFood(
      entry == freezed
          ? _value.entry
          : entry // ignore: cast_nullable_to_non_nullable
              as FoodItemEntryWrapper,
    ));
  }

  @override
  $FoodItemEntryWrapperCopyWith<$Res> get entry {
    return $FoodItemEntryWrapperCopyWith<$Res>(_value.entry, (value) {
      return _then(_value.copyWith(entry: value));
    });
  }
}

/// @nodoc

class _$_FetchFood implements _FetchFood {
  const _$_FetchFood(this.entry);

  @override
  final FoodItemEntryWrapper entry;

  @override
  String toString() {
    return 'FoodInputEvent.fetchFood(entry: $entry)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FetchFood &&
            const DeepCollectionEquality().equals(other.entry, entry));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(entry));

  @JsonKey(ignore: true)
  @override
  _$FetchFoodCopyWith<_FetchFood> get copyWith =>
      __$FetchFoodCopyWithImpl<_FetchFood>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) setVolatileText,
    required TResult Function() saveVolatileText,
    required TResult Function(FoodItemEntryWrapper entry) fetchFood,
    required TResult Function(String contextId) setContext,
    required TResult Function(FoodInputMode mode) setFoodInputMode,
  }) {
    return fetchFood(entry);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String value)? setVolatileText,
    TResult Function()? saveVolatileText,
    TResult Function(FoodItemEntryWrapper entry)? fetchFood,
    TResult Function(String contextId)? setContext,
    TResult Function(FoodInputMode mode)? setFoodInputMode,
  }) {
    return fetchFood?.call(entry);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? setVolatileText,
    TResult Function()? saveVolatileText,
    TResult Function(FoodItemEntryWrapper entry)? fetchFood,
    TResult Function(String contextId)? setContext,
    TResult Function(FoodInputMode mode)? setFoodInputMode,
    required TResult orElse(),
  }) {
    if (fetchFood != null) {
      return fetchFood(entry);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetVolatileText value) setVolatileText,
    required TResult Function(_SaveVolatileText value) saveVolatileText,
    required TResult Function(_FetchFood value) fetchFood,
    required TResult Function(_SetContext value) setContext,
    required TResult Function(_SetFoodInputMode value) setFoodInputMode,
  }) {
    return fetchFood(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SetVolatileText value)? setVolatileText,
    TResult Function(_SaveVolatileText value)? saveVolatileText,
    TResult Function(_FetchFood value)? fetchFood,
    TResult Function(_SetContext value)? setContext,
    TResult Function(_SetFoodInputMode value)? setFoodInputMode,
  }) {
    return fetchFood?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetVolatileText value)? setVolatileText,
    TResult Function(_SaveVolatileText value)? saveVolatileText,
    TResult Function(_FetchFood value)? fetchFood,
    TResult Function(_SetContext value)? setContext,
    TResult Function(_SetFoodInputMode value)? setFoodInputMode,
    required TResult orElse(),
  }) {
    if (fetchFood != null) {
      return fetchFood(this);
    }
    return orElse();
  }
}

abstract class _FetchFood implements FoodInputEvent {
  const factory _FetchFood(final FoodItemEntryWrapper entry) = _$_FetchFood;

  FoodItemEntryWrapper get entry => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$FetchFoodCopyWith<_FetchFood> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SetContextCopyWith<$Res> {
  factory _$SetContextCopyWith(
          _SetContext value, $Res Function(_SetContext) then) =
      __$SetContextCopyWithImpl<$Res>;
  $Res call({String contextId});
}

/// @nodoc
class __$SetContextCopyWithImpl<$Res> extends _$FoodInputEventCopyWithImpl<$Res>
    implements _$SetContextCopyWith<$Res> {
  __$SetContextCopyWithImpl(
      _SetContext _value, $Res Function(_SetContext) _then)
      : super(_value, (v) => _then(v as _SetContext));

  @override
  _SetContext get _value => super._value as _SetContext;

  @override
  $Res call({
    Object? contextId = freezed,
  }) {
    return _then(_SetContext(
      contextId == freezed
          ? _value.contextId
          : contextId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SetContext implements _SetContext {
  const _$_SetContext(this.contextId);

  @override
  final String contextId;

  @override
  String toString() {
    return 'FoodInputEvent.setContext(contextId: $contextId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SetContext &&
            const DeepCollectionEquality().equals(other.contextId, contextId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(contextId));

  @JsonKey(ignore: true)
  @override
  _$SetContextCopyWith<_SetContext> get copyWith =>
      __$SetContextCopyWithImpl<_SetContext>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) setVolatileText,
    required TResult Function() saveVolatileText,
    required TResult Function(FoodItemEntryWrapper entry) fetchFood,
    required TResult Function(String contextId) setContext,
    required TResult Function(FoodInputMode mode) setFoodInputMode,
  }) {
    return setContext(contextId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String value)? setVolatileText,
    TResult Function()? saveVolatileText,
    TResult Function(FoodItemEntryWrapper entry)? fetchFood,
    TResult Function(String contextId)? setContext,
    TResult Function(FoodInputMode mode)? setFoodInputMode,
  }) {
    return setContext?.call(contextId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? setVolatileText,
    TResult Function()? saveVolatileText,
    TResult Function(FoodItemEntryWrapper entry)? fetchFood,
    TResult Function(String contextId)? setContext,
    TResult Function(FoodInputMode mode)? setFoodInputMode,
    required TResult orElse(),
  }) {
    if (setContext != null) {
      return setContext(contextId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetVolatileText value) setVolatileText,
    required TResult Function(_SaveVolatileText value) saveVolatileText,
    required TResult Function(_FetchFood value) fetchFood,
    required TResult Function(_SetContext value) setContext,
    required TResult Function(_SetFoodInputMode value) setFoodInputMode,
  }) {
    return setContext(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SetVolatileText value)? setVolatileText,
    TResult Function(_SaveVolatileText value)? saveVolatileText,
    TResult Function(_FetchFood value)? fetchFood,
    TResult Function(_SetContext value)? setContext,
    TResult Function(_SetFoodInputMode value)? setFoodInputMode,
  }) {
    return setContext?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetVolatileText value)? setVolatileText,
    TResult Function(_SaveVolatileText value)? saveVolatileText,
    TResult Function(_FetchFood value)? fetchFood,
    TResult Function(_SetContext value)? setContext,
    TResult Function(_SetFoodInputMode value)? setFoodInputMode,
    required TResult orElse(),
  }) {
    if (setContext != null) {
      return setContext(this);
    }
    return orElse();
  }
}

abstract class _SetContext implements FoodInputEvent {
  const factory _SetContext(final String contextId) = _$_SetContext;

  String get contextId => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$SetContextCopyWith<_SetContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SetFoodInputModeCopyWith<$Res> {
  factory _$SetFoodInputModeCopyWith(
          _SetFoodInputMode value, $Res Function(_SetFoodInputMode) then) =
      __$SetFoodInputModeCopyWithImpl<$Res>;
  $Res call({FoodInputMode mode});
}

/// @nodoc
class __$SetFoodInputModeCopyWithImpl<$Res>
    extends _$FoodInputEventCopyWithImpl<$Res>
    implements _$SetFoodInputModeCopyWith<$Res> {
  __$SetFoodInputModeCopyWithImpl(
      _SetFoodInputMode _value, $Res Function(_SetFoodInputMode) _then)
      : super(_value, (v) => _then(v as _SetFoodInputMode));

  @override
  _SetFoodInputMode get _value => super._value as _SetFoodInputMode;

  @override
  $Res call({
    Object? mode = freezed,
  }) {
    return _then(_SetFoodInputMode(
      mode == freezed
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as FoodInputMode,
    ));
  }
}

/// @nodoc

class _$_SetFoodInputMode implements _SetFoodInputMode {
  const _$_SetFoodInputMode(this.mode);

  @override
  final FoodInputMode mode;

  @override
  String toString() {
    return 'FoodInputEvent.setFoodInputMode(mode: $mode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SetFoodInputMode &&
            const DeepCollectionEquality().equals(other.mode, mode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(mode));

  @JsonKey(ignore: true)
  @override
  _$SetFoodInputModeCopyWith<_SetFoodInputMode> get copyWith =>
      __$SetFoodInputModeCopyWithImpl<_SetFoodInputMode>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) setVolatileText,
    required TResult Function() saveVolatileText,
    required TResult Function(FoodItemEntryWrapper entry) fetchFood,
    required TResult Function(String contextId) setContext,
    required TResult Function(FoodInputMode mode) setFoodInputMode,
  }) {
    return setFoodInputMode(mode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String value)? setVolatileText,
    TResult Function()? saveVolatileText,
    TResult Function(FoodItemEntryWrapper entry)? fetchFood,
    TResult Function(String contextId)? setContext,
    TResult Function(FoodInputMode mode)? setFoodInputMode,
  }) {
    return setFoodInputMode?.call(mode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? setVolatileText,
    TResult Function()? saveVolatileText,
    TResult Function(FoodItemEntryWrapper entry)? fetchFood,
    TResult Function(String contextId)? setContext,
    TResult Function(FoodInputMode mode)? setFoodInputMode,
    required TResult orElse(),
  }) {
    if (setFoodInputMode != null) {
      return setFoodInputMode(mode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetVolatileText value) setVolatileText,
    required TResult Function(_SaveVolatileText value) saveVolatileText,
    required TResult Function(_FetchFood value) fetchFood,
    required TResult Function(_SetContext value) setContext,
    required TResult Function(_SetFoodInputMode value) setFoodInputMode,
  }) {
    return setFoodInputMode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SetVolatileText value)? setVolatileText,
    TResult Function(_SaveVolatileText value)? saveVolatileText,
    TResult Function(_FetchFood value)? fetchFood,
    TResult Function(_SetContext value)? setContext,
    TResult Function(_SetFoodInputMode value)? setFoodInputMode,
  }) {
    return setFoodInputMode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetVolatileText value)? setVolatileText,
    TResult Function(_SaveVolatileText value)? saveVolatileText,
    TResult Function(_FetchFood value)? fetchFood,
    TResult Function(_SetContext value)? setContext,
    TResult Function(_SetFoodInputMode value)? setFoodInputMode,
    required TResult orElse(),
  }) {
    if (setFoodInputMode != null) {
      return setFoodInputMode(this);
    }
    return orElse();
  }
}

abstract class _SetFoodInputMode implements FoodInputEvent {
  const factory _SetFoodInputMode(final FoodInputMode mode) =
      _$_SetFoodInputMode;

  FoodInputMode get mode => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$SetFoodInputModeCopyWith<_SetFoodInputMode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FoodInputState {
  String get safeText => throw _privateConstructorUsedError;
  String get volatileText => throw _privateConstructorUsedError;
  FoodInputMode get foodInputMode => throw _privateConstructorUsedError;
  String? get contextId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FoodInputStateCopyWith<FoodInputState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodInputStateCopyWith<$Res> {
  factory $FoodInputStateCopyWith(
          FoodInputState value, $Res Function(FoodInputState) then) =
      _$FoodInputStateCopyWithImpl<$Res>;
  $Res call(
      {String safeText,
      String volatileText,
      FoodInputMode foodInputMode,
      String? contextId});
}

/// @nodoc
class _$FoodInputStateCopyWithImpl<$Res>
    implements $FoodInputStateCopyWith<$Res> {
  _$FoodInputStateCopyWithImpl(this._value, this._then);

  final FoodInputState _value;
  // ignore: unused_field
  final $Res Function(FoodInputState) _then;

  @override
  $Res call({
    Object? safeText = freezed,
    Object? volatileText = freezed,
    Object? foodInputMode = freezed,
    Object? contextId = freezed,
  }) {
    return _then(_value.copyWith(
      safeText: safeText == freezed
          ? _value.safeText
          : safeText // ignore: cast_nullable_to_non_nullable
              as String,
      volatileText: volatileText == freezed
          ? _value.volatileText
          : volatileText // ignore: cast_nullable_to_non_nullable
              as String,
      foodInputMode: foodInputMode == freezed
          ? _value.foodInputMode
          : foodInputMode // ignore: cast_nullable_to_non_nullable
              as FoodInputMode,
      contextId: contextId == freezed
          ? _value.contextId
          : contextId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$FoodInputStateCopyWith<$Res>
    implements $FoodInputStateCopyWith<$Res> {
  factory _$FoodInputStateCopyWith(
          _FoodInputState value, $Res Function(_FoodInputState) then) =
      __$FoodInputStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String safeText,
      String volatileText,
      FoodInputMode foodInputMode,
      String? contextId});
}

/// @nodoc
class __$FoodInputStateCopyWithImpl<$Res>
    extends _$FoodInputStateCopyWithImpl<$Res>
    implements _$FoodInputStateCopyWith<$Res> {
  __$FoodInputStateCopyWithImpl(
      _FoodInputState _value, $Res Function(_FoodInputState) _then)
      : super(_value, (v) => _then(v as _FoodInputState));

  @override
  _FoodInputState get _value => super._value as _FoodInputState;

  @override
  $Res call({
    Object? safeText = freezed,
    Object? volatileText = freezed,
    Object? foodInputMode = freezed,
    Object? contextId = freezed,
  }) {
    return _then(_FoodInputState(
      safeText: safeText == freezed
          ? _value.safeText
          : safeText // ignore: cast_nullable_to_non_nullable
              as String,
      volatileText: volatileText == freezed
          ? _value.volatileText
          : volatileText // ignore: cast_nullable_to_non_nullable
              as String,
      foodInputMode: foodInputMode == freezed
          ? _value.foodInputMode
          : foodInputMode // ignore: cast_nullable_to_non_nullable
              as FoodInputMode,
      contextId: contextId == freezed
          ? _value.contextId
          : contextId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_FoodInputState extends _FoodInputState {
  const _$_FoodInputState(
      {required this.safeText,
      required this.volatileText,
      required this.foodInputMode,
      this.contextId})
      : super._();

  @override
  final String safeText;
  @override
  final String volatileText;
  @override
  final FoodInputMode foodInputMode;
  @override
  final String? contextId;

  @override
  String toString() {
    return 'FoodInputState(safeText: $safeText, volatileText: $volatileText, foodInputMode: $foodInputMode, contextId: $contextId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FoodInputState &&
            const DeepCollectionEquality().equals(other.safeText, safeText) &&
            const DeepCollectionEquality()
                .equals(other.volatileText, volatileText) &&
            const DeepCollectionEquality()
                .equals(other.foodInputMode, foodInputMode) &&
            const DeepCollectionEquality().equals(other.contextId, contextId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(safeText),
      const DeepCollectionEquality().hash(volatileText),
      const DeepCollectionEquality().hash(foodInputMode),
      const DeepCollectionEquality().hash(contextId));

  @JsonKey(ignore: true)
  @override
  _$FoodInputStateCopyWith<_FoodInputState> get copyWith =>
      __$FoodInputStateCopyWithImpl<_FoodInputState>(this, _$identity);
}

abstract class _FoodInputState extends FoodInputState {
  const factory _FoodInputState(
      {required final String safeText,
      required final String volatileText,
      required final FoodInputMode foodInputMode,
      final String? contextId}) = _$_FoodInputState;
  const _FoodInputState._() : super._();

  @override
  String get safeText => throw _privateConstructorUsedError;
  @override
  String get volatileText => throw _privateConstructorUsedError;
  @override
  FoodInputMode get foodInputMode => throw _privateConstructorUsedError;
  @override
  String? get contextId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FoodInputStateCopyWith<_FoodInputState> get copyWith =>
      throw _privateConstructorUsedError;
}

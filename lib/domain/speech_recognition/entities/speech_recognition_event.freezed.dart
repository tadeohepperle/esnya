// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'speech_recognition_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SpeechRecognitionEvent {
  String get text => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) partial,
    required TResult Function(String text) safe,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String text)? partial,
    TResult Function(String text)? safe,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? partial,
    TResult Function(String text)? safe,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SpeechRecognitionEventPartial value) partial,
    required TResult Function(SpeechRecognitionEventSafe value) safe,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SpeechRecognitionEventPartial value)? partial,
    TResult Function(SpeechRecognitionEventSafe value)? safe,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SpeechRecognitionEventPartial value)? partial,
    TResult Function(SpeechRecognitionEventSafe value)? safe,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SpeechRecognitionEventCopyWith<SpeechRecognitionEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpeechRecognitionEventCopyWith<$Res> {
  factory $SpeechRecognitionEventCopyWith(SpeechRecognitionEvent value,
          $Res Function(SpeechRecognitionEvent) then) =
      _$SpeechRecognitionEventCopyWithImpl<$Res>;
  $Res call({String text});
}

/// @nodoc
class _$SpeechRecognitionEventCopyWithImpl<$Res>
    implements $SpeechRecognitionEventCopyWith<$Res> {
  _$SpeechRecognitionEventCopyWithImpl(this._value, this._then);

  final SpeechRecognitionEvent _value;
  // ignore: unused_field
  final $Res Function(SpeechRecognitionEvent) _then;

  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_value.copyWith(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class $SpeechRecognitionEventPartialCopyWith<$Res>
    implements $SpeechRecognitionEventCopyWith<$Res> {
  factory $SpeechRecognitionEventPartialCopyWith(
          SpeechRecognitionEventPartial value,
          $Res Function(SpeechRecognitionEventPartial) then) =
      _$SpeechRecognitionEventPartialCopyWithImpl<$Res>;
  @override
  $Res call({String text});
}

/// @nodoc
class _$SpeechRecognitionEventPartialCopyWithImpl<$Res>
    extends _$SpeechRecognitionEventCopyWithImpl<$Res>
    implements $SpeechRecognitionEventPartialCopyWith<$Res> {
  _$SpeechRecognitionEventPartialCopyWithImpl(
      SpeechRecognitionEventPartial _value,
      $Res Function(SpeechRecognitionEventPartial) _then)
      : super(_value, (v) => _then(v as SpeechRecognitionEventPartial));

  @override
  SpeechRecognitionEventPartial get _value =>
      super._value as SpeechRecognitionEventPartial;

  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(SpeechRecognitionEventPartial(
      text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SpeechRecognitionEventPartial implements SpeechRecognitionEventPartial {
  const _$SpeechRecognitionEventPartial(this.text);

  @override
  final String text;

  @override
  String toString() {
    return 'SpeechRecognitionEvent.partial(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SpeechRecognitionEventPartial &&
            const DeepCollectionEquality().equals(other.text, text));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(text));

  @JsonKey(ignore: true)
  @override
  $SpeechRecognitionEventPartialCopyWith<SpeechRecognitionEventPartial>
      get copyWith => _$SpeechRecognitionEventPartialCopyWithImpl<
          SpeechRecognitionEventPartial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) partial,
    required TResult Function(String text) safe,
  }) {
    return partial(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String text)? partial,
    TResult Function(String text)? safe,
  }) {
    return partial?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? partial,
    TResult Function(String text)? safe,
    required TResult orElse(),
  }) {
    if (partial != null) {
      return partial(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SpeechRecognitionEventPartial value) partial,
    required TResult Function(SpeechRecognitionEventSafe value) safe,
  }) {
    return partial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SpeechRecognitionEventPartial value)? partial,
    TResult Function(SpeechRecognitionEventSafe value)? safe,
  }) {
    return partial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SpeechRecognitionEventPartial value)? partial,
    TResult Function(SpeechRecognitionEventSafe value)? safe,
    required TResult orElse(),
  }) {
    if (partial != null) {
      return partial(this);
    }
    return orElse();
  }
}

abstract class SpeechRecognitionEventPartial implements SpeechRecognitionEvent {
  const factory SpeechRecognitionEventPartial(final String text) =
      _$SpeechRecognitionEventPartial;

  @override
  String get text => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $SpeechRecognitionEventPartialCopyWith<SpeechRecognitionEventPartial>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpeechRecognitionEventSafeCopyWith<$Res>
    implements $SpeechRecognitionEventCopyWith<$Res> {
  factory $SpeechRecognitionEventSafeCopyWith(SpeechRecognitionEventSafe value,
          $Res Function(SpeechRecognitionEventSafe) then) =
      _$SpeechRecognitionEventSafeCopyWithImpl<$Res>;
  @override
  $Res call({String text});
}

/// @nodoc
class _$SpeechRecognitionEventSafeCopyWithImpl<$Res>
    extends _$SpeechRecognitionEventCopyWithImpl<$Res>
    implements $SpeechRecognitionEventSafeCopyWith<$Res> {
  _$SpeechRecognitionEventSafeCopyWithImpl(SpeechRecognitionEventSafe _value,
      $Res Function(SpeechRecognitionEventSafe) _then)
      : super(_value, (v) => _then(v as SpeechRecognitionEventSafe));

  @override
  SpeechRecognitionEventSafe get _value =>
      super._value as SpeechRecognitionEventSafe;

  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(SpeechRecognitionEventSafe(
      text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SpeechRecognitionEventSafe implements SpeechRecognitionEventSafe {
  const _$SpeechRecognitionEventSafe(this.text);

  @override
  final String text;

  @override
  String toString() {
    return 'SpeechRecognitionEvent.safe(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SpeechRecognitionEventSafe &&
            const DeepCollectionEquality().equals(other.text, text));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(text));

  @JsonKey(ignore: true)
  @override
  $SpeechRecognitionEventSafeCopyWith<SpeechRecognitionEventSafe>
      get copyWith =>
          _$SpeechRecognitionEventSafeCopyWithImpl<SpeechRecognitionEventSafe>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) partial,
    required TResult Function(String text) safe,
  }) {
    return safe(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String text)? partial,
    TResult Function(String text)? safe,
  }) {
    return safe?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? partial,
    TResult Function(String text)? safe,
    required TResult orElse(),
  }) {
    if (safe != null) {
      return safe(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SpeechRecognitionEventPartial value) partial,
    required TResult Function(SpeechRecognitionEventSafe value) safe,
  }) {
    return safe(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SpeechRecognitionEventPartial value)? partial,
    TResult Function(SpeechRecognitionEventSafe value)? safe,
  }) {
    return safe?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SpeechRecognitionEventPartial value)? partial,
    TResult Function(SpeechRecognitionEventSafe value)? safe,
    required TResult orElse(),
  }) {
    if (safe != null) {
      return safe(this);
    }
    return orElse();
  }
}

abstract class SpeechRecognitionEventSafe implements SpeechRecognitionEvent {
  const factory SpeechRecognitionEventSafe(final String text) =
      _$SpeechRecognitionEventSafe;

  @override
  String get text => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $SpeechRecognitionEventSafeCopyWith<SpeechRecognitionEventSafe>
      get copyWith => throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'voice_input_sheet_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VoiceInputSheetState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String errorText) error,
    required TResult Function(String currentInput) recording,
    required TResult Function() stopped,
    required TResult Function(double progress) preparing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String errorText)? error,
    TResult Function(String currentInput)? recording,
    TResult Function()? stopped,
    TResult Function(double progress)? preparing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String errorText)? error,
    TResult Function(String currentInput)? recording,
    TResult Function()? stopped,
    TResult Function(double progress)? preparing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_Recording value) recording,
    required TResult Function(_Stopped value) stopped,
    required TResult Function(_Preparing value) preparing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Recording value)? recording,
    TResult Function(_Stopped value)? stopped,
    TResult Function(_Preparing value)? preparing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Recording value)? recording,
    TResult Function(_Stopped value)? stopped,
    TResult Function(_Preparing value)? preparing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoiceInputSheetStateCopyWith<$Res> {
  factory $VoiceInputSheetStateCopyWith(VoiceInputSheetState value,
          $Res Function(VoiceInputSheetState) then) =
      _$VoiceInputSheetStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$VoiceInputSheetStateCopyWithImpl<$Res>
    implements $VoiceInputSheetStateCopyWith<$Res> {
  _$VoiceInputSheetStateCopyWithImpl(this._value, this._then);

  final VoiceInputSheetState _value;
  // ignore: unused_field
  final $Res Function(VoiceInputSheetState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$VoiceInputSheetStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'VoiceInputSheetState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String errorText) error,
    required TResult Function(String currentInput) recording,
    required TResult Function() stopped,
    required TResult Function(double progress) preparing,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String errorText)? error,
    TResult Function(String currentInput)? recording,
    TResult Function()? stopped,
    TResult Function(double progress)? preparing,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String errorText)? error,
    TResult Function(String currentInput)? recording,
    TResult Function()? stopped,
    TResult Function(double progress)? preparing,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_Recording value) recording,
    required TResult Function(_Stopped value) stopped,
    required TResult Function(_Preparing value) preparing,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Recording value)? recording,
    TResult Function(_Stopped value)? stopped,
    TResult Function(_Preparing value)? preparing,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Recording value)? recording,
    TResult Function(_Stopped value)? stopped,
    TResult Function(_Preparing value)? preparing,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements VoiceInputSheetState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
  $Res call({String errorText});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    extends _$VoiceInputSheetStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;

  @override
  $Res call({
    Object? errorText = freezed,
  }) {
    return _then(_Error(
      errorText == freezed
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(this.errorText);

  @override
  final String errorText;

  @override
  String toString() {
    return 'VoiceInputSheetState.error(errorText: $errorText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            const DeepCollectionEquality().equals(other.errorText, errorText));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(errorText));

  @JsonKey(ignore: true)
  @override
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String errorText) error,
    required TResult Function(String currentInput) recording,
    required TResult Function() stopped,
    required TResult Function(double progress) preparing,
  }) {
    return error(errorText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String errorText)? error,
    TResult Function(String currentInput)? recording,
    TResult Function()? stopped,
    TResult Function(double progress)? preparing,
  }) {
    return error?.call(errorText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String errorText)? error,
    TResult Function(String currentInput)? recording,
    TResult Function()? stopped,
    TResult Function(double progress)? preparing,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(errorText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_Recording value) recording,
    required TResult Function(_Stopped value) stopped,
    required TResult Function(_Preparing value) preparing,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Recording value)? recording,
    TResult Function(_Stopped value)? stopped,
    TResult Function(_Preparing value)? preparing,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Recording value)? recording,
    TResult Function(_Stopped value)? stopped,
    TResult Function(_Preparing value)? preparing,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements VoiceInputSheetState {
  const factory _Error(final String errorText) = _$_Error;

  String get errorText => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$ErrorCopyWith<_Error> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$RecordingCopyWith<$Res> {
  factory _$RecordingCopyWith(
          _Recording value, $Res Function(_Recording) then) =
      __$RecordingCopyWithImpl<$Res>;
  $Res call({String currentInput});
}

/// @nodoc
class __$RecordingCopyWithImpl<$Res>
    extends _$VoiceInputSheetStateCopyWithImpl<$Res>
    implements _$RecordingCopyWith<$Res> {
  __$RecordingCopyWithImpl(_Recording _value, $Res Function(_Recording) _then)
      : super(_value, (v) => _then(v as _Recording));

  @override
  _Recording get _value => super._value as _Recording;

  @override
  $Res call({
    Object? currentInput = freezed,
  }) {
    return _then(_Recording(
      currentInput == freezed
          ? _value.currentInput
          : currentInput // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Recording implements _Recording {
  const _$_Recording(this.currentInput);

  @override
  final String currentInput;

  @override
  String toString() {
    return 'VoiceInputSheetState.recording(currentInput: $currentInput)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Recording &&
            const DeepCollectionEquality()
                .equals(other.currentInput, currentInput));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(currentInput));

  @JsonKey(ignore: true)
  @override
  _$RecordingCopyWith<_Recording> get copyWith =>
      __$RecordingCopyWithImpl<_Recording>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String errorText) error,
    required TResult Function(String currentInput) recording,
    required TResult Function() stopped,
    required TResult Function(double progress) preparing,
  }) {
    return recording(currentInput);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String errorText)? error,
    TResult Function(String currentInput)? recording,
    TResult Function()? stopped,
    TResult Function(double progress)? preparing,
  }) {
    return recording?.call(currentInput);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String errorText)? error,
    TResult Function(String currentInput)? recording,
    TResult Function()? stopped,
    TResult Function(double progress)? preparing,
    required TResult orElse(),
  }) {
    if (recording != null) {
      return recording(currentInput);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_Recording value) recording,
    required TResult Function(_Stopped value) stopped,
    required TResult Function(_Preparing value) preparing,
  }) {
    return recording(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Recording value)? recording,
    TResult Function(_Stopped value)? stopped,
    TResult Function(_Preparing value)? preparing,
  }) {
    return recording?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Recording value)? recording,
    TResult Function(_Stopped value)? stopped,
    TResult Function(_Preparing value)? preparing,
    required TResult orElse(),
  }) {
    if (recording != null) {
      return recording(this);
    }
    return orElse();
  }
}

abstract class _Recording implements VoiceInputSheetState {
  const factory _Recording(final String currentInput) = _$_Recording;

  String get currentInput => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$RecordingCopyWith<_Recording> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$StoppedCopyWith<$Res> {
  factory _$StoppedCopyWith(_Stopped value, $Res Function(_Stopped) then) =
      __$StoppedCopyWithImpl<$Res>;
}

/// @nodoc
class __$StoppedCopyWithImpl<$Res>
    extends _$VoiceInputSheetStateCopyWithImpl<$Res>
    implements _$StoppedCopyWith<$Res> {
  __$StoppedCopyWithImpl(_Stopped _value, $Res Function(_Stopped) _then)
      : super(_value, (v) => _then(v as _Stopped));

  @override
  _Stopped get _value => super._value as _Stopped;
}

/// @nodoc

class _$_Stopped implements _Stopped {
  const _$_Stopped();

  @override
  String toString() {
    return 'VoiceInputSheetState.stopped()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Stopped);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String errorText) error,
    required TResult Function(String currentInput) recording,
    required TResult Function() stopped,
    required TResult Function(double progress) preparing,
  }) {
    return stopped();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String errorText)? error,
    TResult Function(String currentInput)? recording,
    TResult Function()? stopped,
    TResult Function(double progress)? preparing,
  }) {
    return stopped?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String errorText)? error,
    TResult Function(String currentInput)? recording,
    TResult Function()? stopped,
    TResult Function(double progress)? preparing,
    required TResult orElse(),
  }) {
    if (stopped != null) {
      return stopped();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_Recording value) recording,
    required TResult Function(_Stopped value) stopped,
    required TResult Function(_Preparing value) preparing,
  }) {
    return stopped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Recording value)? recording,
    TResult Function(_Stopped value)? stopped,
    TResult Function(_Preparing value)? preparing,
  }) {
    return stopped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Recording value)? recording,
    TResult Function(_Stopped value)? stopped,
    TResult Function(_Preparing value)? preparing,
    required TResult orElse(),
  }) {
    if (stopped != null) {
      return stopped(this);
    }
    return orElse();
  }
}

abstract class _Stopped implements VoiceInputSheetState {
  const factory _Stopped() = _$_Stopped;
}

/// @nodoc
abstract class _$PreparingCopyWith<$Res> {
  factory _$PreparingCopyWith(
          _Preparing value, $Res Function(_Preparing) then) =
      __$PreparingCopyWithImpl<$Res>;
  $Res call({double progress});
}

/// @nodoc
class __$PreparingCopyWithImpl<$Res>
    extends _$VoiceInputSheetStateCopyWithImpl<$Res>
    implements _$PreparingCopyWith<$Res> {
  __$PreparingCopyWithImpl(_Preparing _value, $Res Function(_Preparing) _then)
      : super(_value, (v) => _then(v as _Preparing));

  @override
  _Preparing get _value => super._value as _Preparing;

  @override
  $Res call({
    Object? progress = freezed,
  }) {
    return _then(_Preparing(
      progress == freezed
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_Preparing implements _Preparing {
  const _$_Preparing(this.progress);

  @override
  final double progress;

  @override
  String toString() {
    return 'VoiceInputSheetState.preparing(progress: $progress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Preparing &&
            const DeepCollectionEquality().equals(other.progress, progress));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(progress));

  @JsonKey(ignore: true)
  @override
  _$PreparingCopyWith<_Preparing> get copyWith =>
      __$PreparingCopyWithImpl<_Preparing>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String errorText) error,
    required TResult Function(String currentInput) recording,
    required TResult Function() stopped,
    required TResult Function(double progress) preparing,
  }) {
    return preparing(progress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String errorText)? error,
    TResult Function(String currentInput)? recording,
    TResult Function()? stopped,
    TResult Function(double progress)? preparing,
  }) {
    return preparing?.call(progress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String errorText)? error,
    TResult Function(String currentInput)? recording,
    TResult Function()? stopped,
    TResult Function(double progress)? preparing,
    required TResult orElse(),
  }) {
    if (preparing != null) {
      return preparing(progress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_Recording value) recording,
    required TResult Function(_Stopped value) stopped,
    required TResult Function(_Preparing value) preparing,
  }) {
    return preparing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Recording value)? recording,
    TResult Function(_Stopped value)? stopped,
    TResult Function(_Preparing value)? preparing,
  }) {
    return preparing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Recording value)? recording,
    TResult Function(_Stopped value)? stopped,
    TResult Function(_Preparing value)? preparing,
    required TResult orElse(),
  }) {
    if (preparing != null) {
      return preparing(this);
    }
    return orElse();
  }
}

abstract class _Preparing implements VoiceInputSheetState {
  const factory _Preparing(final double progress) = _$_Preparing;

  double get progress => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$PreparingCopyWith<_Preparing> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'food_entries_watcher_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FoodEntriesWatcherEventTearOff {
  const _$FoodEntriesWatcherEventTearOff();

  _Started watchStarted() {
    return const _Started();
  }

  _EntriesReceived entriesReceived(
      Either<Failure, KtList<FoodItemEntry>> failureOrFoodEntries) {
    return _EntriesReceived(
      failureOrFoodEntries,
    );
  }
}

/// @nodoc
const $FoodEntriesWatcherEvent = _$FoodEntriesWatcherEventTearOff();

/// @nodoc
mixin _$FoodEntriesWatcherEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watchStarted,
    required TResult Function(
            Either<Failure, KtList<FoodItemEntry>> failureOrFoodEntries)
        entriesReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? watchStarted,
    TResult Function(
            Either<Failure, KtList<FoodItemEntry>> failureOrFoodEntries)?
        entriesReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchStarted,
    TResult Function(
            Either<Failure, KtList<FoodItemEntry>> failureOrFoodEntries)?
        entriesReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) watchStarted,
    required TResult Function(_EntriesReceived value) entriesReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? watchStarted,
    TResult Function(_EntriesReceived value)? entriesReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? watchStarted,
    TResult Function(_EntriesReceived value)? entriesReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodEntriesWatcherEventCopyWith<$Res> {
  factory $FoodEntriesWatcherEventCopyWith(FoodEntriesWatcherEvent value,
          $Res Function(FoodEntriesWatcherEvent) then) =
      _$FoodEntriesWatcherEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$FoodEntriesWatcherEventCopyWithImpl<$Res>
    implements $FoodEntriesWatcherEventCopyWith<$Res> {
  _$FoodEntriesWatcherEventCopyWithImpl(this._value, this._then);

  final FoodEntriesWatcherEvent _value;
  // ignore: unused_field
  final $Res Function(FoodEntriesWatcherEvent) _then;
}

/// @nodoc
abstract class _$StartedCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) then) =
      __$StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$StartedCopyWithImpl<$Res>
    extends _$FoodEntriesWatcherEventCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(_Started _value, $Res Function(_Started) _then)
      : super(_value, (v) => _then(v as _Started));

  @override
  _Started get _value => super._value as _Started;
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'FoodEntriesWatcherEvent.watchStarted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watchStarted,
    required TResult Function(
            Either<Failure, KtList<FoodItemEntry>> failureOrFoodEntries)
        entriesReceived,
  }) {
    return watchStarted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? watchStarted,
    TResult Function(
            Either<Failure, KtList<FoodItemEntry>> failureOrFoodEntries)?
        entriesReceived,
  }) {
    return watchStarted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchStarted,
    TResult Function(
            Either<Failure, KtList<FoodItemEntry>> failureOrFoodEntries)?
        entriesReceived,
    required TResult orElse(),
  }) {
    if (watchStarted != null) {
      return watchStarted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) watchStarted,
    required TResult Function(_EntriesReceived value) entriesReceived,
  }) {
    return watchStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? watchStarted,
    TResult Function(_EntriesReceived value)? entriesReceived,
  }) {
    return watchStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? watchStarted,
    TResult Function(_EntriesReceived value)? entriesReceived,
    required TResult orElse(),
  }) {
    if (watchStarted != null) {
      return watchStarted(this);
    }
    return orElse();
  }
}

abstract class _Started implements FoodEntriesWatcherEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$EntriesReceivedCopyWith<$Res> {
  factory _$EntriesReceivedCopyWith(
          _EntriesReceived value, $Res Function(_EntriesReceived) then) =
      __$EntriesReceivedCopyWithImpl<$Res>;
  $Res call({Either<Failure, KtList<FoodItemEntry>> failureOrFoodEntries});
}

/// @nodoc
class __$EntriesReceivedCopyWithImpl<$Res>
    extends _$FoodEntriesWatcherEventCopyWithImpl<$Res>
    implements _$EntriesReceivedCopyWith<$Res> {
  __$EntriesReceivedCopyWithImpl(
      _EntriesReceived _value, $Res Function(_EntriesReceived) _then)
      : super(_value, (v) => _then(v as _EntriesReceived));

  @override
  _EntriesReceived get _value => super._value as _EntriesReceived;

  @override
  $Res call({
    Object? failureOrFoodEntries = freezed,
  }) {
    return _then(_EntriesReceived(
      failureOrFoodEntries == freezed
          ? _value.failureOrFoodEntries
          : failureOrFoodEntries // ignore: cast_nullable_to_non_nullable
              as Either<Failure, KtList<FoodItemEntry>>,
    ));
  }
}

/// @nodoc

class _$_EntriesReceived implements _EntriesReceived {
  const _$_EntriesReceived(this.failureOrFoodEntries);

  @override
  final Either<Failure, KtList<FoodItemEntry>> failureOrFoodEntries;

  @override
  String toString() {
    return 'FoodEntriesWatcherEvent.entriesReceived(failureOrFoodEntries: $failureOrFoodEntries)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EntriesReceived &&
            const DeepCollectionEquality()
                .equals(other.failureOrFoodEntries, failureOrFoodEntries));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failureOrFoodEntries));

  @JsonKey(ignore: true)
  @override
  _$EntriesReceivedCopyWith<_EntriesReceived> get copyWith =>
      __$EntriesReceivedCopyWithImpl<_EntriesReceived>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watchStarted,
    required TResult Function(
            Either<Failure, KtList<FoodItemEntry>> failureOrFoodEntries)
        entriesReceived,
  }) {
    return entriesReceived(failureOrFoodEntries);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? watchStarted,
    TResult Function(
            Either<Failure, KtList<FoodItemEntry>> failureOrFoodEntries)?
        entriesReceived,
  }) {
    return entriesReceived?.call(failureOrFoodEntries);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchStarted,
    TResult Function(
            Either<Failure, KtList<FoodItemEntry>> failureOrFoodEntries)?
        entriesReceived,
    required TResult orElse(),
  }) {
    if (entriesReceived != null) {
      return entriesReceived(failureOrFoodEntries);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) watchStarted,
    required TResult Function(_EntriesReceived value) entriesReceived,
  }) {
    return entriesReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? watchStarted,
    TResult Function(_EntriesReceived value)? entriesReceived,
  }) {
    return entriesReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? watchStarted,
    TResult Function(_EntriesReceived value)? entriesReceived,
    required TResult orElse(),
  }) {
    if (entriesReceived != null) {
      return entriesReceived(this);
    }
    return orElse();
  }
}

abstract class _EntriesReceived implements FoodEntriesWatcherEvent {
  const factory _EntriesReceived(
          Either<Failure, KtList<FoodItemEntry>> failureOrFoodEntries) =
      _$_EntriesReceived;

  Either<Failure, KtList<FoodItemEntry>> get failureOrFoodEntries;
  @JsonKey(ignore: true)
  _$EntriesReceivedCopyWith<_EntriesReceived> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$FoodEntriesWatcherStateTearOff {
  const _$FoodEntriesWatcherStateTearOff();

  FoodEntriesWatcherStateInitial initial() {
    return const FoodEntriesWatcherStateInitial();
  }

  FoodEntriesWatcherStateLoadInProgress loadInProgress() {
    return const FoodEntriesWatcherStateLoadInProgress();
  }

  FoodEntriesWatcherStateLoadSuccess loadSuccess(
      KtList<FoodItemEntry> foodItemEntries) {
    return FoodEntriesWatcherStateLoadSuccess(
      foodItemEntries,
    );
  }

  FoodEntriesWatcherStateLoadFailure loadFailure(Failure noteFailure) {
    return FoodEntriesWatcherStateLoadFailure(
      noteFailure,
    );
  }
}

/// @nodoc
const $FoodEntriesWatcherState = _$FoodEntriesWatcherStateTearOff();

/// @nodoc
mixin _$FoodEntriesWatcherState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(KtList<FoodItemEntry> foodItemEntries)
        loadSuccess,
    required TResult Function(Failure noteFailure) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(KtList<FoodItemEntry> foodItemEntries)? loadSuccess,
    TResult Function(Failure noteFailure)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(KtList<FoodItemEntry> foodItemEntries)? loadSuccess,
    TResult Function(Failure noteFailure)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FoodEntriesWatcherStateInitial value) initial,
    required TResult Function(FoodEntriesWatcherStateLoadInProgress value)
        loadInProgress,
    required TResult Function(FoodEntriesWatcherStateLoadSuccess value)
        loadSuccess,
    required TResult Function(FoodEntriesWatcherStateLoadFailure value)
        loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FoodEntriesWatcherStateInitial value)? initial,
    TResult Function(FoodEntriesWatcherStateLoadInProgress value)?
        loadInProgress,
    TResult Function(FoodEntriesWatcherStateLoadSuccess value)? loadSuccess,
    TResult Function(FoodEntriesWatcherStateLoadFailure value)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FoodEntriesWatcherStateInitial value)? initial,
    TResult Function(FoodEntriesWatcherStateLoadInProgress value)?
        loadInProgress,
    TResult Function(FoodEntriesWatcherStateLoadSuccess value)? loadSuccess,
    TResult Function(FoodEntriesWatcherStateLoadFailure value)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodEntriesWatcherStateCopyWith<$Res> {
  factory $FoodEntriesWatcherStateCopyWith(FoodEntriesWatcherState value,
          $Res Function(FoodEntriesWatcherState) then) =
      _$FoodEntriesWatcherStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$FoodEntriesWatcherStateCopyWithImpl<$Res>
    implements $FoodEntriesWatcherStateCopyWith<$Res> {
  _$FoodEntriesWatcherStateCopyWithImpl(this._value, this._then);

  final FoodEntriesWatcherState _value;
  // ignore: unused_field
  final $Res Function(FoodEntriesWatcherState) _then;
}

/// @nodoc
abstract class $FoodEntriesWatcherStateInitialCopyWith<$Res> {
  factory $FoodEntriesWatcherStateInitialCopyWith(
          FoodEntriesWatcherStateInitial value,
          $Res Function(FoodEntriesWatcherStateInitial) then) =
      _$FoodEntriesWatcherStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$FoodEntriesWatcherStateInitialCopyWithImpl<$Res>
    extends _$FoodEntriesWatcherStateCopyWithImpl<$Res>
    implements $FoodEntriesWatcherStateInitialCopyWith<$Res> {
  _$FoodEntriesWatcherStateInitialCopyWithImpl(
      FoodEntriesWatcherStateInitial _value,
      $Res Function(FoodEntriesWatcherStateInitial) _then)
      : super(_value, (v) => _then(v as FoodEntriesWatcherStateInitial));

  @override
  FoodEntriesWatcherStateInitial get _value =>
      super._value as FoodEntriesWatcherStateInitial;
}

/// @nodoc

class _$FoodEntriesWatcherStateInitial
    implements FoodEntriesWatcherStateInitial {
  const _$FoodEntriesWatcherStateInitial();

  @override
  String toString() {
    return 'FoodEntriesWatcherState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FoodEntriesWatcherStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(KtList<FoodItemEntry> foodItemEntries)
        loadSuccess,
    required TResult Function(Failure noteFailure) loadFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(KtList<FoodItemEntry> foodItemEntries)? loadSuccess,
    TResult Function(Failure noteFailure)? loadFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(KtList<FoodItemEntry> foodItemEntries)? loadSuccess,
    TResult Function(Failure noteFailure)? loadFailure,
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
    required TResult Function(FoodEntriesWatcherStateInitial value) initial,
    required TResult Function(FoodEntriesWatcherStateLoadInProgress value)
        loadInProgress,
    required TResult Function(FoodEntriesWatcherStateLoadSuccess value)
        loadSuccess,
    required TResult Function(FoodEntriesWatcherStateLoadFailure value)
        loadFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FoodEntriesWatcherStateInitial value)? initial,
    TResult Function(FoodEntriesWatcherStateLoadInProgress value)?
        loadInProgress,
    TResult Function(FoodEntriesWatcherStateLoadSuccess value)? loadSuccess,
    TResult Function(FoodEntriesWatcherStateLoadFailure value)? loadFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FoodEntriesWatcherStateInitial value)? initial,
    TResult Function(FoodEntriesWatcherStateLoadInProgress value)?
        loadInProgress,
    TResult Function(FoodEntriesWatcherStateLoadSuccess value)? loadSuccess,
    TResult Function(FoodEntriesWatcherStateLoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class FoodEntriesWatcherStateInitial
    implements FoodEntriesWatcherState {
  const factory FoodEntriesWatcherStateInitial() =
      _$FoodEntriesWatcherStateInitial;
}

/// @nodoc
abstract class $FoodEntriesWatcherStateLoadInProgressCopyWith<$Res> {
  factory $FoodEntriesWatcherStateLoadInProgressCopyWith(
          FoodEntriesWatcherStateLoadInProgress value,
          $Res Function(FoodEntriesWatcherStateLoadInProgress) then) =
      _$FoodEntriesWatcherStateLoadInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class _$FoodEntriesWatcherStateLoadInProgressCopyWithImpl<$Res>
    extends _$FoodEntriesWatcherStateCopyWithImpl<$Res>
    implements $FoodEntriesWatcherStateLoadInProgressCopyWith<$Res> {
  _$FoodEntriesWatcherStateLoadInProgressCopyWithImpl(
      FoodEntriesWatcherStateLoadInProgress _value,
      $Res Function(FoodEntriesWatcherStateLoadInProgress) _then)
      : super(_value, (v) => _then(v as FoodEntriesWatcherStateLoadInProgress));

  @override
  FoodEntriesWatcherStateLoadInProgress get _value =>
      super._value as FoodEntriesWatcherStateLoadInProgress;
}

/// @nodoc

class _$FoodEntriesWatcherStateLoadInProgress
    implements FoodEntriesWatcherStateLoadInProgress {
  const _$FoodEntriesWatcherStateLoadInProgress();

  @override
  String toString() {
    return 'FoodEntriesWatcherState.loadInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FoodEntriesWatcherStateLoadInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(KtList<FoodItemEntry> foodItemEntries)
        loadSuccess,
    required TResult Function(Failure noteFailure) loadFailure,
  }) {
    return loadInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(KtList<FoodItemEntry> foodItemEntries)? loadSuccess,
    TResult Function(Failure noteFailure)? loadFailure,
  }) {
    return loadInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(KtList<FoodItemEntry> foodItemEntries)? loadSuccess,
    TResult Function(Failure noteFailure)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FoodEntriesWatcherStateInitial value) initial,
    required TResult Function(FoodEntriesWatcherStateLoadInProgress value)
        loadInProgress,
    required TResult Function(FoodEntriesWatcherStateLoadSuccess value)
        loadSuccess,
    required TResult Function(FoodEntriesWatcherStateLoadFailure value)
        loadFailure,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FoodEntriesWatcherStateInitial value)? initial,
    TResult Function(FoodEntriesWatcherStateLoadInProgress value)?
        loadInProgress,
    TResult Function(FoodEntriesWatcherStateLoadSuccess value)? loadSuccess,
    TResult Function(FoodEntriesWatcherStateLoadFailure value)? loadFailure,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FoodEntriesWatcherStateInitial value)? initial,
    TResult Function(FoodEntriesWatcherStateLoadInProgress value)?
        loadInProgress,
    TResult Function(FoodEntriesWatcherStateLoadSuccess value)? loadSuccess,
    TResult Function(FoodEntriesWatcherStateLoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class FoodEntriesWatcherStateLoadInProgress
    implements FoodEntriesWatcherState {
  const factory FoodEntriesWatcherStateLoadInProgress() =
      _$FoodEntriesWatcherStateLoadInProgress;
}

/// @nodoc
abstract class $FoodEntriesWatcherStateLoadSuccessCopyWith<$Res> {
  factory $FoodEntriesWatcherStateLoadSuccessCopyWith(
          FoodEntriesWatcherStateLoadSuccess value,
          $Res Function(FoodEntriesWatcherStateLoadSuccess) then) =
      _$FoodEntriesWatcherStateLoadSuccessCopyWithImpl<$Res>;
  $Res call({KtList<FoodItemEntry> foodItemEntries});
}

/// @nodoc
class _$FoodEntriesWatcherStateLoadSuccessCopyWithImpl<$Res>
    extends _$FoodEntriesWatcherStateCopyWithImpl<$Res>
    implements $FoodEntriesWatcherStateLoadSuccessCopyWith<$Res> {
  _$FoodEntriesWatcherStateLoadSuccessCopyWithImpl(
      FoodEntriesWatcherStateLoadSuccess _value,
      $Res Function(FoodEntriesWatcherStateLoadSuccess) _then)
      : super(_value, (v) => _then(v as FoodEntriesWatcherStateLoadSuccess));

  @override
  FoodEntriesWatcherStateLoadSuccess get _value =>
      super._value as FoodEntriesWatcherStateLoadSuccess;

  @override
  $Res call({
    Object? foodItemEntries = freezed,
  }) {
    return _then(FoodEntriesWatcherStateLoadSuccess(
      foodItemEntries == freezed
          ? _value.foodItemEntries
          : foodItemEntries // ignore: cast_nullable_to_non_nullable
              as KtList<FoodItemEntry>,
    ));
  }
}

/// @nodoc

class _$FoodEntriesWatcherStateLoadSuccess
    implements FoodEntriesWatcherStateLoadSuccess {
  const _$FoodEntriesWatcherStateLoadSuccess(this.foodItemEntries);

  @override
  final KtList<FoodItemEntry> foodItemEntries;

  @override
  String toString() {
    return 'FoodEntriesWatcherState.loadSuccess(foodItemEntries: $foodItemEntries)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FoodEntriesWatcherStateLoadSuccess &&
            const DeepCollectionEquality()
                .equals(other.foodItemEntries, foodItemEntries));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(foodItemEntries));

  @JsonKey(ignore: true)
  @override
  $FoodEntriesWatcherStateLoadSuccessCopyWith<
          FoodEntriesWatcherStateLoadSuccess>
      get copyWith => _$FoodEntriesWatcherStateLoadSuccessCopyWithImpl<
          FoodEntriesWatcherStateLoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(KtList<FoodItemEntry> foodItemEntries)
        loadSuccess,
    required TResult Function(Failure noteFailure) loadFailure,
  }) {
    return loadSuccess(foodItemEntries);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(KtList<FoodItemEntry> foodItemEntries)? loadSuccess,
    TResult Function(Failure noteFailure)? loadFailure,
  }) {
    return loadSuccess?.call(foodItemEntries);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(KtList<FoodItemEntry> foodItemEntries)? loadSuccess,
    TResult Function(Failure noteFailure)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(foodItemEntries);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FoodEntriesWatcherStateInitial value) initial,
    required TResult Function(FoodEntriesWatcherStateLoadInProgress value)
        loadInProgress,
    required TResult Function(FoodEntriesWatcherStateLoadSuccess value)
        loadSuccess,
    required TResult Function(FoodEntriesWatcherStateLoadFailure value)
        loadFailure,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FoodEntriesWatcherStateInitial value)? initial,
    TResult Function(FoodEntriesWatcherStateLoadInProgress value)?
        loadInProgress,
    TResult Function(FoodEntriesWatcherStateLoadSuccess value)? loadSuccess,
    TResult Function(FoodEntriesWatcherStateLoadFailure value)? loadFailure,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FoodEntriesWatcherStateInitial value)? initial,
    TResult Function(FoodEntriesWatcherStateLoadInProgress value)?
        loadInProgress,
    TResult Function(FoodEntriesWatcherStateLoadSuccess value)? loadSuccess,
    TResult Function(FoodEntriesWatcherStateLoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class FoodEntriesWatcherStateLoadSuccess
    implements FoodEntriesWatcherState {
  const factory FoodEntriesWatcherStateLoadSuccess(
          KtList<FoodItemEntry> foodItemEntries) =
      _$FoodEntriesWatcherStateLoadSuccess;

  KtList<FoodItemEntry> get foodItemEntries;
  @JsonKey(ignore: true)
  $FoodEntriesWatcherStateLoadSuccessCopyWith<
          FoodEntriesWatcherStateLoadSuccess>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodEntriesWatcherStateLoadFailureCopyWith<$Res> {
  factory $FoodEntriesWatcherStateLoadFailureCopyWith(
          FoodEntriesWatcherStateLoadFailure value,
          $Res Function(FoodEntriesWatcherStateLoadFailure) then) =
      _$FoodEntriesWatcherStateLoadFailureCopyWithImpl<$Res>;
  $Res call({Failure noteFailure});
}

/// @nodoc
class _$FoodEntriesWatcherStateLoadFailureCopyWithImpl<$Res>
    extends _$FoodEntriesWatcherStateCopyWithImpl<$Res>
    implements $FoodEntriesWatcherStateLoadFailureCopyWith<$Res> {
  _$FoodEntriesWatcherStateLoadFailureCopyWithImpl(
      FoodEntriesWatcherStateLoadFailure _value,
      $Res Function(FoodEntriesWatcherStateLoadFailure) _then)
      : super(_value, (v) => _then(v as FoodEntriesWatcherStateLoadFailure));

  @override
  FoodEntriesWatcherStateLoadFailure get _value =>
      super._value as FoodEntriesWatcherStateLoadFailure;

  @override
  $Res call({
    Object? noteFailure = freezed,
  }) {
    return _then(FoodEntriesWatcherStateLoadFailure(
      noteFailure == freezed
          ? _value.noteFailure
          : noteFailure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$FoodEntriesWatcherStateLoadFailure
    implements FoodEntriesWatcherStateLoadFailure {
  const _$FoodEntriesWatcherStateLoadFailure(this.noteFailure);

  @override
  final Failure noteFailure;

  @override
  String toString() {
    return 'FoodEntriesWatcherState.loadFailure(noteFailure: $noteFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FoodEntriesWatcherStateLoadFailure &&
            const DeepCollectionEquality()
                .equals(other.noteFailure, noteFailure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(noteFailure));

  @JsonKey(ignore: true)
  @override
  $FoodEntriesWatcherStateLoadFailureCopyWith<
          FoodEntriesWatcherStateLoadFailure>
      get copyWith => _$FoodEntriesWatcherStateLoadFailureCopyWithImpl<
          FoodEntriesWatcherStateLoadFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(KtList<FoodItemEntry> foodItemEntries)
        loadSuccess,
    required TResult Function(Failure noteFailure) loadFailure,
  }) {
    return loadFailure(noteFailure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(KtList<FoodItemEntry> foodItemEntries)? loadSuccess,
    TResult Function(Failure noteFailure)? loadFailure,
  }) {
    return loadFailure?.call(noteFailure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(KtList<FoodItemEntry> foodItemEntries)? loadSuccess,
    TResult Function(Failure noteFailure)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(noteFailure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FoodEntriesWatcherStateInitial value) initial,
    required TResult Function(FoodEntriesWatcherStateLoadInProgress value)
        loadInProgress,
    required TResult Function(FoodEntriesWatcherStateLoadSuccess value)
        loadSuccess,
    required TResult Function(FoodEntriesWatcherStateLoadFailure value)
        loadFailure,
  }) {
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FoodEntriesWatcherStateInitial value)? initial,
    TResult Function(FoodEntriesWatcherStateLoadInProgress value)?
        loadInProgress,
    TResult Function(FoodEntriesWatcherStateLoadSuccess value)? loadSuccess,
    TResult Function(FoodEntriesWatcherStateLoadFailure value)? loadFailure,
  }) {
    return loadFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FoodEntriesWatcherStateInitial value)? initial,
    TResult Function(FoodEntriesWatcherStateLoadInProgress value)?
        loadInProgress,
    TResult Function(FoodEntriesWatcherStateLoadSuccess value)? loadSuccess,
    TResult Function(FoodEntriesWatcherStateLoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class FoodEntriesWatcherStateLoadFailure
    implements FoodEntriesWatcherState {
  const factory FoodEntriesWatcherStateLoadFailure(Failure noteFailure) =
      _$FoodEntriesWatcherStateLoadFailure;

  Failure get noteFailure;
  @JsonKey(ignore: true)
  $FoodEntriesWatcherStateLoadFailureCopyWith<
          FoodEntriesWatcherStateLoadFailure>
      get copyWith => throw _privateConstructorUsedError;
}

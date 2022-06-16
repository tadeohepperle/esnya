// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'dashboard_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DashboardEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            Either<Failure, KtList<DayBucket>> failureOrBuckets)
        bucketsReceived,
    required TResult Function(BlocAndBetweenRepoFoodItemEntries entries)
        foodInputEntriesReceived,
    required TResult Function() extendBucketWatchRange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Either<Failure, KtList<DayBucket>> failureOrBuckets)?
        bucketsReceived,
    TResult Function(BlocAndBetweenRepoFoodItemEntries entries)?
        foodInputEntriesReceived,
    TResult Function()? extendBucketWatchRange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Either<Failure, KtList<DayBucket>> failureOrBuckets)?
        bucketsReceived,
    TResult Function(BlocAndBetweenRepoFoodItemEntries entries)?
        foodInputEntriesReceived,
    TResult Function()? extendBucketWatchRange,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_BucketsReceived value) bucketsReceived,
    required TResult Function(_FoodInputEntriesReceived value)
        foodInputEntriesReceived,
    required TResult Function(_ExtendBucketWatchRange value)
        extendBucketWatchRange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_BucketsReceived value)? bucketsReceived,
    TResult Function(_FoodInputEntriesReceived value)? foodInputEntriesReceived,
    TResult Function(_ExtendBucketWatchRange value)? extendBucketWatchRange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_BucketsReceived value)? bucketsReceived,
    TResult Function(_FoodInputEntriesReceived value)? foodInputEntriesReceived,
    TResult Function(_ExtendBucketWatchRange value)? extendBucketWatchRange,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardEventCopyWith<$Res> {
  factory $DashboardEventCopyWith(
          DashboardEvent value, $Res Function(DashboardEvent) then) =
      _$DashboardEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$DashboardEventCopyWithImpl<$Res>
    implements $DashboardEventCopyWith<$Res> {
  _$DashboardEventCopyWithImpl(this._value, this._then);

  final DashboardEvent _value;
  // ignore: unused_field
  final $Res Function(DashboardEvent) _then;
}

/// @nodoc
abstract class _$StartedCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) then) =
      __$StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$StartedCopyWithImpl<$Res> extends _$DashboardEventCopyWithImpl<$Res>
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
    return 'DashboardEvent.started()';
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
    required TResult Function() started,
    required TResult Function(
            Either<Failure, KtList<DayBucket>> failureOrBuckets)
        bucketsReceived,
    required TResult Function(BlocAndBetweenRepoFoodItemEntries entries)
        foodInputEntriesReceived,
    required TResult Function() extendBucketWatchRange,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Either<Failure, KtList<DayBucket>> failureOrBuckets)?
        bucketsReceived,
    TResult Function(BlocAndBetweenRepoFoodItemEntries entries)?
        foodInputEntriesReceived,
    TResult Function()? extendBucketWatchRange,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Either<Failure, KtList<DayBucket>> failureOrBuckets)?
        bucketsReceived,
    TResult Function(BlocAndBetweenRepoFoodItemEntries entries)?
        foodInputEntriesReceived,
    TResult Function()? extendBucketWatchRange,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_BucketsReceived value) bucketsReceived,
    required TResult Function(_FoodInputEntriesReceived value)
        foodInputEntriesReceived,
    required TResult Function(_ExtendBucketWatchRange value)
        extendBucketWatchRange,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_BucketsReceived value)? bucketsReceived,
    TResult Function(_FoodInputEntriesReceived value)? foodInputEntriesReceived,
    TResult Function(_ExtendBucketWatchRange value)? extendBucketWatchRange,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_BucketsReceived value)? bucketsReceived,
    TResult Function(_FoodInputEntriesReceived value)? foodInputEntriesReceived,
    TResult Function(_ExtendBucketWatchRange value)? extendBucketWatchRange,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements DashboardEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$BucketsReceivedCopyWith<$Res> {
  factory _$BucketsReceivedCopyWith(
          _BucketsReceived value, $Res Function(_BucketsReceived) then) =
      __$BucketsReceivedCopyWithImpl<$Res>;
  $Res call({Either<Failure, KtList<DayBucket>> failureOrBuckets});
}

/// @nodoc
class __$BucketsReceivedCopyWithImpl<$Res>
    extends _$DashboardEventCopyWithImpl<$Res>
    implements _$BucketsReceivedCopyWith<$Res> {
  __$BucketsReceivedCopyWithImpl(
      _BucketsReceived _value, $Res Function(_BucketsReceived) _then)
      : super(_value, (v) => _then(v as _BucketsReceived));

  @override
  _BucketsReceived get _value => super._value as _BucketsReceived;

  @override
  $Res call({
    Object? failureOrBuckets = freezed,
  }) {
    return _then(_BucketsReceived(
      failureOrBuckets == freezed
          ? _value.failureOrBuckets
          : failureOrBuckets // ignore: cast_nullable_to_non_nullable
              as Either<Failure, KtList<DayBucket>>,
    ));
  }
}

/// @nodoc

class _$_BucketsReceived implements _BucketsReceived {
  const _$_BucketsReceived(this.failureOrBuckets);

  @override
  final Either<Failure, KtList<DayBucket>> failureOrBuckets;

  @override
  String toString() {
    return 'DashboardEvent.bucketsReceived(failureOrBuckets: $failureOrBuckets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BucketsReceived &&
            const DeepCollectionEquality()
                .equals(other.failureOrBuckets, failureOrBuckets));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failureOrBuckets));

  @JsonKey(ignore: true)
  @override
  _$BucketsReceivedCopyWith<_BucketsReceived> get copyWith =>
      __$BucketsReceivedCopyWithImpl<_BucketsReceived>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            Either<Failure, KtList<DayBucket>> failureOrBuckets)
        bucketsReceived,
    required TResult Function(BlocAndBetweenRepoFoodItemEntries entries)
        foodInputEntriesReceived,
    required TResult Function() extendBucketWatchRange,
  }) {
    return bucketsReceived(failureOrBuckets);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Either<Failure, KtList<DayBucket>> failureOrBuckets)?
        bucketsReceived,
    TResult Function(BlocAndBetweenRepoFoodItemEntries entries)?
        foodInputEntriesReceived,
    TResult Function()? extendBucketWatchRange,
  }) {
    return bucketsReceived?.call(failureOrBuckets);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Either<Failure, KtList<DayBucket>> failureOrBuckets)?
        bucketsReceived,
    TResult Function(BlocAndBetweenRepoFoodItemEntries entries)?
        foodInputEntriesReceived,
    TResult Function()? extendBucketWatchRange,
    required TResult orElse(),
  }) {
    if (bucketsReceived != null) {
      return bucketsReceived(failureOrBuckets);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_BucketsReceived value) bucketsReceived,
    required TResult Function(_FoodInputEntriesReceived value)
        foodInputEntriesReceived,
    required TResult Function(_ExtendBucketWatchRange value)
        extendBucketWatchRange,
  }) {
    return bucketsReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_BucketsReceived value)? bucketsReceived,
    TResult Function(_FoodInputEntriesReceived value)? foodInputEntriesReceived,
    TResult Function(_ExtendBucketWatchRange value)? extendBucketWatchRange,
  }) {
    return bucketsReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_BucketsReceived value)? bucketsReceived,
    TResult Function(_FoodInputEntriesReceived value)? foodInputEntriesReceived,
    TResult Function(_ExtendBucketWatchRange value)? extendBucketWatchRange,
    required TResult orElse(),
  }) {
    if (bucketsReceived != null) {
      return bucketsReceived(this);
    }
    return orElse();
  }
}

abstract class _BucketsReceived implements DashboardEvent {
  const factory _BucketsReceived(
          final Either<Failure, KtList<DayBucket>> failureOrBuckets) =
      _$_BucketsReceived;

  Either<Failure, KtList<DayBucket>> get failureOrBuckets =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$BucketsReceivedCopyWith<_BucketsReceived> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$FoodInputEntriesReceivedCopyWith<$Res> {
  factory _$FoodInputEntriesReceivedCopyWith(_FoodInputEntriesReceived value,
          $Res Function(_FoodInputEntriesReceived) then) =
      __$FoodInputEntriesReceivedCopyWithImpl<$Res>;
  $Res call({BlocAndBetweenRepoFoodItemEntries entries});
}

/// @nodoc
class __$FoodInputEntriesReceivedCopyWithImpl<$Res>
    extends _$DashboardEventCopyWithImpl<$Res>
    implements _$FoodInputEntriesReceivedCopyWith<$Res> {
  __$FoodInputEntriesReceivedCopyWithImpl(_FoodInputEntriesReceived _value,
      $Res Function(_FoodInputEntriesReceived) _then)
      : super(_value, (v) => _then(v as _FoodInputEntriesReceived));

  @override
  _FoodInputEntriesReceived get _value =>
      super._value as _FoodInputEntriesReceived;

  @override
  $Res call({
    Object? entries = freezed,
  }) {
    return _then(_FoodInputEntriesReceived(
      entries == freezed
          ? _value.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as BlocAndBetweenRepoFoodItemEntries,
    ));
  }
}

/// @nodoc

class _$_FoodInputEntriesReceived implements _FoodInputEntriesReceived {
  const _$_FoodInputEntriesReceived(this.entries);

  @override
  final BlocAndBetweenRepoFoodItemEntries entries;

  @override
  String toString() {
    return 'DashboardEvent.foodInputEntriesReceived(entries: $entries)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FoodInputEntriesReceived &&
            const DeepCollectionEquality().equals(other.entries, entries));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(entries));

  @JsonKey(ignore: true)
  @override
  _$FoodInputEntriesReceivedCopyWith<_FoodInputEntriesReceived> get copyWith =>
      __$FoodInputEntriesReceivedCopyWithImpl<_FoodInputEntriesReceived>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            Either<Failure, KtList<DayBucket>> failureOrBuckets)
        bucketsReceived,
    required TResult Function(BlocAndBetweenRepoFoodItemEntries entries)
        foodInputEntriesReceived,
    required TResult Function() extendBucketWatchRange,
  }) {
    return foodInputEntriesReceived(entries);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Either<Failure, KtList<DayBucket>> failureOrBuckets)?
        bucketsReceived,
    TResult Function(BlocAndBetweenRepoFoodItemEntries entries)?
        foodInputEntriesReceived,
    TResult Function()? extendBucketWatchRange,
  }) {
    return foodInputEntriesReceived?.call(entries);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Either<Failure, KtList<DayBucket>> failureOrBuckets)?
        bucketsReceived,
    TResult Function(BlocAndBetweenRepoFoodItemEntries entries)?
        foodInputEntriesReceived,
    TResult Function()? extendBucketWatchRange,
    required TResult orElse(),
  }) {
    if (foodInputEntriesReceived != null) {
      return foodInputEntriesReceived(entries);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_BucketsReceived value) bucketsReceived,
    required TResult Function(_FoodInputEntriesReceived value)
        foodInputEntriesReceived,
    required TResult Function(_ExtendBucketWatchRange value)
        extendBucketWatchRange,
  }) {
    return foodInputEntriesReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_BucketsReceived value)? bucketsReceived,
    TResult Function(_FoodInputEntriesReceived value)? foodInputEntriesReceived,
    TResult Function(_ExtendBucketWatchRange value)? extendBucketWatchRange,
  }) {
    return foodInputEntriesReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_BucketsReceived value)? bucketsReceived,
    TResult Function(_FoodInputEntriesReceived value)? foodInputEntriesReceived,
    TResult Function(_ExtendBucketWatchRange value)? extendBucketWatchRange,
    required TResult orElse(),
  }) {
    if (foodInputEntriesReceived != null) {
      return foodInputEntriesReceived(this);
    }
    return orElse();
  }
}

abstract class _FoodInputEntriesReceived implements DashboardEvent {
  const factory _FoodInputEntriesReceived(
          final BlocAndBetweenRepoFoodItemEntries entries) =
      _$_FoodInputEntriesReceived;

  BlocAndBetweenRepoFoodItemEntries get entries =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$FoodInputEntriesReceivedCopyWith<_FoodInputEntriesReceived> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ExtendBucketWatchRangeCopyWith<$Res> {
  factory _$ExtendBucketWatchRangeCopyWith(_ExtendBucketWatchRange value,
          $Res Function(_ExtendBucketWatchRange) then) =
      __$ExtendBucketWatchRangeCopyWithImpl<$Res>;
}

/// @nodoc
class __$ExtendBucketWatchRangeCopyWithImpl<$Res>
    extends _$DashboardEventCopyWithImpl<$Res>
    implements _$ExtendBucketWatchRangeCopyWith<$Res> {
  __$ExtendBucketWatchRangeCopyWithImpl(_ExtendBucketWatchRange _value,
      $Res Function(_ExtendBucketWatchRange) _then)
      : super(_value, (v) => _then(v as _ExtendBucketWatchRange));

  @override
  _ExtendBucketWatchRange get _value => super._value as _ExtendBucketWatchRange;
}

/// @nodoc

class _$_ExtendBucketWatchRange implements _ExtendBucketWatchRange {
  const _$_ExtendBucketWatchRange();

  @override
  String toString() {
    return 'DashboardEvent.extendBucketWatchRange()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ExtendBucketWatchRange);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            Either<Failure, KtList<DayBucket>> failureOrBuckets)
        bucketsReceived,
    required TResult Function(BlocAndBetweenRepoFoodItemEntries entries)
        foodInputEntriesReceived,
    required TResult Function() extendBucketWatchRange,
  }) {
    return extendBucketWatchRange();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Either<Failure, KtList<DayBucket>> failureOrBuckets)?
        bucketsReceived,
    TResult Function(BlocAndBetweenRepoFoodItemEntries entries)?
        foodInputEntriesReceived,
    TResult Function()? extendBucketWatchRange,
  }) {
    return extendBucketWatchRange?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Either<Failure, KtList<DayBucket>> failureOrBuckets)?
        bucketsReceived,
    TResult Function(BlocAndBetweenRepoFoodItemEntries entries)?
        foodInputEntriesReceived,
    TResult Function()? extendBucketWatchRange,
    required TResult orElse(),
  }) {
    if (extendBucketWatchRange != null) {
      return extendBucketWatchRange();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_BucketsReceived value) bucketsReceived,
    required TResult Function(_FoodInputEntriesReceived value)
        foodInputEntriesReceived,
    required TResult Function(_ExtendBucketWatchRange value)
        extendBucketWatchRange,
  }) {
    return extendBucketWatchRange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_BucketsReceived value)? bucketsReceived,
    TResult Function(_FoodInputEntriesReceived value)? foodInputEntriesReceived,
    TResult Function(_ExtendBucketWatchRange value)? extendBucketWatchRange,
  }) {
    return extendBucketWatchRange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_BucketsReceived value)? bucketsReceived,
    TResult Function(_FoodInputEntriesReceived value)? foodInputEntriesReceived,
    TResult Function(_ExtendBucketWatchRange value)? extendBucketWatchRange,
    required TResult orElse(),
  }) {
    if (extendBucketWatchRange != null) {
      return extendBucketWatchRange(this);
    }
    return orElse();
  }
}

abstract class _ExtendBucketWatchRange implements DashboardEvent {
  const factory _ExtendBucketWatchRange() = _$_ExtendBucketWatchRange;
}

/// @nodoc
mixin _$DashboardState {
  DashboardBucketsState get dashboardBucketsState =>
      throw _privateConstructorUsedError;
  KtList<DayBucket> get buckets => throw _privateConstructorUsedError;
  KtList<FoodItemEntry> get entriesBetweenBlocAndRepo =>
      throw _privateConstructorUsedError;
  KtList<FoodItemEntryWrapper> get entriesFoodInputBloc =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DashboardStateCopyWith<DashboardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStateCopyWith<$Res> {
  factory $DashboardStateCopyWith(
          DashboardState value, $Res Function(DashboardState) then) =
      _$DashboardStateCopyWithImpl<$Res>;
  $Res call(
      {DashboardBucketsState dashboardBucketsState,
      KtList<DayBucket> buckets,
      KtList<FoodItemEntry> entriesBetweenBlocAndRepo,
      KtList<FoodItemEntryWrapper> entriesFoodInputBloc});
}

/// @nodoc
class _$DashboardStateCopyWithImpl<$Res>
    implements $DashboardStateCopyWith<$Res> {
  _$DashboardStateCopyWithImpl(this._value, this._then);

  final DashboardState _value;
  // ignore: unused_field
  final $Res Function(DashboardState) _then;

  @override
  $Res call({
    Object? dashboardBucketsState = freezed,
    Object? buckets = freezed,
    Object? entriesBetweenBlocAndRepo = freezed,
    Object? entriesFoodInputBloc = freezed,
  }) {
    return _then(_value.copyWith(
      dashboardBucketsState: dashboardBucketsState == freezed
          ? _value.dashboardBucketsState
          : dashboardBucketsState // ignore: cast_nullable_to_non_nullable
              as DashboardBucketsState,
      buckets: buckets == freezed
          ? _value.buckets
          : buckets // ignore: cast_nullable_to_non_nullable
              as KtList<DayBucket>,
      entriesBetweenBlocAndRepo: entriesBetweenBlocAndRepo == freezed
          ? _value.entriesBetweenBlocAndRepo
          : entriesBetweenBlocAndRepo // ignore: cast_nullable_to_non_nullable
              as KtList<FoodItemEntry>,
      entriesFoodInputBloc: entriesFoodInputBloc == freezed
          ? _value.entriesFoodInputBloc
          : entriesFoodInputBloc // ignore: cast_nullable_to_non_nullable
              as KtList<FoodItemEntryWrapper>,
    ));
  }
}

/// @nodoc
abstract class _$DashboardStateCopyWith<$Res>
    implements $DashboardStateCopyWith<$Res> {
  factory _$DashboardStateCopyWith(
          _DashboardState value, $Res Function(_DashboardState) then) =
      __$DashboardStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {DashboardBucketsState dashboardBucketsState,
      KtList<DayBucket> buckets,
      KtList<FoodItemEntry> entriesBetweenBlocAndRepo,
      KtList<FoodItemEntryWrapper> entriesFoodInputBloc});
}

/// @nodoc
class __$DashboardStateCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res>
    implements _$DashboardStateCopyWith<$Res> {
  __$DashboardStateCopyWithImpl(
      _DashboardState _value, $Res Function(_DashboardState) _then)
      : super(_value, (v) => _then(v as _DashboardState));

  @override
  _DashboardState get _value => super._value as _DashboardState;

  @override
  $Res call({
    Object? dashboardBucketsState = freezed,
    Object? buckets = freezed,
    Object? entriesBetweenBlocAndRepo = freezed,
    Object? entriesFoodInputBloc = freezed,
  }) {
    return _then(_DashboardState(
      dashboardBucketsState: dashboardBucketsState == freezed
          ? _value.dashboardBucketsState
          : dashboardBucketsState // ignore: cast_nullable_to_non_nullable
              as DashboardBucketsState,
      buckets: buckets == freezed
          ? _value.buckets
          : buckets // ignore: cast_nullable_to_non_nullable
              as KtList<DayBucket>,
      entriesBetweenBlocAndRepo: entriesBetweenBlocAndRepo == freezed
          ? _value.entriesBetweenBlocAndRepo
          : entriesBetweenBlocAndRepo // ignore: cast_nullable_to_non_nullable
              as KtList<FoodItemEntry>,
      entriesFoodInputBloc: entriesFoodInputBloc == freezed
          ? _value.entriesFoodInputBloc
          : entriesFoodInputBloc // ignore: cast_nullable_to_non_nullable
              as KtList<FoodItemEntryWrapper>,
    ));
  }
}

/// @nodoc

class _$_DashboardState implements _DashboardState {
  const _$_DashboardState(
      {required this.dashboardBucketsState,
      required this.buckets,
      required this.entriesBetweenBlocAndRepo,
      required this.entriesFoodInputBloc});

  @override
  final DashboardBucketsState dashboardBucketsState;
  @override
  final KtList<DayBucket> buckets;
  @override
  final KtList<FoodItemEntry> entriesBetweenBlocAndRepo;
  @override
  final KtList<FoodItemEntryWrapper> entriesFoodInputBloc;

  @override
  String toString() {
    return 'DashboardState(dashboardBucketsState: $dashboardBucketsState, buckets: $buckets, entriesBetweenBlocAndRepo: $entriesBetweenBlocAndRepo, entriesFoodInputBloc: $entriesFoodInputBloc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DashboardState &&
            const DeepCollectionEquality()
                .equals(other.dashboardBucketsState, dashboardBucketsState) &&
            const DeepCollectionEquality().equals(other.buckets, buckets) &&
            const DeepCollectionEquality().equals(
                other.entriesBetweenBlocAndRepo, entriesBetweenBlocAndRepo) &&
            const DeepCollectionEquality()
                .equals(other.entriesFoodInputBloc, entriesFoodInputBloc));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(dashboardBucketsState),
      const DeepCollectionEquality().hash(buckets),
      const DeepCollectionEquality().hash(entriesBetweenBlocAndRepo),
      const DeepCollectionEquality().hash(entriesFoodInputBloc));

  @JsonKey(ignore: true)
  @override
  _$DashboardStateCopyWith<_DashboardState> get copyWith =>
      __$DashboardStateCopyWithImpl<_DashboardState>(this, _$identity);
}

abstract class _DashboardState implements DashboardState {
  const factory _DashboardState(
          {required final DashboardBucketsState dashboardBucketsState,
          required final KtList<DayBucket> buckets,
          required final KtList<FoodItemEntry> entriesBetweenBlocAndRepo,
          required final KtList<FoodItemEntryWrapper> entriesFoodInputBloc}) =
      _$_DashboardState;

  @override
  DashboardBucketsState get dashboardBucketsState =>
      throw _privateConstructorUsedError;
  @override
  KtList<DayBucket> get buckets => throw _privateConstructorUsedError;
  @override
  KtList<FoodItemEntry> get entriesBetweenBlocAndRepo =>
      throw _privateConstructorUsedError;
  @override
  KtList<FoodItemEntryWrapper> get entriesFoodInputBloc =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DashboardStateCopyWith<_DashboardState> get copyWith =>
      throw _privateConstructorUsedError;
}

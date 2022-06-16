// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'food_item_entry_wrapper.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FoodItemEntryWrapper {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FoodItemEntry entry) success,
    required TResult Function(UniqueId uniqueId, DateTime dateTime,
            String inputFoodName, Amount amount)
        processing,
    required TResult Function(UniqueId uniqueId, DateTime dateTime,
            String inputFoodName, Amount amount)
        failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(FoodItemEntry entry)? success,
    TResult Function(UniqueId uniqueId, DateTime dateTime, String inputFoodName,
            Amount amount)?
        processing,
    TResult Function(UniqueId uniqueId, DateTime dateTime, String inputFoodName,
            Amount amount)?
        failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FoodItemEntry entry)? success,
    TResult Function(UniqueId uniqueId, DateTime dateTime, String inputFoodName,
            Amount amount)?
        processing,
    TResult Function(UniqueId uniqueId, DateTime dateTime, String inputFoodName,
            Amount amount)?
        failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FoodItemEntrySuccess value) success,
    required TResult Function(FoodItemEntryProcessing value) processing,
    required TResult Function(FoodItemEntryFailed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FoodItemEntrySuccess value)? success,
    TResult Function(FoodItemEntryProcessing value)? processing,
    TResult Function(FoodItemEntryFailed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FoodItemEntrySuccess value)? success,
    TResult Function(FoodItemEntryProcessing value)? processing,
    TResult Function(FoodItemEntryFailed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodItemEntryWrapperCopyWith<$Res> {
  factory $FoodItemEntryWrapperCopyWith(FoodItemEntryWrapper value,
          $Res Function(FoodItemEntryWrapper) then) =
      _$FoodItemEntryWrapperCopyWithImpl<$Res>;
}

/// @nodoc
class _$FoodItemEntryWrapperCopyWithImpl<$Res>
    implements $FoodItemEntryWrapperCopyWith<$Res> {
  _$FoodItemEntryWrapperCopyWithImpl(this._value, this._then);

  final FoodItemEntryWrapper _value;
  // ignore: unused_field
  final $Res Function(FoodItemEntryWrapper) _then;
}

/// @nodoc
abstract class $FoodItemEntrySuccessCopyWith<$Res> {
  factory $FoodItemEntrySuccessCopyWith(FoodItemEntrySuccess value,
          $Res Function(FoodItemEntrySuccess) then) =
      _$FoodItemEntrySuccessCopyWithImpl<$Res>;
  $Res call({FoodItemEntry entry});

  $FoodItemEntryCopyWith<$Res> get entry;
}

/// @nodoc
class _$FoodItemEntrySuccessCopyWithImpl<$Res>
    extends _$FoodItemEntryWrapperCopyWithImpl<$Res>
    implements $FoodItemEntrySuccessCopyWith<$Res> {
  _$FoodItemEntrySuccessCopyWithImpl(
      FoodItemEntrySuccess _value, $Res Function(FoodItemEntrySuccess) _then)
      : super(_value, (v) => _then(v as FoodItemEntrySuccess));

  @override
  FoodItemEntrySuccess get _value => super._value as FoodItemEntrySuccess;

  @override
  $Res call({
    Object? entry = freezed,
  }) {
    return _then(FoodItemEntrySuccess(
      entry == freezed
          ? _value.entry
          : entry // ignore: cast_nullable_to_non_nullable
              as FoodItemEntry,
    ));
  }

  @override
  $FoodItemEntryCopyWith<$Res> get entry {
    return $FoodItemEntryCopyWith<$Res>(_value.entry, (value) {
      return _then(_value.copyWith(entry: value));
    });
  }
}

/// @nodoc

class _$FoodItemEntrySuccess implements FoodItemEntrySuccess {
  const _$FoodItemEntrySuccess(this.entry);

  @override
  final FoodItemEntry entry;

  @override
  String toString() {
    return 'FoodItemEntryWrapper.success(entry: $entry)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FoodItemEntrySuccess &&
            const DeepCollectionEquality().equals(other.entry, entry));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(entry));

  @JsonKey(ignore: true)
  @override
  $FoodItemEntrySuccessCopyWith<FoodItemEntrySuccess> get copyWith =>
      _$FoodItemEntrySuccessCopyWithImpl<FoodItemEntrySuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FoodItemEntry entry) success,
    required TResult Function(UniqueId uniqueId, DateTime dateTime,
            String inputFoodName, Amount amount)
        processing,
    required TResult Function(UniqueId uniqueId, DateTime dateTime,
            String inputFoodName, Amount amount)
        failed,
  }) {
    return success(entry);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(FoodItemEntry entry)? success,
    TResult Function(UniqueId uniqueId, DateTime dateTime, String inputFoodName,
            Amount amount)?
        processing,
    TResult Function(UniqueId uniqueId, DateTime dateTime, String inputFoodName,
            Amount amount)?
        failed,
  }) {
    return success?.call(entry);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FoodItemEntry entry)? success,
    TResult Function(UniqueId uniqueId, DateTime dateTime, String inputFoodName,
            Amount amount)?
        processing,
    TResult Function(UniqueId uniqueId, DateTime dateTime, String inputFoodName,
            Amount amount)?
        failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(entry);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FoodItemEntrySuccess value) success,
    required TResult Function(FoodItemEntryProcessing value) processing,
    required TResult Function(FoodItemEntryFailed value) failed,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FoodItemEntrySuccess value)? success,
    TResult Function(FoodItemEntryProcessing value)? processing,
    TResult Function(FoodItemEntryFailed value)? failed,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FoodItemEntrySuccess value)? success,
    TResult Function(FoodItemEntryProcessing value)? processing,
    TResult Function(FoodItemEntryFailed value)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class FoodItemEntrySuccess implements FoodItemEntryWrapper {
  const factory FoodItemEntrySuccess(final FoodItemEntry entry) =
      _$FoodItemEntrySuccess;

  FoodItemEntry get entry => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FoodItemEntrySuccessCopyWith<FoodItemEntrySuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodItemEntryProcessingCopyWith<$Res> {
  factory $FoodItemEntryProcessingCopyWith(FoodItemEntryProcessing value,
          $Res Function(FoodItemEntryProcessing) then) =
      _$FoodItemEntryProcessingCopyWithImpl<$Res>;
  $Res call(
      {UniqueId uniqueId,
      DateTime dateTime,
      String inputFoodName,
      Amount amount});

  $AmountCopyWith<$Res> get amount;
}

/// @nodoc
class _$FoodItemEntryProcessingCopyWithImpl<$Res>
    extends _$FoodItemEntryWrapperCopyWithImpl<$Res>
    implements $FoodItemEntryProcessingCopyWith<$Res> {
  _$FoodItemEntryProcessingCopyWithImpl(FoodItemEntryProcessing _value,
      $Res Function(FoodItemEntryProcessing) _then)
      : super(_value, (v) => _then(v as FoodItemEntryProcessing));

  @override
  FoodItemEntryProcessing get _value => super._value as FoodItemEntryProcessing;

  @override
  $Res call({
    Object? uniqueId = freezed,
    Object? dateTime = freezed,
    Object? inputFoodName = freezed,
    Object? amount = freezed,
  }) {
    return _then(FoodItemEntryProcessing(
      uniqueId: uniqueId == freezed
          ? _value.uniqueId
          : uniqueId // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      inputFoodName: inputFoodName == freezed
          ? _value.inputFoodName
          : inputFoodName // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
    ));
  }

  @override
  $AmountCopyWith<$Res> get amount {
    return $AmountCopyWith<$Res>(_value.amount, (value) {
      return _then(_value.copyWith(amount: value));
    });
  }
}

/// @nodoc

class _$FoodItemEntryProcessing implements FoodItemEntryProcessing {
  const _$FoodItemEntryProcessing(
      {required this.uniqueId,
      required this.dateTime,
      required this.inputFoodName,
      required this.amount});

  @override
  final UniqueId uniqueId;
  @override
  final DateTime dateTime;
// label from FoodItemString
  @override
  final String inputFoodName;
// comes from FoodItemString directly
  @override
  final Amount amount;

  @override
  String toString() {
    return 'FoodItemEntryWrapper.processing(uniqueId: $uniqueId, dateTime: $dateTime, inputFoodName: $inputFoodName, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FoodItemEntryProcessing &&
            const DeepCollectionEquality().equals(other.uniqueId, uniqueId) &&
            const DeepCollectionEquality().equals(other.dateTime, dateTime) &&
            const DeepCollectionEquality()
                .equals(other.inputFoodName, inputFoodName) &&
            const DeepCollectionEquality().equals(other.amount, amount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uniqueId),
      const DeepCollectionEquality().hash(dateTime),
      const DeepCollectionEquality().hash(inputFoodName),
      const DeepCollectionEquality().hash(amount));

  @JsonKey(ignore: true)
  @override
  $FoodItemEntryProcessingCopyWith<FoodItemEntryProcessing> get copyWith =>
      _$FoodItemEntryProcessingCopyWithImpl<FoodItemEntryProcessing>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FoodItemEntry entry) success,
    required TResult Function(UniqueId uniqueId, DateTime dateTime,
            String inputFoodName, Amount amount)
        processing,
    required TResult Function(UniqueId uniqueId, DateTime dateTime,
            String inputFoodName, Amount amount)
        failed,
  }) {
    return processing(uniqueId, dateTime, inputFoodName, amount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(FoodItemEntry entry)? success,
    TResult Function(UniqueId uniqueId, DateTime dateTime, String inputFoodName,
            Amount amount)?
        processing,
    TResult Function(UniqueId uniqueId, DateTime dateTime, String inputFoodName,
            Amount amount)?
        failed,
  }) {
    return processing?.call(uniqueId, dateTime, inputFoodName, amount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FoodItemEntry entry)? success,
    TResult Function(UniqueId uniqueId, DateTime dateTime, String inputFoodName,
            Amount amount)?
        processing,
    TResult Function(UniqueId uniqueId, DateTime dateTime, String inputFoodName,
            Amount amount)?
        failed,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(uniqueId, dateTime, inputFoodName, amount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FoodItemEntrySuccess value) success,
    required TResult Function(FoodItemEntryProcessing value) processing,
    required TResult Function(FoodItemEntryFailed value) failed,
  }) {
    return processing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FoodItemEntrySuccess value)? success,
    TResult Function(FoodItemEntryProcessing value)? processing,
    TResult Function(FoodItemEntryFailed value)? failed,
  }) {
    return processing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FoodItemEntrySuccess value)? success,
    TResult Function(FoodItemEntryProcessing value)? processing,
    TResult Function(FoodItemEntryFailed value)? failed,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(this);
    }
    return orElse();
  }
}

abstract class FoodItemEntryProcessing implements FoodItemEntryWrapper {
  const factory FoodItemEntryProcessing(
      {required final UniqueId uniqueId,
      required final DateTime dateTime,
      required final String inputFoodName,
      required final Amount amount}) = _$FoodItemEntryProcessing;

  UniqueId get uniqueId => throw _privateConstructorUsedError;
  DateTime get dateTime =>
      throw _privateConstructorUsedError; // label from FoodItemString
  String get inputFoodName =>
      throw _privateConstructorUsedError; // comes from FoodItemString directly
  Amount get amount => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FoodItemEntryProcessingCopyWith<FoodItemEntryProcessing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodItemEntryFailedCopyWith<$Res> {
  factory $FoodItemEntryFailedCopyWith(
          FoodItemEntryFailed value, $Res Function(FoodItemEntryFailed) then) =
      _$FoodItemEntryFailedCopyWithImpl<$Res>;
  $Res call(
      {UniqueId uniqueId,
      DateTime dateTime,
      String inputFoodName,
      Amount amount});

  $AmountCopyWith<$Res> get amount;
}

/// @nodoc
class _$FoodItemEntryFailedCopyWithImpl<$Res>
    extends _$FoodItemEntryWrapperCopyWithImpl<$Res>
    implements $FoodItemEntryFailedCopyWith<$Res> {
  _$FoodItemEntryFailedCopyWithImpl(
      FoodItemEntryFailed _value, $Res Function(FoodItemEntryFailed) _then)
      : super(_value, (v) => _then(v as FoodItemEntryFailed));

  @override
  FoodItemEntryFailed get _value => super._value as FoodItemEntryFailed;

  @override
  $Res call({
    Object? uniqueId = freezed,
    Object? dateTime = freezed,
    Object? inputFoodName = freezed,
    Object? amount = freezed,
  }) {
    return _then(FoodItemEntryFailed(
      uniqueId: uniqueId == freezed
          ? _value.uniqueId
          : uniqueId // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      inputFoodName: inputFoodName == freezed
          ? _value.inputFoodName
          : inputFoodName // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
    ));
  }

  @override
  $AmountCopyWith<$Res> get amount {
    return $AmountCopyWith<$Res>(_value.amount, (value) {
      return _then(_value.copyWith(amount: value));
    });
  }
}

/// @nodoc

class _$FoodItemEntryFailed implements FoodItemEntryFailed {
  const _$FoodItemEntryFailed(
      {required this.uniqueId,
      required this.dateTime,
      required this.inputFoodName,
      required this.amount});

  @override
  final UniqueId uniqueId;
  @override
  final DateTime dateTime;
// label from FoodItemString
  @override
  final String inputFoodName;
// comes from FoodItemString directly
  @override
  final Amount amount;

  @override
  String toString() {
    return 'FoodItemEntryWrapper.failed(uniqueId: $uniqueId, dateTime: $dateTime, inputFoodName: $inputFoodName, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FoodItemEntryFailed &&
            const DeepCollectionEquality().equals(other.uniqueId, uniqueId) &&
            const DeepCollectionEquality().equals(other.dateTime, dateTime) &&
            const DeepCollectionEquality()
                .equals(other.inputFoodName, inputFoodName) &&
            const DeepCollectionEquality().equals(other.amount, amount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uniqueId),
      const DeepCollectionEquality().hash(dateTime),
      const DeepCollectionEquality().hash(inputFoodName),
      const DeepCollectionEquality().hash(amount));

  @JsonKey(ignore: true)
  @override
  $FoodItemEntryFailedCopyWith<FoodItemEntryFailed> get copyWith =>
      _$FoodItemEntryFailedCopyWithImpl<FoodItemEntryFailed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FoodItemEntry entry) success,
    required TResult Function(UniqueId uniqueId, DateTime dateTime,
            String inputFoodName, Amount amount)
        processing,
    required TResult Function(UniqueId uniqueId, DateTime dateTime,
            String inputFoodName, Amount amount)
        failed,
  }) {
    return failed(uniqueId, dateTime, inputFoodName, amount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(FoodItemEntry entry)? success,
    TResult Function(UniqueId uniqueId, DateTime dateTime, String inputFoodName,
            Amount amount)?
        processing,
    TResult Function(UniqueId uniqueId, DateTime dateTime, String inputFoodName,
            Amount amount)?
        failed,
  }) {
    return failed?.call(uniqueId, dateTime, inputFoodName, amount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FoodItemEntry entry)? success,
    TResult Function(UniqueId uniqueId, DateTime dateTime, String inputFoodName,
            Amount amount)?
        processing,
    TResult Function(UniqueId uniqueId, DateTime dateTime, String inputFoodName,
            Amount amount)?
        failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(uniqueId, dateTime, inputFoodName, amount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FoodItemEntrySuccess value) success,
    required TResult Function(FoodItemEntryProcessing value) processing,
    required TResult Function(FoodItemEntryFailed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FoodItemEntrySuccess value)? success,
    TResult Function(FoodItemEntryProcessing value)? processing,
    TResult Function(FoodItemEntryFailed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FoodItemEntrySuccess value)? success,
    TResult Function(FoodItemEntryProcessing value)? processing,
    TResult Function(FoodItemEntryFailed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class FoodItemEntryFailed implements FoodItemEntryWrapper {
  const factory FoodItemEntryFailed(
      {required final UniqueId uniqueId,
      required final DateTime dateTime,
      required final String inputFoodName,
      required final Amount amount}) = _$FoodItemEntryFailed;

  UniqueId get uniqueId => throw _privateConstructorUsedError;
  DateTime get dateTime =>
      throw _privateConstructorUsedError; // label from FoodItemString
  String get inputFoodName =>
      throw _privateConstructorUsedError; // comes from FoodItemString directly
  Amount get amount => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FoodItemEntryFailedCopyWith<FoodItemEntryFailed> get copyWith =>
      throw _privateConstructorUsedError;
}

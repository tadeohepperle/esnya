// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'food_entries_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FoodEntriesEventTearOff {
  const _$FoodEntriesEventTearOff();

  InitialEvent initial() {
    return const InitialEvent();
  }

  AddEntry addEntry(FoodItemEntry entry) {
    return AddEntry(
      entry,
    );
  }

  UpdateEntry updateEntry(FoodItemEntry entry) {
    return UpdateEntry(
      entry,
    );
  }
}

/// @nodoc
const $FoodEntriesEvent = _$FoodEntriesEventTearOff();

/// @nodoc
mixin _$FoodEntriesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(FoodItemEntry entry) addEntry,
    required TResult Function(FoodItemEntry entry) updateEntry,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(FoodItemEntry entry)? addEntry,
    TResult Function(FoodItemEntry entry)? updateEntry,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(FoodItemEntry entry)? addEntry,
    TResult Function(FoodItemEntry entry)? updateEntry,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialEvent value) initial,
    required TResult Function(AddEntry value) addEntry,
    required TResult Function(UpdateEntry value) updateEntry,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialEvent value)? initial,
    TResult Function(AddEntry value)? addEntry,
    TResult Function(UpdateEntry value)? updateEntry,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialEvent value)? initial,
    TResult Function(AddEntry value)? addEntry,
    TResult Function(UpdateEntry value)? updateEntry,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodEntriesEventCopyWith<$Res> {
  factory $FoodEntriesEventCopyWith(
          FoodEntriesEvent value, $Res Function(FoodEntriesEvent) then) =
      _$FoodEntriesEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$FoodEntriesEventCopyWithImpl<$Res>
    implements $FoodEntriesEventCopyWith<$Res> {
  _$FoodEntriesEventCopyWithImpl(this._value, this._then);

  final FoodEntriesEvent _value;
  // ignore: unused_field
  final $Res Function(FoodEntriesEvent) _then;
}

/// @nodoc
abstract class $InitialEventCopyWith<$Res> {
  factory $InitialEventCopyWith(
          InitialEvent value, $Res Function(InitialEvent) then) =
      _$InitialEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialEventCopyWithImpl<$Res>
    extends _$FoodEntriesEventCopyWithImpl<$Res>
    implements $InitialEventCopyWith<$Res> {
  _$InitialEventCopyWithImpl(
      InitialEvent _value, $Res Function(InitialEvent) _then)
      : super(_value, (v) => _then(v as InitialEvent));

  @override
  InitialEvent get _value => super._value as InitialEvent;
}

/// @nodoc

class _$InitialEvent with DiagnosticableTreeMixin implements InitialEvent {
  const _$InitialEvent();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FoodEntriesEvent.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'FoodEntriesEvent.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is InitialEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(FoodItemEntry entry) addEntry,
    required TResult Function(FoodItemEntry entry) updateEntry,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(FoodItemEntry entry)? addEntry,
    TResult Function(FoodItemEntry entry)? updateEntry,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(FoodItemEntry entry)? addEntry,
    TResult Function(FoodItemEntry entry)? updateEntry,
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
    required TResult Function(InitialEvent value) initial,
    required TResult Function(AddEntry value) addEntry,
    required TResult Function(UpdateEntry value) updateEntry,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialEvent value)? initial,
    TResult Function(AddEntry value)? addEntry,
    TResult Function(UpdateEntry value)? updateEntry,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialEvent value)? initial,
    TResult Function(AddEntry value)? addEntry,
    TResult Function(UpdateEntry value)? updateEntry,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialEvent implements FoodEntriesEvent {
  const factory InitialEvent() = _$InitialEvent;
}

/// @nodoc
abstract class $AddEntryCopyWith<$Res> {
  factory $AddEntryCopyWith(AddEntry value, $Res Function(AddEntry) then) =
      _$AddEntryCopyWithImpl<$Res>;
  $Res call({FoodItemEntry entry});

  $FoodItemEntryCopyWith<$Res> get entry;
}

/// @nodoc
class _$AddEntryCopyWithImpl<$Res> extends _$FoodEntriesEventCopyWithImpl<$Res>
    implements $AddEntryCopyWith<$Res> {
  _$AddEntryCopyWithImpl(AddEntry _value, $Res Function(AddEntry) _then)
      : super(_value, (v) => _then(v as AddEntry));

  @override
  AddEntry get _value => super._value as AddEntry;

  @override
  $Res call({
    Object? entry = freezed,
  }) {
    return _then(AddEntry(
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

class _$AddEntry with DiagnosticableTreeMixin implements AddEntry {
  const _$AddEntry(this.entry);

  @override
  final FoodItemEntry entry;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FoodEntriesEvent.addEntry(entry: $entry)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FoodEntriesEvent.addEntry'))
      ..add(DiagnosticsProperty('entry', entry));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddEntry &&
            const DeepCollectionEquality().equals(other.entry, entry));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(entry));

  @JsonKey(ignore: true)
  @override
  $AddEntryCopyWith<AddEntry> get copyWith =>
      _$AddEntryCopyWithImpl<AddEntry>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(FoodItemEntry entry) addEntry,
    required TResult Function(FoodItemEntry entry) updateEntry,
  }) {
    return addEntry(entry);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(FoodItemEntry entry)? addEntry,
    TResult Function(FoodItemEntry entry)? updateEntry,
  }) {
    return addEntry?.call(entry);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(FoodItemEntry entry)? addEntry,
    TResult Function(FoodItemEntry entry)? updateEntry,
    required TResult orElse(),
  }) {
    if (addEntry != null) {
      return addEntry(entry);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialEvent value) initial,
    required TResult Function(AddEntry value) addEntry,
    required TResult Function(UpdateEntry value) updateEntry,
  }) {
    return addEntry(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialEvent value)? initial,
    TResult Function(AddEntry value)? addEntry,
    TResult Function(UpdateEntry value)? updateEntry,
  }) {
    return addEntry?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialEvent value)? initial,
    TResult Function(AddEntry value)? addEntry,
    TResult Function(UpdateEntry value)? updateEntry,
    required TResult orElse(),
  }) {
    if (addEntry != null) {
      return addEntry(this);
    }
    return orElse();
  }
}

abstract class AddEntry implements FoodEntriesEvent {
  const factory AddEntry(FoodItemEntry entry) = _$AddEntry;

  FoodItemEntry get entry;
  @JsonKey(ignore: true)
  $AddEntryCopyWith<AddEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateEntryCopyWith<$Res> {
  factory $UpdateEntryCopyWith(
          UpdateEntry value, $Res Function(UpdateEntry) then) =
      _$UpdateEntryCopyWithImpl<$Res>;
  $Res call({FoodItemEntry entry});

  $FoodItemEntryCopyWith<$Res> get entry;
}

/// @nodoc
class _$UpdateEntryCopyWithImpl<$Res>
    extends _$FoodEntriesEventCopyWithImpl<$Res>
    implements $UpdateEntryCopyWith<$Res> {
  _$UpdateEntryCopyWithImpl(
      UpdateEntry _value, $Res Function(UpdateEntry) _then)
      : super(_value, (v) => _then(v as UpdateEntry));

  @override
  UpdateEntry get _value => super._value as UpdateEntry;

  @override
  $Res call({
    Object? entry = freezed,
  }) {
    return _then(UpdateEntry(
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

class _$UpdateEntry with DiagnosticableTreeMixin implements UpdateEntry {
  const _$UpdateEntry(this.entry);

  @override
  final FoodItemEntry entry;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FoodEntriesEvent.updateEntry(entry: $entry)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FoodEntriesEvent.updateEntry'))
      ..add(DiagnosticsProperty('entry', entry));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateEntry &&
            const DeepCollectionEquality().equals(other.entry, entry));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(entry));

  @JsonKey(ignore: true)
  @override
  $UpdateEntryCopyWith<UpdateEntry> get copyWith =>
      _$UpdateEntryCopyWithImpl<UpdateEntry>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(FoodItemEntry entry) addEntry,
    required TResult Function(FoodItemEntry entry) updateEntry,
  }) {
    return updateEntry(entry);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(FoodItemEntry entry)? addEntry,
    TResult Function(FoodItemEntry entry)? updateEntry,
  }) {
    return updateEntry?.call(entry);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(FoodItemEntry entry)? addEntry,
    TResult Function(FoodItemEntry entry)? updateEntry,
    required TResult orElse(),
  }) {
    if (updateEntry != null) {
      return updateEntry(entry);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialEvent value) initial,
    required TResult Function(AddEntry value) addEntry,
    required TResult Function(UpdateEntry value) updateEntry,
  }) {
    return updateEntry(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialEvent value)? initial,
    TResult Function(AddEntry value)? addEntry,
    TResult Function(UpdateEntry value)? updateEntry,
  }) {
    return updateEntry?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialEvent value)? initial,
    TResult Function(AddEntry value)? addEntry,
    TResult Function(UpdateEntry value)? updateEntry,
    required TResult orElse(),
  }) {
    if (updateEntry != null) {
      return updateEntry(this);
    }
    return orElse();
  }
}

abstract class UpdateEntry implements FoodEntriesEvent {
  const factory UpdateEntry(FoodItemEntry entry) = _$UpdateEntry;

  FoodItemEntry get entry;
  @JsonKey(ignore: true)
  $UpdateEntryCopyWith<UpdateEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$FoodEntriesStateTearOff {
  const _$FoodEntriesStateTearOff();

  _FoodEntriesState call({required List<FoodItemEntry> entries}) {
    return _FoodEntriesState(
      entries: entries,
    );
  }
}

/// @nodoc
const $FoodEntriesState = _$FoodEntriesStateTearOff();

/// @nodoc
mixin _$FoodEntriesState {
  List<FoodItemEntry> get entries => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FoodEntriesStateCopyWith<FoodEntriesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodEntriesStateCopyWith<$Res> {
  factory $FoodEntriesStateCopyWith(
          FoodEntriesState value, $Res Function(FoodEntriesState) then) =
      _$FoodEntriesStateCopyWithImpl<$Res>;
  $Res call({List<FoodItemEntry> entries});
}

/// @nodoc
class _$FoodEntriesStateCopyWithImpl<$Res>
    implements $FoodEntriesStateCopyWith<$Res> {
  _$FoodEntriesStateCopyWithImpl(this._value, this._then);

  final FoodEntriesState _value;
  // ignore: unused_field
  final $Res Function(FoodEntriesState) _then;

  @override
  $Res call({
    Object? entries = freezed,
  }) {
    return _then(_value.copyWith(
      entries: entries == freezed
          ? _value.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<FoodItemEntry>,
    ));
  }
}

/// @nodoc
abstract class _$FoodEntriesStateCopyWith<$Res>
    implements $FoodEntriesStateCopyWith<$Res> {
  factory _$FoodEntriesStateCopyWith(
          _FoodEntriesState value, $Res Function(_FoodEntriesState) then) =
      __$FoodEntriesStateCopyWithImpl<$Res>;
  @override
  $Res call({List<FoodItemEntry> entries});
}

/// @nodoc
class __$FoodEntriesStateCopyWithImpl<$Res>
    extends _$FoodEntriesStateCopyWithImpl<$Res>
    implements _$FoodEntriesStateCopyWith<$Res> {
  __$FoodEntriesStateCopyWithImpl(
      _FoodEntriesState _value, $Res Function(_FoodEntriesState) _then)
      : super(_value, (v) => _then(v as _FoodEntriesState));

  @override
  _FoodEntriesState get _value => super._value as _FoodEntriesState;

  @override
  $Res call({
    Object? entries = freezed,
  }) {
    return _then(_FoodEntriesState(
      entries: entries == freezed
          ? _value.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<FoodItemEntry>,
    ));
  }
}

/// @nodoc

class _$_FoodEntriesState
    with DiagnosticableTreeMixin
    implements _FoodEntriesState {
  const _$_FoodEntriesState({required this.entries});

  @override
  final List<FoodItemEntry> entries;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FoodEntriesState(entries: $entries)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FoodEntriesState'))
      ..add(DiagnosticsProperty('entries', entries));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FoodEntriesState &&
            const DeepCollectionEquality().equals(other.entries, entries));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(entries));

  @JsonKey(ignore: true)
  @override
  _$FoodEntriesStateCopyWith<_FoodEntriesState> get copyWith =>
      __$FoodEntriesStateCopyWithImpl<_FoodEntriesState>(this, _$identity);
}

abstract class _FoodEntriesState implements FoodEntriesState {
  const factory _FoodEntriesState({required List<FoodItemEntry> entries}) =
      _$_FoodEntriesState;

  @override
  List<FoodItemEntry> get entries;
  @override
  @JsonKey(ignore: true)
  _$FoodEntriesStateCopyWith<_FoodEntriesState> get copyWith =>
      throw _privateConstructorUsedError;
}

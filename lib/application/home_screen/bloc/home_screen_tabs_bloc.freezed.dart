// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_screen_tabs_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomeScreenTabsEventTearOff {
  const _$HomeScreenTabsEventTearOff();

  _SetTab setTab(HomeScreenTabType tabType) {
    return _SetTab(
      tabType,
    );
  }
}

/// @nodoc
const $HomeScreenTabsEvent = _$HomeScreenTabsEventTearOff();

/// @nodoc
mixin _$HomeScreenTabsEvent {
  HomeScreenTabType get tabType => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HomeScreenTabType tabType) setTab,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(HomeScreenTabType tabType)? setTab,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HomeScreenTabType tabType)? setTab,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetTab value) setTab,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SetTab value)? setTab,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetTab value)? setTab,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeScreenTabsEventCopyWith<HomeScreenTabsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeScreenTabsEventCopyWith<$Res> {
  factory $HomeScreenTabsEventCopyWith(
          HomeScreenTabsEvent value, $Res Function(HomeScreenTabsEvent) then) =
      _$HomeScreenTabsEventCopyWithImpl<$Res>;
  $Res call({HomeScreenTabType tabType});

  $HomeScreenTabTypeCopyWith<$Res> get tabType;
}

/// @nodoc
class _$HomeScreenTabsEventCopyWithImpl<$Res>
    implements $HomeScreenTabsEventCopyWith<$Res> {
  _$HomeScreenTabsEventCopyWithImpl(this._value, this._then);

  final HomeScreenTabsEvent _value;
  // ignore: unused_field
  final $Res Function(HomeScreenTabsEvent) _then;

  @override
  $Res call({
    Object? tabType = freezed,
  }) {
    return _then(_value.copyWith(
      tabType: tabType == freezed
          ? _value.tabType
          : tabType // ignore: cast_nullable_to_non_nullable
              as HomeScreenTabType,
    ));
  }

  @override
  $HomeScreenTabTypeCopyWith<$Res> get tabType {
    return $HomeScreenTabTypeCopyWith<$Res>(_value.tabType, (value) {
      return _then(_value.copyWith(tabType: value));
    });
  }
}

/// @nodoc
abstract class _$SetTabCopyWith<$Res>
    implements $HomeScreenTabsEventCopyWith<$Res> {
  factory _$SetTabCopyWith(_SetTab value, $Res Function(_SetTab) then) =
      __$SetTabCopyWithImpl<$Res>;
  @override
  $Res call({HomeScreenTabType tabType});

  @override
  $HomeScreenTabTypeCopyWith<$Res> get tabType;
}

/// @nodoc
class __$SetTabCopyWithImpl<$Res>
    extends _$HomeScreenTabsEventCopyWithImpl<$Res>
    implements _$SetTabCopyWith<$Res> {
  __$SetTabCopyWithImpl(_SetTab _value, $Res Function(_SetTab) _then)
      : super(_value, (v) => _then(v as _SetTab));

  @override
  _SetTab get _value => super._value as _SetTab;

  @override
  $Res call({
    Object? tabType = freezed,
  }) {
    return _then(_SetTab(
      tabType == freezed
          ? _value.tabType
          : tabType // ignore: cast_nullable_to_non_nullable
              as HomeScreenTabType,
    ));
  }
}

/// @nodoc

class _$_SetTab implements _SetTab {
  const _$_SetTab(this.tabType);

  @override
  final HomeScreenTabType tabType;

  @override
  String toString() {
    return 'HomeScreenTabsEvent.setTab(tabType: $tabType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SetTab &&
            const DeepCollectionEquality().equals(other.tabType, tabType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(tabType));

  @JsonKey(ignore: true)
  @override
  _$SetTabCopyWith<_SetTab> get copyWith =>
      __$SetTabCopyWithImpl<_SetTab>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HomeScreenTabType tabType) setTab,
  }) {
    return setTab(tabType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(HomeScreenTabType tabType)? setTab,
  }) {
    return setTab?.call(tabType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HomeScreenTabType tabType)? setTab,
    required TResult orElse(),
  }) {
    if (setTab != null) {
      return setTab(tabType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetTab value) setTab,
  }) {
    return setTab(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SetTab value)? setTab,
  }) {
    return setTab?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetTab value)? setTab,
    required TResult orElse(),
  }) {
    if (setTab != null) {
      return setTab(this);
    }
    return orElse();
  }
}

abstract class _SetTab implements HomeScreenTabsEvent {
  const factory _SetTab(HomeScreenTabType tabType) = _$_SetTab;

  @override
  HomeScreenTabType get tabType;
  @override
  @JsonKey(ignore: true)
  _$SetTabCopyWith<_SetTab> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$HomeScreenTabsStateTearOff {
  const _$HomeScreenTabsStateTearOff();

  _HomeScreenTabsState call(HomeScreenTabType tabType) {
    return _HomeScreenTabsState(
      tabType,
    );
  }
}

/// @nodoc
const $HomeScreenTabsState = _$HomeScreenTabsStateTearOff();

/// @nodoc
mixin _$HomeScreenTabsState {
  HomeScreenTabType get tabType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeScreenTabsStateCopyWith<HomeScreenTabsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeScreenTabsStateCopyWith<$Res> {
  factory $HomeScreenTabsStateCopyWith(
          HomeScreenTabsState value, $Res Function(HomeScreenTabsState) then) =
      _$HomeScreenTabsStateCopyWithImpl<$Res>;
  $Res call({HomeScreenTabType tabType});

  $HomeScreenTabTypeCopyWith<$Res> get tabType;
}

/// @nodoc
class _$HomeScreenTabsStateCopyWithImpl<$Res>
    implements $HomeScreenTabsStateCopyWith<$Res> {
  _$HomeScreenTabsStateCopyWithImpl(this._value, this._then);

  final HomeScreenTabsState _value;
  // ignore: unused_field
  final $Res Function(HomeScreenTabsState) _then;

  @override
  $Res call({
    Object? tabType = freezed,
  }) {
    return _then(_value.copyWith(
      tabType: tabType == freezed
          ? _value.tabType
          : tabType // ignore: cast_nullable_to_non_nullable
              as HomeScreenTabType,
    ));
  }

  @override
  $HomeScreenTabTypeCopyWith<$Res> get tabType {
    return $HomeScreenTabTypeCopyWith<$Res>(_value.tabType, (value) {
      return _then(_value.copyWith(tabType: value));
    });
  }
}

/// @nodoc
abstract class _$HomeScreenTabsStateCopyWith<$Res>
    implements $HomeScreenTabsStateCopyWith<$Res> {
  factory _$HomeScreenTabsStateCopyWith(_HomeScreenTabsState value,
          $Res Function(_HomeScreenTabsState) then) =
      __$HomeScreenTabsStateCopyWithImpl<$Res>;
  @override
  $Res call({HomeScreenTabType tabType});

  @override
  $HomeScreenTabTypeCopyWith<$Res> get tabType;
}

/// @nodoc
class __$HomeScreenTabsStateCopyWithImpl<$Res>
    extends _$HomeScreenTabsStateCopyWithImpl<$Res>
    implements _$HomeScreenTabsStateCopyWith<$Res> {
  __$HomeScreenTabsStateCopyWithImpl(
      _HomeScreenTabsState _value, $Res Function(_HomeScreenTabsState) _then)
      : super(_value, (v) => _then(v as _HomeScreenTabsState));

  @override
  _HomeScreenTabsState get _value => super._value as _HomeScreenTabsState;

  @override
  $Res call({
    Object? tabType = freezed,
  }) {
    return _then(_HomeScreenTabsState(
      tabType == freezed
          ? _value.tabType
          : tabType // ignore: cast_nullable_to_non_nullable
              as HomeScreenTabType,
    ));
  }
}

/// @nodoc

class _$_HomeScreenTabsState extends _HomeScreenTabsState {
  const _$_HomeScreenTabsState(this.tabType) : super._();

  @override
  final HomeScreenTabType tabType;

  @override
  String toString() {
    return 'HomeScreenTabsState(tabType: $tabType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeScreenTabsState &&
            const DeepCollectionEquality().equals(other.tabType, tabType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(tabType));

  @JsonKey(ignore: true)
  @override
  _$HomeScreenTabsStateCopyWith<_HomeScreenTabsState> get copyWith =>
      __$HomeScreenTabsStateCopyWithImpl<_HomeScreenTabsState>(
          this, _$identity);
}

abstract class _HomeScreenTabsState extends HomeScreenTabsState {
  const factory _HomeScreenTabsState(HomeScreenTabType tabType) =
      _$_HomeScreenTabsState;
  const _HomeScreenTabsState._() : super._();

  @override
  HomeScreenTabType get tabType;
  @override
  @JsonKey(ignore: true)
  _$HomeScreenTabsStateCopyWith<_HomeScreenTabsState> get copyWith =>
      throw _privateConstructorUsedError;
}

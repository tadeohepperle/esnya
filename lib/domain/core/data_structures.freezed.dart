// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'data_structures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$IntRangeTearOff {
  const _$IntRangeTearOff();

  _IntRange call(int start, int end) {
    return _IntRange(
      start,
      end,
    );
  }
}

/// @nodoc
const $IntRange = _$IntRangeTearOff();

/// @nodoc
mixin _$IntRange {
  int get start => throw _privateConstructorUsedError;
  int get end => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IntRangeCopyWith<IntRange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IntRangeCopyWith<$Res> {
  factory $IntRangeCopyWith(IntRange value, $Res Function(IntRange) then) =
      _$IntRangeCopyWithImpl<$Res>;
  $Res call({int start, int end});
}

/// @nodoc
class _$IntRangeCopyWithImpl<$Res> implements $IntRangeCopyWith<$Res> {
  _$IntRangeCopyWithImpl(this._value, this._then);

  final IntRange _value;
  // ignore: unused_field
  final $Res Function(IntRange) _then;

  @override
  $Res call({
    Object? start = freezed,
    Object? end = freezed,
  }) {
    return _then(_value.copyWith(
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int,
      end: end == freezed
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$IntRangeCopyWith<$Res> implements $IntRangeCopyWith<$Res> {
  factory _$IntRangeCopyWith(_IntRange value, $Res Function(_IntRange) then) =
      __$IntRangeCopyWithImpl<$Res>;
  @override
  $Res call({int start, int end});
}

/// @nodoc
class __$IntRangeCopyWithImpl<$Res> extends _$IntRangeCopyWithImpl<$Res>
    implements _$IntRangeCopyWith<$Res> {
  __$IntRangeCopyWithImpl(_IntRange _value, $Res Function(_IntRange) _then)
      : super(_value, (v) => _then(v as _IntRange));

  @override
  _IntRange get _value => super._value as _IntRange;

  @override
  $Res call({
    Object? start = freezed,
    Object? end = freezed,
  }) {
    return _then(_IntRange(
      start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int,
      end == freezed
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_IntRange implements _IntRange {
  const _$_IntRange(this.start, this.end);

  @override
  final int start;
  @override
  final int end;

  @override
  String toString() {
    return 'IntRange(start: $start, end: $end)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IntRange &&
            const DeepCollectionEquality().equals(other.start, start) &&
            const DeepCollectionEquality().equals(other.end, end));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(start),
      const DeepCollectionEquality().hash(end));

  @JsonKey(ignore: true)
  @override
  _$IntRangeCopyWith<_IntRange> get copyWith =>
      __$IntRangeCopyWithImpl<_IntRange>(this, _$identity);
}

abstract class _IntRange implements IntRange {
  const factory _IntRange(int start, int end) = _$_IntRange;

  @override
  int get start;
  @override
  int get end;
  @override
  @JsonKey(ignore: true)
  _$IntRangeCopyWith<_IntRange> get copyWith =>
      throw _privateConstructorUsedError;
}

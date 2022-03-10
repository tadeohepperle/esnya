// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fragmentizing_engine.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$_TokenTearOff {
  const _$_TokenTearOff();

  __Token call(IntRange range, String flatText) {
    return __Token(
      range,
      flatText,
    );
  }
}

/// @nodoc
const _$Token = _$_TokenTearOff();

/// @nodoc
mixin _$_Token {
  IntRange get range => throw _privateConstructorUsedError;
  String get flatText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  _$TokenCopyWith<Token> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$TokenCopyWith<$Res> {
  factory _$TokenCopyWith(Token value, $Res Function(Token) then) =
      __$TokenCopyWithImpl<$Res>;
  $Res call({IntRange range, String flatText});

  $IntRangeCopyWith<$Res> get range;
}

/// @nodoc
class __$TokenCopyWithImpl<$Res> implements _$TokenCopyWith<$Res> {
  __$TokenCopyWithImpl(this._value, this._then);

  final Token _value;
  // ignore: unused_field
  final $Res Function(Token) _then;

  @override
  $Res call({
    Object? range = freezed,
    Object? flatText = freezed,
  }) {
    return _then(_value.copyWith(
      range: range == freezed
          ? _value.range
          : range // ignore: cast_nullable_to_non_nullable
              as IntRange,
      flatText: flatText == freezed
          ? _value.flatText
          : flatText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $IntRangeCopyWith<$Res> get range {
    return $IntRangeCopyWith<$Res>(_value.range, (value) {
      return _then(_value.copyWith(range: value));
    });
  }
}

/// @nodoc
abstract class _$_TokenCopyWith<$Res> implements _$TokenCopyWith<$Res> {
  factory _$_TokenCopyWith(__Token value, $Res Function(__Token) then) =
      __$_TokenCopyWithImpl<$Res>;
  @override
  $Res call({IntRange range, String flatText});

  @override
  $IntRangeCopyWith<$Res> get range;
}

/// @nodoc
class __$_TokenCopyWithImpl<$Res> extends __$TokenCopyWithImpl<$Res>
    implements _$_TokenCopyWith<$Res> {
  __$_TokenCopyWithImpl(__Token _value, $Res Function(__Token) _then)
      : super(_value, (v) => _then(v as __Token));

  @override
  __Token get _value => super._value as __Token;

  @override
  $Res call({
    Object? range = freezed,
    Object? flatText = freezed,
  }) {
    return _then(__Token(
      range == freezed
          ? _value.range
          : range // ignore: cast_nullable_to_non_nullable
              as IntRange,
      flatText == freezed
          ? _value.flatText
          : flatText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$__Token implements __Token {
  const _$__Token(this.range, this.flatText);

  @override
  final IntRange range;
  @override
  final String flatText;

  @override
  String toString() {
    return '_Token(range: $range, flatText: $flatText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is __Token &&
            const DeepCollectionEquality().equals(other.range, range) &&
            const DeepCollectionEquality().equals(other.flatText, flatText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(range),
      const DeepCollectionEquality().hash(flatText));

  @JsonKey(ignore: true)
  @override
  _$_TokenCopyWith<__Token> get copyWith =>
      __$_TokenCopyWithImpl<__Token>(this, _$identity);
}

abstract class __Token implements Token {
  const factory __Token(IntRange range, String flatText) = _$__Token;

  @override
  IntRange get range;
  @override
  String get flatText;
  @override
  @JsonKey(ignore: true)
  _$_TokenCopyWith<__Token> get copyWith => throw _privateConstructorUsedError;
}

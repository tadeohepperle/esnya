// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fragmentizing_engine_en.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AnalysisTokenTearOff {
  const _$AnalysisTokenTearOff();

  _AnalysisToken call(
      {required Token token,
      required TokenTag tag,
      required TokenCategory category}) {
    return _AnalysisToken(
      token: token,
      tag: tag,
      category: category,
    );
  }
}

/// @nodoc
const $AnalysisToken = _$AnalysisTokenTearOff();

/// @nodoc
mixin _$AnalysisToken {
  Token get token => throw _privateConstructorUsedError;
  TokenTag get tag => throw _privateConstructorUsedError;
  TokenCategory get category => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnalysisTokenCopyWith<AnalysisToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalysisTokenCopyWith<$Res> {
  factory $AnalysisTokenCopyWith(
          AnalysisToken value, $Res Function(AnalysisToken) then) =
      _$AnalysisTokenCopyWithImpl<$Res>;
  $Res call({Token token, TokenTag tag, TokenCategory category});

  $TokenCopyWith<$Res> get token;
}

/// @nodoc
class _$AnalysisTokenCopyWithImpl<$Res>
    implements $AnalysisTokenCopyWith<$Res> {
  _$AnalysisTokenCopyWithImpl(this._value, this._then);

  final AnalysisToken _value;
  // ignore: unused_field
  final $Res Function(AnalysisToken) _then;

  @override
  $Res call({
    Object? token = freezed,
    Object? tag = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as Token,
      tag: tag == freezed
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as TokenTag,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as TokenCategory,
    ));
  }

  @override
  $TokenCopyWith<$Res> get token {
    return $TokenCopyWith<$Res>(_value.token, (value) {
      return _then(_value.copyWith(token: value));
    });
  }
}

/// @nodoc
abstract class _$AnalysisTokenCopyWith<$Res>
    implements $AnalysisTokenCopyWith<$Res> {
  factory _$AnalysisTokenCopyWith(
          _AnalysisToken value, $Res Function(_AnalysisToken) then) =
      __$AnalysisTokenCopyWithImpl<$Res>;
  @override
  $Res call({Token token, TokenTag tag, TokenCategory category});

  @override
  $TokenCopyWith<$Res> get token;
}

/// @nodoc
class __$AnalysisTokenCopyWithImpl<$Res>
    extends _$AnalysisTokenCopyWithImpl<$Res>
    implements _$AnalysisTokenCopyWith<$Res> {
  __$AnalysisTokenCopyWithImpl(
      _AnalysisToken _value, $Res Function(_AnalysisToken) _then)
      : super(_value, (v) => _then(v as _AnalysisToken));

  @override
  _AnalysisToken get _value => super._value as _AnalysisToken;

  @override
  $Res call({
    Object? token = freezed,
    Object? tag = freezed,
    Object? category = freezed,
  }) {
    return _then(_AnalysisToken(
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as Token,
      tag: tag == freezed
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as TokenTag,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as TokenCategory,
    ));
  }
}

/// @nodoc

class _$_AnalysisToken implements _AnalysisToken {
  const _$_AnalysisToken(
      {required this.token, required this.tag, required this.category});

  @override
  final Token token;
  @override
  final TokenTag tag;
  @override
  final TokenCategory category;

  @override
  String toString() {
    return 'AnalysisToken(token: $token, tag: $tag, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AnalysisToken &&
            const DeepCollectionEquality().equals(other.token, token) &&
            const DeepCollectionEquality().equals(other.tag, tag) &&
            const DeepCollectionEquality().equals(other.category, category));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(token),
      const DeepCollectionEquality().hash(tag),
      const DeepCollectionEquality().hash(category));

  @JsonKey(ignore: true)
  @override
  _$AnalysisTokenCopyWith<_AnalysisToken> get copyWith =>
      __$AnalysisTokenCopyWithImpl<_AnalysisToken>(this, _$identity);
}

abstract class _AnalysisToken implements AnalysisToken {
  const factory _AnalysisToken(
      {required Token token,
      required TokenTag tag,
      required TokenCategory category}) = _$_AnalysisToken;

  @override
  Token get token;
  @override
  TokenTag get tag;
  @override
  TokenCategory get category;
  @override
  @JsonKey(ignore: true)
  _$AnalysisTokenCopyWith<_AnalysisToken> get copyWith =>
      throw _privateConstructorUsedError;
}

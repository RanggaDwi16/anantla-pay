// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_wallet_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateWalletParams _$CreateWalletParamsFromJson(Map<String, dynamic> json) {
  return _CreateWalletParams.fromJson(json);
}

/// @nodoc
mixin _$CreateWalletParams {
  @JsonKey(name: "user_id")
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "country_code")
  String? get countryCode => throw _privateConstructorUsedError;

  /// Serializes this CreateWalletParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateWalletParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateWalletParamsCopyWith<CreateWalletParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateWalletParamsCopyWith<$Res> {
  factory $CreateWalletParamsCopyWith(
          CreateWalletParams value, $Res Function(CreateWalletParams) then) =
      _$CreateWalletParamsCopyWithImpl<$Res, CreateWalletParams>;
  @useResult
  $Res call(
      {@JsonKey(name: "user_id") int? userId,
      @JsonKey(name: "country_code") String? countryCode});
}

/// @nodoc
class _$CreateWalletParamsCopyWithImpl<$Res, $Val extends CreateWalletParams>
    implements $CreateWalletParamsCopyWith<$Res> {
  _$CreateWalletParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateWalletParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? countryCode = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateWalletParamsImplCopyWith<$Res>
    implements $CreateWalletParamsCopyWith<$Res> {
  factory _$$CreateWalletParamsImplCopyWith(_$CreateWalletParamsImpl value,
          $Res Function(_$CreateWalletParamsImpl) then) =
      __$$CreateWalletParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "user_id") int? userId,
      @JsonKey(name: "country_code") String? countryCode});
}

/// @nodoc
class __$$CreateWalletParamsImplCopyWithImpl<$Res>
    extends _$CreateWalletParamsCopyWithImpl<$Res, _$CreateWalletParamsImpl>
    implements _$$CreateWalletParamsImplCopyWith<$Res> {
  __$$CreateWalletParamsImplCopyWithImpl(_$CreateWalletParamsImpl _value,
      $Res Function(_$CreateWalletParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateWalletParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? countryCode = freezed,
  }) {
    return _then(_$CreateWalletParamsImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateWalletParamsImpl implements _CreateWalletParams {
  const _$CreateWalletParamsImpl(
      {@JsonKey(name: "user_id") this.userId,
      @JsonKey(name: "country_code") this.countryCode});

  factory _$CreateWalletParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateWalletParamsImplFromJson(json);

  @override
  @JsonKey(name: "user_id")
  final int? userId;
  @override
  @JsonKey(name: "country_code")
  final String? countryCode;

  @override
  String toString() {
    return 'CreateWalletParams(userId: $userId, countryCode: $countryCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateWalletParamsImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, countryCode);

  /// Create a copy of CreateWalletParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateWalletParamsImplCopyWith<_$CreateWalletParamsImpl> get copyWith =>
      __$$CreateWalletParamsImplCopyWithImpl<_$CreateWalletParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateWalletParamsImplToJson(
      this,
    );
  }
}

abstract class _CreateWalletParams implements CreateWalletParams {
  const factory _CreateWalletParams(
          {@JsonKey(name: "user_id") final int? userId,
          @JsonKey(name: "country_code") final String? countryCode}) =
      _$CreateWalletParamsImpl;

  factory _CreateWalletParams.fromJson(Map<String, dynamic> json) =
      _$CreateWalletParamsImpl.fromJson;

  @override
  @JsonKey(name: "user_id")
  int? get userId;
  @override
  @JsonKey(name: "country_code")
  String? get countryCode;

  /// Create a copy of CreateWalletParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateWalletParamsImplCopyWith<_$CreateWalletParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

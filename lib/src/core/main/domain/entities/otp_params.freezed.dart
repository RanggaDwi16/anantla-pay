// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OtpParams _$OtpParamsFromJson(Map<String, dynamic> json) {
  return _OtpParams.fromJson(json);
}

/// @nodoc
mixin _$OtpParams {
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "otp_code")
  String? get otpCode => throw _privateConstructorUsedError;

  /// Serializes this OtpParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OtpParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OtpParamsCopyWith<OtpParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpParamsCopyWith<$Res> {
  factory $OtpParamsCopyWith(OtpParams value, $Res Function(OtpParams) then) =
      _$OtpParamsCopyWithImpl<$Res, OtpParams>;
  @useResult
  $Res call(
      {@JsonKey(name: "email") String? email,
      @JsonKey(name: "otp_code") String? otpCode});
}

/// @nodoc
class _$OtpParamsCopyWithImpl<$Res, $Val extends OtpParams>
    implements $OtpParamsCopyWith<$Res> {
  _$OtpParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OtpParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? otpCode = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      otpCode: freezed == otpCode
          ? _value.otpCode
          : otpCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OtpParamsImplCopyWith<$Res>
    implements $OtpParamsCopyWith<$Res> {
  factory _$$OtpParamsImplCopyWith(
          _$OtpParamsImpl value, $Res Function(_$OtpParamsImpl) then) =
      __$$OtpParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "email") String? email,
      @JsonKey(name: "otp_code") String? otpCode});
}

/// @nodoc
class __$$OtpParamsImplCopyWithImpl<$Res>
    extends _$OtpParamsCopyWithImpl<$Res, _$OtpParamsImpl>
    implements _$$OtpParamsImplCopyWith<$Res> {
  __$$OtpParamsImplCopyWithImpl(
      _$OtpParamsImpl _value, $Res Function(_$OtpParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of OtpParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? otpCode = freezed,
  }) {
    return _then(_$OtpParamsImpl(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      otpCode: freezed == otpCode
          ? _value.otpCode
          : otpCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OtpParamsImpl implements _OtpParams {
  const _$OtpParamsImpl(
      {@JsonKey(name: "email") this.email,
      @JsonKey(name: "otp_code") this.otpCode});

  factory _$OtpParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$OtpParamsImplFromJson(json);

  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(name: "otp_code")
  final String? otpCode;

  @override
  String toString() {
    return 'OtpParams(email: $email, otpCode: $otpCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpParamsImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.otpCode, otpCode) || other.otpCode == otpCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, otpCode);

  /// Create a copy of OtpParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpParamsImplCopyWith<_$OtpParamsImpl> get copyWith =>
      __$$OtpParamsImplCopyWithImpl<_$OtpParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OtpParamsImplToJson(
      this,
    );
  }
}

abstract class _OtpParams implements OtpParams {
  const factory _OtpParams(
      {@JsonKey(name: "email") final String? email,
      @JsonKey(name: "otp_code") final String? otpCode}) = _$OtpParamsImpl;

  factory _OtpParams.fromJson(Map<String, dynamic> json) =
      _$OtpParamsImpl.fromJson;

  @override
  @JsonKey(name: "email")
  String? get email;
  @override
  @JsonKey(name: "otp_code")
  String? get otpCode;

  /// Create a copy of OtpParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OtpParamsImplCopyWith<_$OtpParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

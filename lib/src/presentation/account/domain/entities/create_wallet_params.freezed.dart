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

ActivateWalletParams _$ActivateWalletParamsFromJson(Map<String, dynamic> json) {
  return _ActivateWalletParams.fromJson(json);
}

/// @nodoc
mixin _$ActivateWalletParams {
  @JsonKey(name: "wallet_id")
  int? get walletId => throw _privateConstructorUsedError;
  @JsonKey(name: "country_code")
  String? get countryCode => throw _privateConstructorUsedError;

  /// Serializes this ActivateWalletParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ActivateWalletParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActivateWalletParamsCopyWith<ActivateWalletParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivateWalletParamsCopyWith<$Res> {
  factory $ActivateWalletParamsCopyWith(ActivateWalletParams value,
          $Res Function(ActivateWalletParams) then) =
      _$ActivateWalletParamsCopyWithImpl<$Res, ActivateWalletParams>;
  @useResult
  $Res call(
      {@JsonKey(name: "wallet_id") int? walletId,
      @JsonKey(name: "country_code") String? countryCode});
}

/// @nodoc
class _$ActivateWalletParamsCopyWithImpl<$Res,
        $Val extends ActivateWalletParams>
    implements $ActivateWalletParamsCopyWith<$Res> {
  _$ActivateWalletParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActivateWalletParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walletId = freezed,
    Object? countryCode = freezed,
  }) {
    return _then(_value.copyWith(
      walletId: freezed == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as int?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActivateWalletParamsImplCopyWith<$Res>
    implements $ActivateWalletParamsCopyWith<$Res> {
  factory _$$ActivateWalletParamsImplCopyWith(_$ActivateWalletParamsImpl value,
          $Res Function(_$ActivateWalletParamsImpl) then) =
      __$$ActivateWalletParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "wallet_id") int? walletId,
      @JsonKey(name: "country_code") String? countryCode});
}

/// @nodoc
class __$$ActivateWalletParamsImplCopyWithImpl<$Res>
    extends _$ActivateWalletParamsCopyWithImpl<$Res, _$ActivateWalletParamsImpl>
    implements _$$ActivateWalletParamsImplCopyWith<$Res> {
  __$$ActivateWalletParamsImplCopyWithImpl(_$ActivateWalletParamsImpl _value,
      $Res Function(_$ActivateWalletParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivateWalletParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walletId = freezed,
    Object? countryCode = freezed,
  }) {
    return _then(_$ActivateWalletParamsImpl(
      walletId: freezed == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
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
class _$ActivateWalletParamsImpl implements _ActivateWalletParams {
  const _$ActivateWalletParamsImpl(
      {@JsonKey(name: "wallet_id") this.walletId,
      @JsonKey(name: "country_code") this.countryCode});

  factory _$ActivateWalletParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivateWalletParamsImplFromJson(json);

  @override
  @JsonKey(name: "wallet_id")
  final int? walletId;
  @override
  @JsonKey(name: "country_code")
  final String? countryCode;

  @override
  String toString() {
    return 'ActivateWalletParams(walletId: $walletId, countryCode: $countryCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivateWalletParamsImpl &&
            (identical(other.walletId, walletId) ||
                other.walletId == walletId) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, walletId, countryCode);

  /// Create a copy of ActivateWalletParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivateWalletParamsImplCopyWith<_$ActivateWalletParamsImpl>
      get copyWith =>
          __$$ActivateWalletParamsImplCopyWithImpl<_$ActivateWalletParamsImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivateWalletParamsImplToJson(
      this,
    );
  }
}

abstract class _ActivateWalletParams implements ActivateWalletParams {
  const factory _ActivateWalletParams(
          {@JsonKey(name: "wallet_id") final int? walletId,
          @JsonKey(name: "country_code") final String? countryCode}) =
      _$ActivateWalletParamsImpl;

  factory _ActivateWalletParams.fromJson(Map<String, dynamic> json) =
      _$ActivateWalletParamsImpl.fromJson;

  @override
  @JsonKey(name: "wallet_id")
  int? get walletId;
  @override
  @JsonKey(name: "country_code")
  String? get countryCode;

  /// Create a copy of ActivateWalletParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActivateWalletParamsImplCopyWith<_$ActivateWalletParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

EKycParams _$EKycParamsFromJson(Map<String, dynamic> json) {
  return _EKycParams.fromJson(json);
}

/// @nodoc
mixin _$EKycParams {
  @JsonKey(name: "user_id")
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "client_id")
  int? get clientId => throw _privateConstructorUsedError;
  @JsonKey(name: "country_code")
  String? get countryCode => throw _privateConstructorUsedError;
  @JsonKey(name: "kyc_data")
  KycData? get kycData => throw _privateConstructorUsedError;

  /// Serializes this EKycParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EKycParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EKycParamsCopyWith<EKycParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EKycParamsCopyWith<$Res> {
  factory $EKycParamsCopyWith(
          EKycParams value, $Res Function(EKycParams) then) =
      _$EKycParamsCopyWithImpl<$Res, EKycParams>;
  @useResult
  $Res call(
      {@JsonKey(name: "user_id") int? userId,
      @JsonKey(name: "client_id") int? clientId,
      @JsonKey(name: "country_code") String? countryCode,
      @JsonKey(name: "kyc_data") KycData? kycData});

  $KycDataCopyWith<$Res>? get kycData;
}

/// @nodoc
class _$EKycParamsCopyWithImpl<$Res, $Val extends EKycParams>
    implements $EKycParamsCopyWith<$Res> {
  _$EKycParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EKycParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? clientId = freezed,
    Object? countryCode = freezed,
    Object? kycData = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      clientId: freezed == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as int?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      kycData: freezed == kycData
          ? _value.kycData
          : kycData // ignore: cast_nullable_to_non_nullable
              as KycData?,
    ) as $Val);
  }

  /// Create a copy of EKycParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KycDataCopyWith<$Res>? get kycData {
    if (_value.kycData == null) {
      return null;
    }

    return $KycDataCopyWith<$Res>(_value.kycData!, (value) {
      return _then(_value.copyWith(kycData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EKycParamsImplCopyWith<$Res>
    implements $EKycParamsCopyWith<$Res> {
  factory _$$EKycParamsImplCopyWith(
          _$EKycParamsImpl value, $Res Function(_$EKycParamsImpl) then) =
      __$$EKycParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "user_id") int? userId,
      @JsonKey(name: "client_id") int? clientId,
      @JsonKey(name: "country_code") String? countryCode,
      @JsonKey(name: "kyc_data") KycData? kycData});

  @override
  $KycDataCopyWith<$Res>? get kycData;
}

/// @nodoc
class __$$EKycParamsImplCopyWithImpl<$Res>
    extends _$EKycParamsCopyWithImpl<$Res, _$EKycParamsImpl>
    implements _$$EKycParamsImplCopyWith<$Res> {
  __$$EKycParamsImplCopyWithImpl(
      _$EKycParamsImpl _value, $Res Function(_$EKycParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of EKycParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? clientId = freezed,
    Object? countryCode = freezed,
    Object? kycData = freezed,
  }) {
    return _then(_$EKycParamsImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      clientId: freezed == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as int?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      kycData: freezed == kycData
          ? _value.kycData
          : kycData // ignore: cast_nullable_to_non_nullable
              as KycData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EKycParamsImpl implements _EKycParams {
  const _$EKycParamsImpl(
      {@JsonKey(name: "user_id") this.userId,
      @JsonKey(name: "client_id") this.clientId,
      @JsonKey(name: "country_code") this.countryCode,
      @JsonKey(name: "kyc_data") this.kycData});

  factory _$EKycParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$EKycParamsImplFromJson(json);

  @override
  @JsonKey(name: "user_id")
  final int? userId;
  @override
  @JsonKey(name: "client_id")
  final int? clientId;
  @override
  @JsonKey(name: "country_code")
  final String? countryCode;
  @override
  @JsonKey(name: "kyc_data")
  final KycData? kycData;

  @override
  String toString() {
    return 'EKycParams(userId: $userId, clientId: $clientId, countryCode: $countryCode, kycData: $kycData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EKycParamsImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.kycData, kycData) || other.kycData == kycData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, clientId, countryCode, kycData);

  /// Create a copy of EKycParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EKycParamsImplCopyWith<_$EKycParamsImpl> get copyWith =>
      __$$EKycParamsImplCopyWithImpl<_$EKycParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EKycParamsImplToJson(
      this,
    );
  }
}

abstract class _EKycParams implements EKycParams {
  const factory _EKycParams(
      {@JsonKey(name: "user_id") final int? userId,
      @JsonKey(name: "client_id") final int? clientId,
      @JsonKey(name: "country_code") final String? countryCode,
      @JsonKey(name: "kyc_data") final KycData? kycData}) = _$EKycParamsImpl;

  factory _EKycParams.fromJson(Map<String, dynamic> json) =
      _$EKycParamsImpl.fromJson;

  @override
  @JsonKey(name: "user_id")
  int? get userId;
  @override
  @JsonKey(name: "client_id")
  int? get clientId;
  @override
  @JsonKey(name: "country_code")
  String? get countryCode;
  @override
  @JsonKey(name: "kyc_data")
  KycData? get kycData;

  /// Create a copy of EKycParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EKycParamsImplCopyWith<_$EKycParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

KycData _$KycDataFromJson(Map<String, dynamic> json) {
  return _KycData.fromJson(json);
}

/// @nodoc
mixin _$KycData {
  @JsonKey(name: "first_name")
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: "last_name")
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: "dob")
  DateTime? get dob => throw _privateConstructorUsedError;
  @JsonKey(name: "tax_id")
  String? get taxId => throw _privateConstructorUsedError;
  @JsonKey(name: "kyc_type")
  String? get kycType => throw _privateConstructorUsedError;
  @JsonKey(name: "address")
  KycAddress? get address => throw _privateConstructorUsedError;

  /// Serializes this KycData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KycData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KycDataCopyWith<KycData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KycDataCopyWith<$Res> {
  factory $KycDataCopyWith(KycData value, $Res Function(KycData) then) =
      _$KycDataCopyWithImpl<$Res, KycData>;
  @useResult
  $Res call(
      {@JsonKey(name: "first_name") String? firstName,
      @JsonKey(name: "last_name") String? lastName,
      @JsonKey(name: "dob") DateTime? dob,
      @JsonKey(name: "tax_id") String? taxId,
      @JsonKey(name: "kyc_type") String? kycType,
      @JsonKey(name: "address") KycAddress? address});

  $KycAddressCopyWith<$Res>? get address;
}

/// @nodoc
class _$KycDataCopyWithImpl<$Res, $Val extends KycData>
    implements $KycDataCopyWith<$Res> {
  _$KycDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KycData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? dob = freezed,
    Object? taxId = freezed,
    Object? kycType = freezed,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      taxId: freezed == taxId
          ? _value.taxId
          : taxId // ignore: cast_nullable_to_non_nullable
              as String?,
      kycType: freezed == kycType
          ? _value.kycType
          : kycType // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as KycAddress?,
    ) as $Val);
  }

  /// Create a copy of KycData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KycAddressCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $KycAddressCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$KycDataImplCopyWith<$Res> implements $KycDataCopyWith<$Res> {
  factory _$$KycDataImplCopyWith(
          _$KycDataImpl value, $Res Function(_$KycDataImpl) then) =
      __$$KycDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "first_name") String? firstName,
      @JsonKey(name: "last_name") String? lastName,
      @JsonKey(name: "dob") DateTime? dob,
      @JsonKey(name: "tax_id") String? taxId,
      @JsonKey(name: "kyc_type") String? kycType,
      @JsonKey(name: "address") KycAddress? address});

  @override
  $KycAddressCopyWith<$Res>? get address;
}

/// @nodoc
class __$$KycDataImplCopyWithImpl<$Res>
    extends _$KycDataCopyWithImpl<$Res, _$KycDataImpl>
    implements _$$KycDataImplCopyWith<$Res> {
  __$$KycDataImplCopyWithImpl(
      _$KycDataImpl _value, $Res Function(_$KycDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of KycData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? dob = freezed,
    Object? taxId = freezed,
    Object? kycType = freezed,
    Object? address = freezed,
  }) {
    return _then(_$KycDataImpl(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      taxId: freezed == taxId
          ? _value.taxId
          : taxId // ignore: cast_nullable_to_non_nullable
              as String?,
      kycType: freezed == kycType
          ? _value.kycType
          : kycType // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as KycAddress?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KycDataImpl implements _KycData {
  const _$KycDataImpl(
      {@JsonKey(name: "first_name") this.firstName,
      @JsonKey(name: "last_name") this.lastName,
      @JsonKey(name: "dob") this.dob,
      @JsonKey(name: "tax_id") this.taxId,
      @JsonKey(name: "kyc_type") this.kycType,
      @JsonKey(name: "address") this.address});

  factory _$KycDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$KycDataImplFromJson(json);

  @override
  @JsonKey(name: "first_name")
  final String? firstName;
  @override
  @JsonKey(name: "last_name")
  final String? lastName;
  @override
  @JsonKey(name: "dob")
  final DateTime? dob;
  @override
  @JsonKey(name: "tax_id")
  final String? taxId;
  @override
  @JsonKey(name: "kyc_type")
  final String? kycType;
  @override
  @JsonKey(name: "address")
  final KycAddress? address;

  @override
  String toString() {
    return 'KycData(firstName: $firstName, lastName: $lastName, dob: $dob, taxId: $taxId, kycType: $kycType, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KycDataImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.taxId, taxId) || other.taxId == taxId) &&
            (identical(other.kycType, kycType) || other.kycType == kycType) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, firstName, lastName, dob, taxId, kycType, address);

  /// Create a copy of KycData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KycDataImplCopyWith<_$KycDataImpl> get copyWith =>
      __$$KycDataImplCopyWithImpl<_$KycDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KycDataImplToJson(
      this,
    );
  }
}

abstract class _KycData implements KycData {
  const factory _KycData(
      {@JsonKey(name: "first_name") final String? firstName,
      @JsonKey(name: "last_name") final String? lastName,
      @JsonKey(name: "dob") final DateTime? dob,
      @JsonKey(name: "tax_id") final String? taxId,
      @JsonKey(name: "kyc_type") final String? kycType,
      @JsonKey(name: "address") final KycAddress? address}) = _$KycDataImpl;

  factory _KycData.fromJson(Map<String, dynamic> json) = _$KycDataImpl.fromJson;

  @override
  @JsonKey(name: "first_name")
  String? get firstName;
  @override
  @JsonKey(name: "last_name")
  String? get lastName;
  @override
  @JsonKey(name: "dob")
  DateTime? get dob;
  @override
  @JsonKey(name: "tax_id")
  String? get taxId;
  @override
  @JsonKey(name: "kyc_type")
  String? get kycType;
  @override
  @JsonKey(name: "address")
  KycAddress? get address;

  /// Create a copy of KycData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KycDataImplCopyWith<_$KycDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

KycAddress _$KycAddressFromJson(Map<String, dynamic> json) {
  return _KycAddress.fromJson(json);
}

/// @nodoc
mixin _$KycAddress {
  @JsonKey(name: "line1")
  String? get line1 => throw _privateConstructorUsedError;
  @JsonKey(name: "line2")
  String? get line2 => throw _privateConstructorUsedError;
  @JsonKey(name: "city")
  String? get city => throw _privateConstructorUsedError;
  @JsonKey(name: "state")
  String? get state => throw _privateConstructorUsedError;
  @JsonKey(name: "postal_code")
  String? get postalCode => throw _privateConstructorUsedError;
  @JsonKey(name: "country")
  String? get country => throw _privateConstructorUsedError;

  /// Serializes this KycAddress to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KycAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KycAddressCopyWith<KycAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KycAddressCopyWith<$Res> {
  factory $KycAddressCopyWith(
          KycAddress value, $Res Function(KycAddress) then) =
      _$KycAddressCopyWithImpl<$Res, KycAddress>;
  @useResult
  $Res call(
      {@JsonKey(name: "line1") String? line1,
      @JsonKey(name: "line2") String? line2,
      @JsonKey(name: "city") String? city,
      @JsonKey(name: "state") String? state,
      @JsonKey(name: "postal_code") String? postalCode,
      @JsonKey(name: "country") String? country});
}

/// @nodoc
class _$KycAddressCopyWithImpl<$Res, $Val extends KycAddress>
    implements $KycAddressCopyWith<$Res> {
  _$KycAddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KycAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? line1 = freezed,
    Object? line2 = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? postalCode = freezed,
    Object? country = freezed,
  }) {
    return _then(_value.copyWith(
      line1: freezed == line1
          ? _value.line1
          : line1 // ignore: cast_nullable_to_non_nullable
              as String?,
      line2: freezed == line2
          ? _value.line2
          : line2 // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KycAddressImplCopyWith<$Res>
    implements $KycAddressCopyWith<$Res> {
  factory _$$KycAddressImplCopyWith(
          _$KycAddressImpl value, $Res Function(_$KycAddressImpl) then) =
      __$$KycAddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "line1") String? line1,
      @JsonKey(name: "line2") String? line2,
      @JsonKey(name: "city") String? city,
      @JsonKey(name: "state") String? state,
      @JsonKey(name: "postal_code") String? postalCode,
      @JsonKey(name: "country") String? country});
}

/// @nodoc
class __$$KycAddressImplCopyWithImpl<$Res>
    extends _$KycAddressCopyWithImpl<$Res, _$KycAddressImpl>
    implements _$$KycAddressImplCopyWith<$Res> {
  __$$KycAddressImplCopyWithImpl(
      _$KycAddressImpl _value, $Res Function(_$KycAddressImpl) _then)
      : super(_value, _then);

  /// Create a copy of KycAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? line1 = freezed,
    Object? line2 = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? postalCode = freezed,
    Object? country = freezed,
  }) {
    return _then(_$KycAddressImpl(
      line1: freezed == line1
          ? _value.line1
          : line1 // ignore: cast_nullable_to_non_nullable
              as String?,
      line2: freezed == line2
          ? _value.line2
          : line2 // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KycAddressImpl implements _KycAddress {
  const _$KycAddressImpl(
      {@JsonKey(name: "line1") this.line1,
      @JsonKey(name: "line2") this.line2,
      @JsonKey(name: "city") this.city,
      @JsonKey(name: "state") this.state,
      @JsonKey(name: "postal_code") this.postalCode,
      @JsonKey(name: "country") this.country});

  factory _$KycAddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$KycAddressImplFromJson(json);

  @override
  @JsonKey(name: "line1")
  final String? line1;
  @override
  @JsonKey(name: "line2")
  final String? line2;
  @override
  @JsonKey(name: "city")
  final String? city;
  @override
  @JsonKey(name: "state")
  final String? state;
  @override
  @JsonKey(name: "postal_code")
  final String? postalCode;
  @override
  @JsonKey(name: "country")
  final String? country;

  @override
  String toString() {
    return 'KycAddress(line1: $line1, line2: $line2, city: $city, state: $state, postalCode: $postalCode, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KycAddressImpl &&
            (identical(other.line1, line1) || other.line1 == line1) &&
            (identical(other.line2, line2) || other.line2 == line2) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.country, country) || other.country == country));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, line1, line2, city, state, postalCode, country);

  /// Create a copy of KycAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KycAddressImplCopyWith<_$KycAddressImpl> get copyWith =>
      __$$KycAddressImplCopyWithImpl<_$KycAddressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KycAddressImplToJson(
      this,
    );
  }
}

abstract class _KycAddress implements KycAddress {
  const factory _KycAddress(
      {@JsonKey(name: "line1") final String? line1,
      @JsonKey(name: "line2") final String? line2,
      @JsonKey(name: "city") final String? city,
      @JsonKey(name: "state") final String? state,
      @JsonKey(name: "postal_code") final String? postalCode,
      @JsonKey(name: "country") final String? country}) = _$KycAddressImpl;

  factory _KycAddress.fromJson(Map<String, dynamic> json) =
      _$KycAddressImpl.fromJson;

  @override
  @JsonKey(name: "line1")
  String? get line1;
  @override
  @JsonKey(name: "line2")
  String? get line2;
  @override
  @JsonKey(name: "city")
  String? get city;
  @override
  @JsonKey(name: "state")
  String? get state;
  @override
  @JsonKey(name: "postal_code")
  String? get postalCode;
  @override
  @JsonKey(name: "country")
  String? get country;

  /// Create a copy of KycAddress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KycAddressImplCopyWith<_$KycAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

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
  @JsonKey(name: "full_name")
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: "birth_date")
  DateTime? get birthDate => throw _privateConstructorUsedError;
  @JsonKey(name: "id_number")
  String? get idNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "attachments")
  List<String>? get attachments => throw _privateConstructorUsedError;

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
      {@JsonKey(name: "full_name") String? fullName,
      @JsonKey(name: "birth_date") DateTime? birthDate,
      @JsonKey(name: "id_number") String? idNumber,
      @JsonKey(name: "attachments") List<String>? attachments});
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
    Object? fullName = freezed,
    Object? birthDate = freezed,
    Object? idNumber = freezed,
    Object? attachments = freezed,
  }) {
    return _then(_value.copyWith(
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      idNumber: freezed == idNumber
          ? _value.idNumber
          : idNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      attachments: freezed == attachments
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
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
      {@JsonKey(name: "full_name") String? fullName,
      @JsonKey(name: "birth_date") DateTime? birthDate,
      @JsonKey(name: "id_number") String? idNumber,
      @JsonKey(name: "attachments") List<String>? attachments});
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
    Object? fullName = freezed,
    Object? birthDate = freezed,
    Object? idNumber = freezed,
    Object? attachments = freezed,
  }) {
    return _then(_$KycDataImpl(
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      idNumber: freezed == idNumber
          ? _value.idNumber
          : idNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      attachments: freezed == attachments
          ? _value._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KycDataImpl implements _KycData {
  const _$KycDataImpl(
      {@JsonKey(name: "full_name") this.fullName,
      @JsonKey(name: "birth_date") this.birthDate,
      @JsonKey(name: "id_number") this.idNumber,
      @JsonKey(name: "attachments") final List<String>? attachments})
      : _attachments = attachments;

  factory _$KycDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$KycDataImplFromJson(json);

  @override
  @JsonKey(name: "full_name")
  final String? fullName;
  @override
  @JsonKey(name: "birth_date")
  final DateTime? birthDate;
  @override
  @JsonKey(name: "id_number")
  final String? idNumber;
  final List<String>? _attachments;
  @override
  @JsonKey(name: "attachments")
  List<String>? get attachments {
    final value = _attachments;
    if (value == null) return null;
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'KycData(fullName: $fullName, birthDate: $birthDate, idNumber: $idNumber, attachments: $attachments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KycDataImpl &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.idNumber, idNumber) ||
                other.idNumber == idNumber) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fullName, birthDate, idNumber,
      const DeepCollectionEquality().hash(_attachments));

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
          {@JsonKey(name: "full_name") final String? fullName,
          @JsonKey(name: "birth_date") final DateTime? birthDate,
          @JsonKey(name: "id_number") final String? idNumber,
          @JsonKey(name: "attachments") final List<String>? attachments}) =
      _$KycDataImpl;

  factory _KycData.fromJson(Map<String, dynamic> json) = _$KycDataImpl.fromJson;

  @override
  @JsonKey(name: "full_name")
  String? get fullName;
  @override
  @JsonKey(name: "birth_date")
  DateTime? get birthDate;
  @override
  @JsonKey(name: "id_number")
  String? get idNumber;
  @override
  @JsonKey(name: "attachments")
  List<String>? get attachments;

  /// Create a copy of KycData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KycDataImplCopyWith<_$KycDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BankModel _$BankModelFromJson(Map<String, dynamic> json) {
  return _BankModel.fromJson(json);
}

/// @nodoc
mixin _$BankModel {
  @JsonKey(name: "bank_code")
  String? get bankCode => throw _privateConstructorUsedError;
  @JsonKey(name: "bank_name")
  String? get bankName => throw _privateConstructorUsedError;
  @JsonKey(name: "partner_service_id")
  String? get partnerServiceId => throw _privateConstructorUsedError;
  @JsonKey(name: "merchant_bin")
  String? get merchantBin => throw _privateConstructorUsedError;
  @JsonKey(name: "va_trx_type")
  String? get vaTrxType => throw _privateConstructorUsedError;
  @JsonKey(name: "partner_service_type")
  String? get partnerServiceType => throw _privateConstructorUsedError;
  @JsonKey(name: "partnership_model")
  String? get partnershipModel => throw _privateConstructorUsedError;
  @JsonKey(name: "billing_type")
  String? get billingType => throw _privateConstructorUsedError;
  @JsonKey(name: "feature")
  String? get feature => throw _privateConstructorUsedError;
  @JsonKey(name: "bin_type")
  String? get binType => throw _privateConstructorUsedError;
  @JsonKey(name: "prefix_custom")
  String? get prefixCustom => throw _privateConstructorUsedError;

  /// Serializes this BankModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BankModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BankModelCopyWith<BankModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankModelCopyWith<$Res> {
  factory $BankModelCopyWith(BankModel value, $Res Function(BankModel) then) =
      _$BankModelCopyWithImpl<$Res, BankModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "bank_code") String? bankCode,
      @JsonKey(name: "bank_name") String? bankName,
      @JsonKey(name: "partner_service_id") String? partnerServiceId,
      @JsonKey(name: "merchant_bin") String? merchantBin,
      @JsonKey(name: "va_trx_type") String? vaTrxType,
      @JsonKey(name: "partner_service_type") String? partnerServiceType,
      @JsonKey(name: "partnership_model") String? partnershipModel,
      @JsonKey(name: "billing_type") String? billingType,
      @JsonKey(name: "feature") String? feature,
      @JsonKey(name: "bin_type") String? binType,
      @JsonKey(name: "prefix_custom") String? prefixCustom});
}

/// @nodoc
class _$BankModelCopyWithImpl<$Res, $Val extends BankModel>
    implements $BankModelCopyWith<$Res> {
  _$BankModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BankModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankCode = freezed,
    Object? bankName = freezed,
    Object? partnerServiceId = freezed,
    Object? merchantBin = freezed,
    Object? vaTrxType = freezed,
    Object? partnerServiceType = freezed,
    Object? partnershipModel = freezed,
    Object? billingType = freezed,
    Object? feature = freezed,
    Object? binType = freezed,
    Object? prefixCustom = freezed,
  }) {
    return _then(_value.copyWith(
      bankCode: freezed == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String?,
      bankName: freezed == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      partnerServiceId: freezed == partnerServiceId
          ? _value.partnerServiceId
          : partnerServiceId // ignore: cast_nullable_to_non_nullable
              as String?,
      merchantBin: freezed == merchantBin
          ? _value.merchantBin
          : merchantBin // ignore: cast_nullable_to_non_nullable
              as String?,
      vaTrxType: freezed == vaTrxType
          ? _value.vaTrxType
          : vaTrxType // ignore: cast_nullable_to_non_nullable
              as String?,
      partnerServiceType: freezed == partnerServiceType
          ? _value.partnerServiceType
          : partnerServiceType // ignore: cast_nullable_to_non_nullable
              as String?,
      partnershipModel: freezed == partnershipModel
          ? _value.partnershipModel
          : partnershipModel // ignore: cast_nullable_to_non_nullable
              as String?,
      billingType: freezed == billingType
          ? _value.billingType
          : billingType // ignore: cast_nullable_to_non_nullable
              as String?,
      feature: freezed == feature
          ? _value.feature
          : feature // ignore: cast_nullable_to_non_nullable
              as String?,
      binType: freezed == binType
          ? _value.binType
          : binType // ignore: cast_nullable_to_non_nullable
              as String?,
      prefixCustom: freezed == prefixCustom
          ? _value.prefixCustom
          : prefixCustom // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BankModelImplCopyWith<$Res>
    implements $BankModelCopyWith<$Res> {
  factory _$$BankModelImplCopyWith(
          _$BankModelImpl value, $Res Function(_$BankModelImpl) then) =
      __$$BankModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "bank_code") String? bankCode,
      @JsonKey(name: "bank_name") String? bankName,
      @JsonKey(name: "partner_service_id") String? partnerServiceId,
      @JsonKey(name: "merchant_bin") String? merchantBin,
      @JsonKey(name: "va_trx_type") String? vaTrxType,
      @JsonKey(name: "partner_service_type") String? partnerServiceType,
      @JsonKey(name: "partnership_model") String? partnershipModel,
      @JsonKey(name: "billing_type") String? billingType,
      @JsonKey(name: "feature") String? feature,
      @JsonKey(name: "bin_type") String? binType,
      @JsonKey(name: "prefix_custom") String? prefixCustom});
}

/// @nodoc
class __$$BankModelImplCopyWithImpl<$Res>
    extends _$BankModelCopyWithImpl<$Res, _$BankModelImpl>
    implements _$$BankModelImplCopyWith<$Res> {
  __$$BankModelImplCopyWithImpl(
      _$BankModelImpl _value, $Res Function(_$BankModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BankModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankCode = freezed,
    Object? bankName = freezed,
    Object? partnerServiceId = freezed,
    Object? merchantBin = freezed,
    Object? vaTrxType = freezed,
    Object? partnerServiceType = freezed,
    Object? partnershipModel = freezed,
    Object? billingType = freezed,
    Object? feature = freezed,
    Object? binType = freezed,
    Object? prefixCustom = freezed,
  }) {
    return _then(_$BankModelImpl(
      bankCode: freezed == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String?,
      bankName: freezed == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      partnerServiceId: freezed == partnerServiceId
          ? _value.partnerServiceId
          : partnerServiceId // ignore: cast_nullable_to_non_nullable
              as String?,
      merchantBin: freezed == merchantBin
          ? _value.merchantBin
          : merchantBin // ignore: cast_nullable_to_non_nullable
              as String?,
      vaTrxType: freezed == vaTrxType
          ? _value.vaTrxType
          : vaTrxType // ignore: cast_nullable_to_non_nullable
              as String?,
      partnerServiceType: freezed == partnerServiceType
          ? _value.partnerServiceType
          : partnerServiceType // ignore: cast_nullable_to_non_nullable
              as String?,
      partnershipModel: freezed == partnershipModel
          ? _value.partnershipModel
          : partnershipModel // ignore: cast_nullable_to_non_nullable
              as String?,
      billingType: freezed == billingType
          ? _value.billingType
          : billingType // ignore: cast_nullable_to_non_nullable
              as String?,
      feature: freezed == feature
          ? _value.feature
          : feature // ignore: cast_nullable_to_non_nullable
              as String?,
      binType: freezed == binType
          ? _value.binType
          : binType // ignore: cast_nullable_to_non_nullable
              as String?,
      prefixCustom: freezed == prefixCustom
          ? _value.prefixCustom
          : prefixCustom // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BankModelImpl implements _BankModel {
  const _$BankModelImpl(
      {@JsonKey(name: "bank_code") this.bankCode,
      @JsonKey(name: "bank_name") this.bankName,
      @JsonKey(name: "partner_service_id") this.partnerServiceId,
      @JsonKey(name: "merchant_bin") this.merchantBin,
      @JsonKey(name: "va_trx_type") this.vaTrxType,
      @JsonKey(name: "partner_service_type") this.partnerServiceType,
      @JsonKey(name: "partnership_model") this.partnershipModel,
      @JsonKey(name: "billing_type") this.billingType,
      @JsonKey(name: "feature") this.feature,
      @JsonKey(name: "bin_type") this.binType,
      @JsonKey(name: "prefix_custom") this.prefixCustom});

  factory _$BankModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BankModelImplFromJson(json);

  @override
  @JsonKey(name: "bank_code")
  final String? bankCode;
  @override
  @JsonKey(name: "bank_name")
  final String? bankName;
  @override
  @JsonKey(name: "partner_service_id")
  final String? partnerServiceId;
  @override
  @JsonKey(name: "merchant_bin")
  final String? merchantBin;
  @override
  @JsonKey(name: "va_trx_type")
  final String? vaTrxType;
  @override
  @JsonKey(name: "partner_service_type")
  final String? partnerServiceType;
  @override
  @JsonKey(name: "partnership_model")
  final String? partnershipModel;
  @override
  @JsonKey(name: "billing_type")
  final String? billingType;
  @override
  @JsonKey(name: "feature")
  final String? feature;
  @override
  @JsonKey(name: "bin_type")
  final String? binType;
  @override
  @JsonKey(name: "prefix_custom")
  final String? prefixCustom;

  @override
  String toString() {
    return 'BankModel(bankCode: $bankCode, bankName: $bankName, partnerServiceId: $partnerServiceId, merchantBin: $merchantBin, vaTrxType: $vaTrxType, partnerServiceType: $partnerServiceType, partnershipModel: $partnershipModel, billingType: $billingType, feature: $feature, binType: $binType, prefixCustom: $prefixCustom)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankModelImpl &&
            (identical(other.bankCode, bankCode) ||
                other.bankCode == bankCode) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.partnerServiceId, partnerServiceId) ||
                other.partnerServiceId == partnerServiceId) &&
            (identical(other.merchantBin, merchantBin) ||
                other.merchantBin == merchantBin) &&
            (identical(other.vaTrxType, vaTrxType) ||
                other.vaTrxType == vaTrxType) &&
            (identical(other.partnerServiceType, partnerServiceType) ||
                other.partnerServiceType == partnerServiceType) &&
            (identical(other.partnershipModel, partnershipModel) ||
                other.partnershipModel == partnershipModel) &&
            (identical(other.billingType, billingType) ||
                other.billingType == billingType) &&
            (identical(other.feature, feature) || other.feature == feature) &&
            (identical(other.binType, binType) || other.binType == binType) &&
            (identical(other.prefixCustom, prefixCustom) ||
                other.prefixCustom == prefixCustom));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      bankCode,
      bankName,
      partnerServiceId,
      merchantBin,
      vaTrxType,
      partnerServiceType,
      partnershipModel,
      billingType,
      feature,
      binType,
      prefixCustom);

  /// Create a copy of BankModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BankModelImplCopyWith<_$BankModelImpl> get copyWith =>
      __$$BankModelImplCopyWithImpl<_$BankModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BankModelImplToJson(
      this,
    );
  }
}

abstract class _BankModel implements BankModel {
  const factory _BankModel(
      {@JsonKey(name: "bank_code") final String? bankCode,
      @JsonKey(name: "bank_name") final String? bankName,
      @JsonKey(name: "partner_service_id") final String? partnerServiceId,
      @JsonKey(name: "merchant_bin") final String? merchantBin,
      @JsonKey(name: "va_trx_type") final String? vaTrxType,
      @JsonKey(name: "partner_service_type") final String? partnerServiceType,
      @JsonKey(name: "partnership_model") final String? partnershipModel,
      @JsonKey(name: "billing_type") final String? billingType,
      @JsonKey(name: "feature") final String? feature,
      @JsonKey(name: "bin_type") final String? binType,
      @JsonKey(name: "prefix_custom")
      final String? prefixCustom}) = _$BankModelImpl;

  factory _BankModel.fromJson(Map<String, dynamic> json) =
      _$BankModelImpl.fromJson;

  @override
  @JsonKey(name: "bank_code")
  String? get bankCode;
  @override
  @JsonKey(name: "bank_name")
  String? get bankName;
  @override
  @JsonKey(name: "partner_service_id")
  String? get partnerServiceId;
  @override
  @JsonKey(name: "merchant_bin")
  String? get merchantBin;
  @override
  @JsonKey(name: "va_trx_type")
  String? get vaTrxType;
  @override
  @JsonKey(name: "partner_service_type")
  String? get partnerServiceType;
  @override
  @JsonKey(name: "partnership_model")
  String? get partnershipModel;
  @override
  @JsonKey(name: "billing_type")
  String? get billingType;
  @override
  @JsonKey(name: "feature")
  String? get feature;
  @override
  @JsonKey(name: "bin_type")
  String? get binType;
  @override
  @JsonKey(name: "prefix_custom")
  String? get prefixCustom;

  /// Create a copy of BankModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BankModelImplCopyWith<_$BankModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

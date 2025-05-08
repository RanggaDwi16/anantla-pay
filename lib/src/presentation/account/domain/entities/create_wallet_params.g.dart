// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_wallet_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateWalletParamsImpl _$$CreateWalletParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateWalletParamsImpl(
      userId: (json['user_id'] as num?)?.toInt(),
      countryCode: json['country_code'] as String?,
    );

Map<String, dynamic> _$$CreateWalletParamsImplToJson(
        _$CreateWalletParamsImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'country_code': instance.countryCode,
    };

_$ActivateWalletParamsImpl _$$ActivateWalletParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$ActivateWalletParamsImpl(
      walletId: (json['wallet_id'] as num?)?.toInt(),
      countryCode: json['country_code'] as String?,
    );

Map<String, dynamic> _$$ActivateWalletParamsImplToJson(
        _$ActivateWalletParamsImpl instance) =>
    <String, dynamic>{
      'wallet_id': instance.walletId,
      'country_code': instance.countryCode,
    };

_$EKycParamsImpl _$$EKycParamsImplFromJson(Map<String, dynamic> json) =>
    _$EKycParamsImpl(
      userId: (json['user_id'] as num?)?.toInt(),
      clientId: (json['client_id'] as num?)?.toInt(),
      countryCode: json['country_code'] as String?,
      kycData: json['kyc_data'] == null
          ? null
          : KycData.fromJson(json['kyc_data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EKycParamsImplToJson(_$EKycParamsImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'client_id': instance.clientId,
      'country_code': instance.countryCode,
      'kyc_data': instance.kycData,
    };

_$KycDataImpl _$$KycDataImplFromJson(Map<String, dynamic> json) =>
    _$KycDataImpl(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      taxId: json['tax_id'] as String?,
      kycType: json['kyc_type'] as String?,
      address: json['address'] == null
          ? null
          : KycAddress.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$KycDataImplToJson(_$KycDataImpl instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'dob': instance.dob?.toIso8601String(),
      'tax_id': instance.taxId,
      'kyc_type': instance.kycType,
      'address': instance.address,
    };

_$KycAddressImpl _$$KycAddressImplFromJson(Map<String, dynamic> json) =>
    _$KycAddressImpl(
      line1: json['line1'] as String?,
      line2: json['line2'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      postalCode: json['postal_code'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$$KycAddressImplToJson(_$KycAddressImpl instance) =>
    <String, dynamic>{
      'line1': instance.line1,
      'line2': instance.line2,
      'city': instance.city,
      'state': instance.state,
      'postal_code': instance.postalCode,
      'country': instance.country,
    };

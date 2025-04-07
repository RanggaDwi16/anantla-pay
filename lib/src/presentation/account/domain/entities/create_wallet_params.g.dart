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
      fullName: json['full_name'] as String?,
      birthDate: json['birth_date'] == null
          ? null
          : DateTime.parse(json['birth_date'] as String),
      idNumber: json['id_number'] as String?,
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$KycDataImplToJson(_$KycDataImpl instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'birth_date': instance.birthDate?.toIso8601String(),
      'id_number': instance.idNumber,
      'attachments': instance.attachments,
    };

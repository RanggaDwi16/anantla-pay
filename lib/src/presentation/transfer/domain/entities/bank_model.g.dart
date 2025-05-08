// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BankModelImpl _$$BankModelImplFromJson(Map<String, dynamic> json) =>
    _$BankModelImpl(
      bankCode: json['bank_code'] as String?,
      bankName: json['bank_name'] as String?,
      partnerServiceId: json['partner_service_id'] as String?,
      merchantBin: json['merchant_bin'] as String?,
      vaTrxType: json['va_trx_type'] as String?,
      partnerServiceType: json['partner_service_type'] as String?,
      partnershipModel: json['partnership_model'] as String?,
      billingType: json['billing_type'] as String?,
      feature: json['feature'] as String?,
      binType: json['bin_type'] as String?,
      prefixCustom: json['prefix_custom'] as String?,
    );

Map<String, dynamic> _$$BankModelImplToJson(_$BankModelImpl instance) =>
    <String, dynamic>{
      'bank_code': instance.bankCode,
      'bank_name': instance.bankName,
      'partner_service_id': instance.partnerServiceId,
      'merchant_bin': instance.merchantBin,
      'va_trx_type': instance.vaTrxType,
      'partner_service_type': instance.partnerServiceType,
      'partnership_model': instance.partnershipModel,
      'billing_type': instance.billingType,
      'feature': instance.feature,
      'bin_type': instance.binType,
      'prefix_custom': instance.prefixCustom,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QrModelImpl _$$QrModelImplFromJson(Map<String, dynamic> json) =>
    _$QrModelImpl(
      provider: json['provider'] as String?,
      account: json['account'] as String?,
      amount: json['amount'] as String?,
      currency: json['currency'] as String?,
      merchant: json['merchant'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$QrModelImplToJson(_$QrModelImpl instance) =>
    <String, dynamic>{
      'provider': instance.provider,
      'account': instance.account,
      'amount': instance.amount,
      'currency': instance.currency,
      'merchant': instance.merchant,
      'type': instance.type,
    };

_$TransferQrModelImpl _$$TransferQrModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransferQrModelImpl(
      type: json['type'] as String,
      walletIdTo: (json['wallet_id_to'] as num).toInt(),
      amount: (json['amount'] as num).toInt(),
      currency: json['currency'] as String,
      note: json['note'] as String,
    );

Map<String, dynamic> _$$TransferQrModelImplToJson(
        _$TransferQrModelImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'wallet_id_to': instance.walletIdTo,
      'amount': instance.amount,
      'currency': instance.currency,
      'note': instance.note,
    };

_$DynamicCpmModelImpl _$$DynamicCpmModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DynamicCpmModelImpl(
      type: json['type'] as String?,
      walletIdTo: (json['wallet_id_to'] as num?)?.toInt(),
      amount: (json['amount'] as num?)?.toInt(),
      currency: json['currency'] as String?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$DynamicCpmModelImplToJson(
        _$DynamicCpmModelImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'wallet_id_to': instance.walletIdTo,
      'amount': instance.amount,
      'currency': instance.currency,
      'note': instance.note,
    };

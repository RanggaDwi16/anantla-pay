// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_up_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TopupParamsImpl _$$TopupParamsImplFromJson(Map<String, dynamic> json) =>
    _$TopupParamsImpl(
      walletId: (json['wallet_id'] as num?)?.toInt(),
      amount: (json['amount'] as num?)?.toInt(),
      currency: json['currency'] as String?,
      referenceId: json['reference_id'] as String?,
    );

Map<String, dynamic> _$$TopupParamsImplToJson(_$TopupParamsImpl instance) =>
    <String, dynamic>{
      'wallet_id': instance.walletId,
      'amount': instance.amount,
      'currency': instance.currency,
      'reference_id': instance.referenceId,
    };

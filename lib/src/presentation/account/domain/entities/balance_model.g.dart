// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BalanceModelImpl _$$BalanceModelImplFromJson(Map<String, dynamic> json) =>
    _$BalanceModelImpl(
      userId: (json['user_id'] as num?)?.toInt(),
      walletId: (json['wallet_id'] as num?)?.toInt(),
      balance: json['balance'] as String?,
      currency: json['currency'] as String?,
      pspId: (json['psp_id'] as num?)?.toInt(),
      walletStatus: json['wallet_status'] as String?,
    );

Map<String, dynamic> _$$BalanceModelImplToJson(_$BalanceModelImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'wallet_id': instance.walletId,
      'balance': instance.balance,
      'currency': instance.currency,
      'psp_id': instance.pspId,
      'wallet_status': instance.walletStatus,
    };

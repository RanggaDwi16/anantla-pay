// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BalanceModelImpl _$$BalanceModelImplFromJson(Map<String, dynamic> json) =>
    _$BalanceModelImpl(
      walletId: (json['wallet_id'] as num?)?.toInt(),
      walletCode: json['wallet_code'] as String?,
      currency: json['currency'] as String?,
      walletStatus: json['wallet_status'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      balance: (json['balance'] as num?)?.toInt(),
      totalReceived: (json['total_received'] as num?)?.toInt(),
      totalSpent: (json['total_spent'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$BalanceModelImplToJson(_$BalanceModelImpl instance) =>
    <String, dynamic>{
      'wallet_id': instance.walletId,
      'wallet_code': instance.walletCode,
      'currency': instance.currency,
      'wallet_status': instance.walletStatus,
      'created_at': instance.createdAt?.toIso8601String(),
      'balance': instance.balance,
      'total_received': instance.totalReceived,
      'total_spent': instance.totalSpent,
    };

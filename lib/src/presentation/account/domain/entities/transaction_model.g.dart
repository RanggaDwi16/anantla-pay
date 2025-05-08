// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionModelImpl _$$TransactionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionModelImpl(
      transactionId: json['transaction_id'] as String?,
      transactionType: json['transaction_type'] as String?,
      transactionDate: json['transaction_date'] == null
          ? null
          : DateTime.parse(json['transaction_date'] as String),
      walletId: (json['wallet_id'] as num?)?.toInt(),
      walletFromId: json['wallet_from_id'],
      walletToId: (json['wallet_to_id'] as num?)?.toInt(),
      currencyFrom: json['currency_from'] as String?,
      currencyTo: json['currency_to'] as String?,
      amount: json['amount'] as String?,
      transWalletType: json['trans_wallet_type'] as String?,
      transWalletFlow: json['trans_wallet_flow'] as String?,
      settlementStatus: json['settlement_status'] as String?,
      settledDate: json['settled_date'] == null
          ? null
          : DateTime.parse(json['settled_date'] as String),
      settlementApprover: json['settlement_approver'] as String?,
    );

Map<String, dynamic> _$$TransactionModelImplToJson(
        _$TransactionModelImpl instance) =>
    <String, dynamic>{
      'transaction_id': instance.transactionId,
      'transaction_type': instance.transactionType,
      'transaction_date': instance.transactionDate?.toIso8601String(),
      'wallet_id': instance.walletId,
      'wallet_from_id': instance.walletFromId,
      'wallet_to_id': instance.walletToId,
      'currency_from': instance.currencyFrom,
      'currency_to': instance.currencyTo,
      'amount': instance.amount,
      'trans_wallet_type': instance.transWalletType,
      'trans_wallet_flow': instance.transWalletFlow,
      'settlement_status': instance.settlementStatus,
      'settled_date': instance.settledDate?.toIso8601String(),
      'settlement_approver': instance.settlementApprover,
    };

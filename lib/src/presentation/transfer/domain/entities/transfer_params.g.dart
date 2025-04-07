// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InternalTransferParamsImpl _$$InternalTransferParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$InternalTransferParamsImpl(
      fromWalletId: (json['from_wallet_id'] as num?)?.toInt(),
      toWalletId: (json['to_wallet_id'] as num?)?.toInt(),
      amount: (json['amount'] as num?)?.toInt(),
      note: json['note'] as String?,
      firebaseToken: json['firebase_token'] as String?,
      otpCode: json['otp_code'] as String?,
    );

Map<String, dynamic> _$$InternalTransferParamsImplToJson(
        _$InternalTransferParamsImpl instance) =>
    <String, dynamic>{
      'from_wallet_id': instance.fromWalletId,
      'to_wallet_id': instance.toWalletId,
      'amount': instance.amount,
      'note': instance.note,
      'firebase_token': instance.firebaseToken,
      'otp_code': instance.otpCode,
    };

_$CrossPspParamsImpl _$$CrossPspParamsImplFromJson(Map<String, dynamic> json) =>
    _$CrossPspParamsImpl(
      fromWalletId: (json['from_wallet_id'] as num?)?.toInt(),
      toWalletId: (json['to_wallet_id'] as num?)?.toInt(),
      fromCurrency: json['from_currency'] as String?,
      toCurrency: json['to_currency'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$CrossPspParamsImplToJson(
        _$CrossPspParamsImpl instance) =>
    <String, dynamic>{
      'from_wallet_id': instance.fromWalletId,
      'to_wallet_id': instance.toWalletId,
      'from_currency': instance.fromCurrency,
      'to_currency': instance.toCurrency,
      'amount': instance.amount,
      'note': instance.note,
    };

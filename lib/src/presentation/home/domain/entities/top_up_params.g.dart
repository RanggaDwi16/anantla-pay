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
      firebaseToken: json['firebase_token'] as String?,
    );

Map<String, dynamic> _$$TopupParamsImplToJson(_$TopupParamsImpl instance) =>
    <String, dynamic>{
      'wallet_id': instance.walletId,
      'amount': instance.amount,
      'currency': instance.currency,
      'firebase_token': instance.firebaseToken,
    };

_$VerifyOtpTopupParamsImpl _$$VerifyOtpTopupParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$VerifyOtpTopupParamsImpl(
      walletId: (json['wallet_id'] as num?)?.toInt(),
      otpCode: json['otp_code'] as String?,
    );

Map<String, dynamic> _$$VerifyOtpTopupParamsImplToJson(
        _$VerifyOtpTopupParamsImpl instance) =>
    <String, dynamic>{
      'wallet_id': instance.walletId,
      'otp_code': instance.otpCode,
    };

_$VirtualAccountParamsImpl _$$VirtualAccountParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$VirtualAccountParamsImpl(
      walletId: (json['wallet_id'] as num?)?.toInt(),
      bankCode: json['bank_code'] as String?,
      trxId: json['trxId'] as String?,
      virtualAccountName: json['virtualAccountName'] as String?,
      virtualAccountEmail: json['virtualAccountEmail'] as String?,
      virtualAccountPhone: json['virtualAccountPhone'] as String?,
      totalAmount: json['totalAmount'] == null
          ? null
          : TotalAmount.fromJson(json['totalAmount'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VirtualAccountParamsImplToJson(
        _$VirtualAccountParamsImpl instance) =>
    <String, dynamic>{
      'wallet_id': instance.walletId,
      'bank_code': instance.bankCode,
      'trxId': instance.trxId,
      'virtualAccountName': instance.virtualAccountName,
      'virtualAccountEmail': instance.virtualAccountEmail,
      'virtualAccountPhone': instance.virtualAccountPhone,
      'totalAmount': instance.totalAmount,
    };

_$TotalAmountImpl _$$TotalAmountImplFromJson(Map<String, dynamic> json) =>
    _$TotalAmountImpl(
      value: json['value'] as String?,
      currency: json['currency'] as String?,
    );

Map<String, dynamic> _$$TotalAmountImplToJson(_$TotalAmountImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'currency': instance.currency,
    };

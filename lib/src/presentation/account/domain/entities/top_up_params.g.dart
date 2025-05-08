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
      otpCode: json['otp_code'] as String?,
    );

Map<String, dynamic> _$$TopupParamsImplToJson(_$TopupParamsImpl instance) =>
    <String, dynamic>{
      'wallet_id': instance.walletId,
      'amount': instance.amount,
      'currency': instance.currency,
      'firebase_token': instance.firebaseToken,
      'otp_code': instance.otpCode,
    };

_$VerifyOtpTopupParamsImpl _$$VerifyOtpTopupParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$VerifyOtpTopupParamsImpl(
      walletId: (json['wallet_id'] as num?)?.toInt(),
      amount: (json['amount'] as num?)?.toInt(),
      currency: json['currency'] as String?,
      firebaseToken: json['firebase_token'] as String?,
      otpCode: json['otp_code'] as String?,
    );

Map<String, dynamic> _$$VerifyOtpTopupParamsImplToJson(
        _$VerifyOtpTopupParamsImpl instance) =>
    <String, dynamic>{
      'wallet_id': instance.walletId,
      'amount': instance.amount,
      'currency': instance.currency,
      'firebase_token': instance.firebaseToken,
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
      platformFee: (json['platform_fee'] as num?)?.toInt(),
      partnerFee: (json['partner_fee'] as num?)?.toInt(),
      totalAmount: json['totalAmount'] == null
          ? null
          : TotalAmount.fromJson(json['totalAmount'] as Map<String, dynamic>),
      amount: (json['amount'] as num?)?.toInt(),
      currency: json['currency'] as String?,
      coverFee: json['cover_fee'] as bool?,
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
      'platform_fee': instance.platformFee,
      'partner_fee': instance.partnerFee,
      'totalAmount': instance.totalAmount,
      'amount': instance.amount,
      'currency': instance.currency,
      'cover_fee': instance.coverFee,
    };

_$TotalAmountImpl _$$TotalAmountImplFromJson(Map<String, dynamic> json) =>
    _$TotalAmountImpl(
      amount: json['value'] as String?,
      currency: json['currency'] as String?,
    );

Map<String, dynamic> _$$TotalAmountImplToJson(_$TotalAmountImpl instance) =>
    <String, dynamic>{
      'value': instance.amount,
      'currency': instance.currency,
    };

_$FeeModelImpl _$$FeeModelImplFromJson(Map<String, dynamic> json) =>
    _$FeeModelImpl(
      quoteId: json['quote_id'] as String?,
      currency: json['currency'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
      coverFee: json['cover_fee'] as bool?,
      totalWithFee: json['total_with_fee'] as String?,
      platformFee: json['platform_fee'] as String?,
      partnerFee: json['partner_fee'] as String?,
    );

Map<String, dynamic> _$$FeeModelImplToJson(_$FeeModelImpl instance) =>
    <String, dynamic>{
      'quote_id': instance.quoteId,
      'currency': instance.currency,
      'amount': instance.amount,
      'cover_fee': instance.coverFee,
      'total_with_fee': instance.totalWithFee,
      'platform_fee': instance.platformFee,
      'partner_fee': instance.partnerFee,
    };

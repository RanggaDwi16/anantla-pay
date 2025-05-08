import 'package:anantla_pay/src/presentation/account/controllers/top_up/top_up_data_provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_up_params.freezed.dart';
part 'top_up_params.g.dart';

@freezed
class TopupParams with _$TopupParams {
  const factory TopupParams({
    @JsonKey(name: "wallet_id") int? walletId,
    @JsonKey(name: "amount") int? amount,
    @JsonKey(name: "currency") String? currency,
    @JsonKey(name: "firebase_token") String? firebaseToken,
    @JsonKey(name: "otp_code") String? otpCode,
  }) = _TopupParams;

  factory TopupParams.fromJson(Map<String, dynamic> json) =>
      _$TopupParamsFromJson(json);
}

@freezed
class VerifyOtpTopupParams with _$VerifyOtpTopupParams {
  const factory VerifyOtpTopupParams({
    @JsonKey(name: "wallet_id") int? walletId,
    @JsonKey(name: "amount") int? amount,
    @JsonKey(name: "currency") String? currency,
    @JsonKey(name: "firebase_token") String? firebaseToken,
    @JsonKey(name: "otp_code") String? otpCode,
  }) = _VerifyOtpTopupParams;

  factory VerifyOtpTopupParams.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpTopupParamsFromJson(json);
}

@freezed
class TopUpData with _$TopUpData {
  factory TopUpData({
    int? walletId,
    int? amount,
    String? currency,
    String? referenceId,
    @Default(TopUpType.normal) TopUpType topUpType, // ✅ Tipe Top-Up

    // ✅ Virtual Account Fields
    String? bankCode,
    String? virtualAccountName,
    String? virtualAccountEmail,
    String? virtualAccountPhone,
    int? totalAmount,
  }) = _TopUpData;

  factory TopUpData.initial() => TopUpData();
}

@freezed
class VirtualAccountParams with _$VirtualAccountParams {
  const factory VirtualAccountParams({
    @JsonKey(name: "wallet_id") int? walletId,
    @JsonKey(name: "bank_code") String? bankCode,
    @JsonKey(name: "trxId") String? trxId,
    @JsonKey(name: "virtualAccountName") String? virtualAccountName,
    @JsonKey(name: "virtualAccountEmail") String? virtualAccountEmail,
    @JsonKey(name: "virtualAccountPhone") String? virtualAccountPhone,
    @JsonKey(name: "platform_fee") int? platformFee,
    @JsonKey(name: "partner_fee") int? partnerFee,
    @JsonKey(name: "totalAmount") TotalAmount? totalAmount,
    @JsonKey(name: "amount") int? amount,
    @JsonKey(name: "currency") String? currency,
    @JsonKey(name: "cover_fee") bool? coverFee,
  }) = _VirtualAccountParams;

  factory VirtualAccountParams.fromJson(Map<String, dynamic> json) =>
      _$VirtualAccountParamsFromJson(json);
}

@freezed
class TotalAmount with _$TotalAmount {
  const factory TotalAmount({
    @JsonKey(name: "value") String? amount,
    @JsonKey(name: "currency") String? currency,
  }) = _TotalAmount;

  factory TotalAmount.fromJson(Map<String, dynamic> json) =>
      _$TotalAmountFromJson(json);
}

@freezed
class FeeModel with _$FeeModel {
  const factory FeeModel({
    @JsonKey(name: "quote_id") String? quoteId,
    @JsonKey(name: "currency") String? currency,
    @JsonKey(name: "amount") int? amount,
    @JsonKey(name: "cover_fee") bool? coverFee,
    @JsonKey(name: "total_with_fee") String? totalWithFee,
    @JsonKey(name: "platform_fee") String? platformFee,
    @JsonKey(name: "partner_fee") String? partnerFee,
  }) = _FeeModel;

  factory FeeModel.fromJson(Map<String, dynamic> json) =>
      _$FeeModelFromJson(json);
}

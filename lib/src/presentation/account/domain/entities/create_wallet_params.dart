import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_wallet_params.freezed.dart';
part 'create_wallet_params.g.dart';

@freezed
class CreateWalletParams with _$CreateWalletParams {
  const factory CreateWalletParams({
    @JsonKey(name: "user_id") int? userId,
    @JsonKey(name: "country_code") String? countryCode,
  }) = _CreateWalletParams;

  factory CreateWalletParams.fromJson(Map<String, dynamic> json) =>
      _$CreateWalletParamsFromJson(json);
}

@freezed
class ActivateWalletParams with _$ActivateWalletParams {
  const factory ActivateWalletParams({
    @JsonKey(name: "wallet_id") int? walletId,
    @JsonKey(name: "country_code") String? countryCode,
  }) = _ActivateWalletParams;

  factory ActivateWalletParams.fromJson(Map<String, dynamic> json) =>
      _$ActivateWalletParamsFromJson(json);
}

@freezed
class EKycParams with _$EKycParams {
  const factory EKycParams({
    @JsonKey(name: "user_id") int? userId,
    @JsonKey(name: "client_id") int? clientId,
    @JsonKey(name: "country_code") String? countryCode,
    @JsonKey(name: "kyc_data") KycData? kycData,
  }) = _EKycParams;

  factory EKycParams.fromJson(Map<String, dynamic> json) =>
      _$EKycParamsFromJson(json);
}

@freezed
class KycData with _$KycData {
  const factory KycData({
    @JsonKey(name: "full_name") String? fullName,
    @JsonKey(name: "birth_date") DateTime? birthDate,
    @JsonKey(name: "id_number") String? idNumber,
    @JsonKey(name: "attachments") List<String>? attachments,
  }) = _KycData;

  factory KycData.fromJson(Map<String, dynamic> json) =>
      _$KycDataFromJson(json);
}

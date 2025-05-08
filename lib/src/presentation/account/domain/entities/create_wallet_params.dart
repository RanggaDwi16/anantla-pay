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
    @JsonKey(name: "first_name") String? firstName,
    @JsonKey(name: "last_name") String? lastName,
    @JsonKey(name: "dob") DateTime? dob,
    @JsonKey(name: "tax_id") String? taxId,
    @JsonKey(name: "kyc_type") String? kycType,
    @JsonKey(name: "address") KycAddress? address,
  }) = _KycData;

  factory KycData.fromJson(Map<String, dynamic> json) =>
      _$KycDataFromJson(json);
}

@freezed
class KycAddress with _$KycAddress {
  const factory KycAddress({
    @JsonKey(name: "line1") String? line1,
    @JsonKey(name: "line2") String? line2,
    @JsonKey(name: "city") String? city,
    @JsonKey(name: "state") String? state,
    @JsonKey(name: "postal_code") String? postalCode,
    @JsonKey(name: "country") String? country,
  }) = _KycAddress;

  factory KycAddress.fromJson(Map<String, dynamic> json) =>
      _$KycAddressFromJson(json);
}

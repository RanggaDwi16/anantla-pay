// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'create_virtual_account_params.freezed.dart';
// part 'create_virtual_account_params.g.dart';

// @freezed
// class CreateVirtualAccountParams with _$CreateVirtualAccountParams {
//   const factory CreateVirtualAccountParams({
//     @JsonKey(name: "bank_code") String? bankCode,
//     @JsonKey(name: "virtualAccountName") String? virtualAccountName,
//     @JsonKey(name: "virtualAccountEmail") String? virtualAccountEmail,
//     @JsonKey(name: "virtualAccountPhone") String? virtualAccountPhone,
//     @JsonKey(name: "wallet_id") String? walletId,
//     @JsonKey(name: "totalAmount") Amount? totalAmount,
//     @JsonKey(name: "feeAmount") Amount? feeAmount,
//     @JsonKey(name: "billDetails") List<BillDetail>? billDetails,
//     @JsonKey(name: "freeTexts") List<FreeText>? freeTexts,
//     @JsonKey(name: "additionalInfo")
//     CreateVirtualAccountParamsAdditionalInfo? additionalInfo,
//   }) = _CreateVirtualAccountParams;

//   factory CreateVirtualAccountParams.fromJson(Map<String, dynamic> json) =>
//       _$CreateVirtualAccountParamsFromJson(json);
// }

// @freezed
// class CreateVirtualAccountParamsAdditionalInfo
//     with _$CreateVirtualAccountParamsAdditionalInfo {
//   const factory CreateVirtualAccountParamsAdditionalInfo({
//     @JsonKey(name: "channel") String? channel,
//     @JsonKey(name: "virtualAccountConfig")
//     VirtualAccountConfig? virtualAccountConfig,
//   }) = _CreateVirtualAccountParamsAdditionalInfo;

//   factory CreateVirtualAccountParamsAdditionalInfo.fromJson(
//           Map<String, dynamic> json) =>
//       _$CreateVirtualAccountParamsAdditionalInfoFromJson(json);
// }

// @freezed
// class VirtualAccountConfig with _$VirtualAccountConfig {
//   const factory VirtualAccountConfig({
//     @JsonKey(name: "reusableStatus") bool? reusableStatus,
//   }) = _VirtualAccountConfig;

//   factory VirtualAccountConfig.fromJson(Map<String, dynamic> json) =>
//       _$VirtualAccountConfigFromJson(json);
// }

// @freezed
// class BillDetail with _$BillDetail {
//   const factory BillDetail({
//     @JsonKey(name: "billCode") String? billCode,
//     @JsonKey(name: "billNo") String? billNo,
//     @JsonKey(name: "billName") String? billName,
//     @JsonKey(name: "billShortName") String? billShortName,
//     @JsonKey(name: "billDescription") FreeText? billDescription,
//     @JsonKey(name: "billSubCompany") String? billSubCompany,
//     @JsonKey(name: "billAmount") Amount? billAmount,
//     @JsonKey(name: "additionalInfo") BillDetailAdditionalInfo? additionalInfo,
//   }) = _BillDetail;

//   factory BillDetail.fromJson(Map<String, dynamic> json) =>
//       _$BillDetailFromJson(json);
// }

// @freezed
// class BillDetailAdditionalInfo with _$BillDetailAdditionalInfo {
//   const factory BillDetailAdditionalInfo() = _BillDetailAdditionalInfo;

//   factory BillDetailAdditionalInfo.fromJson(Map<String, dynamic> json) =>
//       _$BillDetailAdditionalInfoFromJson(json);
// }

// @freezed
// class Amount with _$Amount {
//   const factory Amount({
//     @JsonKey(name: "value") String? value,
//     @JsonKey(name: "currency") String? currency,
//   }) = _Amount;

//   factory Amount.fromJson(Map<String, dynamic> json) => _$AmountFromJson(json);
// }

// @freezed
// class FreeText with _$FreeText {
//   const factory FreeText({
//     @JsonKey(name: "english") String? english,
//     @JsonKey(name: "indonesia") String? indonesia,
//   }) = _FreeText;

//   factory FreeText.fromJson(Map<String, dynamic> json) =>
//       _$FreeTextFromJson(json);
// }

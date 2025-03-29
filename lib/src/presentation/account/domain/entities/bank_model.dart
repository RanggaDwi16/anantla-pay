import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_model.freezed.dart';
part 'bank_model.g.dart';

@freezed
class BankModel with _$BankModel {
    const factory BankModel({
        @JsonKey(name: "bank_code")
        String? bankCode,
        @JsonKey(name: "bank_name")
        String? bankName,
        @JsonKey(name: "partner_service_id")
        String? partnerServiceId,
        @JsonKey(name: "merchant_bin")
        String? merchantBin,
        @JsonKey(name: "va_trx_type")
        String? vaTrxType,
        @JsonKey(name: "partner_service_type")
        String? partnerServiceType,
        @JsonKey(name: "partnership_model")
        String? partnershipModel,
        @JsonKey(name: "billing_type")
        String? billingType,
        @JsonKey(name: "feature")
        String? feature,
        @JsonKey(name: "bin_type")
        String? binType,
        @JsonKey(name: "prefix_custom")
        String? prefixCustom,
    }) = _BankModel;

    factory BankModel.fromJson(Map<String, dynamic> json) => _$BankModelFromJson(json);
}

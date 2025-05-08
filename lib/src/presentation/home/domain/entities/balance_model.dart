import 'package:freezed_annotation/freezed_annotation.dart';

part 'balance_model.freezed.dart';
part 'balance_model.g.dart';

@freezed
class BalanceModel with _$BalanceModel {
  const factory BalanceModel({
    @JsonKey(name: "wallet_id") int? walletId,
    @JsonKey(name: "wallet_code") String? walletCode,
    @JsonKey(name: "currency") String? currency,
    @JsonKey(name: "wallet_status") String? walletStatus,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "balance") num? balance,
    //add bool islimited
    //country code
    @JsonKey(name: "country_code") String? countryCode,
    @JsonKey(name: "is_limited") bool? isLimited,
    @JsonKey(name: "total_received") int? totalReceived,
    @JsonKey(name: "total_spent") int? totalSpent,
  }) = _BalanceModel;

  factory BalanceModel.fromJson(Map<String, dynamic> json) =>
      _$BalanceModelFromJson(json);
}

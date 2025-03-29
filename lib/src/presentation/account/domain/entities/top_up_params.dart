import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_up_params.freezed.dart';
part 'top_up_params.g.dart';

@freezed
class TopupParams with _$TopupParams {
  const factory TopupParams({
    @JsonKey(name: "wallet_id") int? walletId,
    @JsonKey(name: "amount") int? amount,
    @JsonKey(name: "currency") String? currency,
    @JsonKey(name: "reference_id") String? referenceId,
  }) = _TopupParams;

  factory TopupParams.fromJson(Map<String, dynamic> json) =>
      _$TopupParamsFromJson(json);
}

@freezed
class TopUpData with _$TopUpData {
  const factory TopUpData({
    int? walletId,
    int? amount,
    String? currency,
    String? referenceId,
  }) = _TopUpData;

  factory TopUpData.initial() => const TopUpData(
        walletId: null,
        amount: null,
        currency: "IDR",
        referenceId: null,
      );
}

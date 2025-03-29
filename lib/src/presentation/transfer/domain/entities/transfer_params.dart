import 'package:freezed_annotation/freezed_annotation.dart';

part 'transfer_params.freezed.dart';
part 'transfer_params.g.dart';

@freezed
class InternalTransferParams with _$InternalTransferParams {
  const factory InternalTransferParams({
    @JsonKey(name: "from_wallet_id") int? fromWalletId,
    @JsonKey(name: "to_wallet_id") int? toWalletId,
    @JsonKey(name: "amount") int? amount,
    @JsonKey(name: "note") String? note,
  }) = _InternalTransferParams;

  factory InternalTransferParams.fromJson(Map<String, dynamic> json) =>
      _$InternalTransferParamsFromJson(json);
}

@freezed
class CrossPspParams with _$CrossPspParams {
  const factory CrossPspParams({
    @JsonKey(name: "from_wallet_id") int? fromWalletId,
    @JsonKey(name: "to_wallet_id") int? toWalletId,
    @JsonKey(name: "from_currency") String? fromCurrency,
    @JsonKey(name: "to_currency") String? toCurrency,
    @JsonKey(name: "amount") int? amount,
    @JsonKey(name: "note") String? note,
  }) = _CrossPspParams;

  factory CrossPspParams.fromJson(Map<String, dynamic> json) =>
      _$CrossPspParamsFromJson(json);
}

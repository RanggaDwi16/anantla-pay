import 'package:freezed_annotation/freezed_annotation.dart';

part 'balance_model.freezed.dart';
part 'balance_model.g.dart';

@freezed
class BalanceModel with _$BalanceModel {
  const factory BalanceModel({
    @JsonKey(name: "user_id") int? userId,
    @JsonKey(name: "wallet_id") int? walletId,
    @JsonKey(name: "balance") int? balance,
    @JsonKey(name: "currency") String? currency,
  }) = _BalanceModel;

  factory BalanceModel.fromJson(Map<String, dynamic> json) =>
      _$BalanceModelFromJson(json);
}

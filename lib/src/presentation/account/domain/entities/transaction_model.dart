import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@freezed
class TransactionModel with _$TransactionModel {
  const factory TransactionModel({
    @JsonKey(name: "transaction_id") String? transactionId,
    @JsonKey(name: "transaction_type") String? transactionType,
    @JsonKey(name: "transaction_date") DateTime? transactionDate,
    @JsonKey(name: "wallet_id") int? walletId,
    @JsonKey(name: "wallet_from_id") dynamic walletFromId,
    @JsonKey(name: "wallet_to_id") int? walletToId,
    @JsonKey(name: "currency_from") String? currencyFrom,
    @JsonKey(name: "currency_to") String? currencyTo,
    @JsonKey(name: "amount") String? amount,
    @JsonKey(name: "trans_wallet_type") String? transWalletType,
    @JsonKey(name: "trans_wallet_flow") String? transWalletFlow,
    @JsonKey(name: "settlement_status") String? settlementStatus,
    @JsonKey(name: "settled_date") DateTime? settledDate,
    @JsonKey(name: "settlement_approver") String? settlementApprover,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);
}

import 'package:anantla_pay/src/presentation/account/domain/entities/top_up_params.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'top_up_data_provider.g.dart';

@Riverpod(keepAlive: true)
class TopUpDataNotifier extends _$TopUpDataNotifier {
  @override
  TopUpData build() {
    return TopUpData.initial();
  }

  /// Update Wallet ID
  void setWalletId(int id) {
    state = state.copyWith(walletId: id);
  }

  /// Update Amount
  void setAmount(int amount) {
    state = state.copyWith(amount: amount);
  }

  /// Update Currency
  void setCurrency(String currency) {
    state = state.copyWith(currency: currency);
  }

  /// Update Reference ID
  void setReferenceId(String referenceId) {
    state = state.copyWith(referenceId: referenceId);
  }

  /// Reset Data
  void reset() {
    state = TopUpData.initial();
  }
}

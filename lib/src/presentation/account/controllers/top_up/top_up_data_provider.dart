import 'package:anantla_pay/src/presentation/account/domain/entities/top_up_params.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'top_up_data_provider.g.dart';

enum TopUpType { normal, virtualAccount }

@Riverpod(keepAlive: true)
class TopUpDataNotifier extends _$TopUpDataNotifier {
  @override
  TopUpData build() {
    return TopUpData.initial();
  }

  // --- SETTERS ---
  void setTopUpType(TopUpType type) {
    state = state.copyWith(topUpType: type);
  }

  void setWalletId(int id) {
    state = state.copyWith(walletId: id);
  }

  void setAmount(int amount) {
    state = state.copyWith(amount: amount);
  }

  void setCurrency(String currency) {
    state = state.copyWith(currency: currency);
  }

  void setReferenceId(String referenceId) {
    state = state.copyWith(referenceId: referenceId);
  }

  void setVirtualAccountData({
    String? bankCode,
    String? virtualAccountName,
    String? virtualAccountEmail,
    String? virtualAccountPhone,
    int? totalAmount,
    String? currency,
  }) {
    state = state.copyWith(
      bankCode: bankCode ?? state.bankCode,
      virtualAccountName: virtualAccountName ?? state.virtualAccountName,
      virtualAccountEmail: virtualAccountEmail ?? state.virtualAccountEmail,
      virtualAccountPhone: virtualAccountPhone ?? state.virtualAccountPhone,
      totalAmount: totalAmount ?? state.totalAmount,
      currency: currency ?? state.currency,
    );
  }

  // --- REMOVERS ---
  void removeTopUpType() {
    state = state.copyWith(topUpType: TopUpType.normal);
  }

  void removeWalletId() {
    state = state.copyWith(walletId: null);
  }

  void removeAmount() {
    state = state.copyWith(amount: null);
  }

  void removeCurrency() {
    state = state.copyWith(currency: null);
  }

  void removeReferenceId() {
    state = state.copyWith(referenceId: null);
  }

  void removeBankCode() {
    state = state.copyWith(bankCode: null);
  }

  void removeVirtualAccountName() {
    state = state.copyWith(virtualAccountName: null);
  }

  void removeVirtualAccountEmail() {
    state = state.copyWith(virtualAccountEmail: null);
  }

  void removeVirtualAccountPhone() {
    state = state.copyWith(virtualAccountPhone: null);
  }

  void removeTotalAmount() {
    state = state.copyWith(totalAmount: null);
  }

  // --- RESET ALL ---
  void reset() {
    state = TopUpData.initial();
  }
}

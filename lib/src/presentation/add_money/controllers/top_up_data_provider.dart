import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/top_up_params.dart';

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

  void setFromWalletId(int id) {
    state = state.copyWith(fromWalletId: id);
  }

  void setToWalletId(int id) {
    state = state.copyWith(toWalletId: id);
  }

  void setFromAmount(int amount) {
    state = state.copyWith(fromAmount: amount);
  }

  void setToAmount(int amount) {
    state = state.copyWith(toAmount: amount);
  }

  void setTopUpAmount(int amount) {
    state = state.copyWith(topUpAmount: amount);
  }

  void setFromCurrency(String currency) {
    state = state.copyWith(fromCurrency: currency);
  }

  void setToCurrency(String currency) {
    state = state.copyWith(toCurrency: currency);
  }

  void setReferenceId(String referenceId) {
    state = state.copyWith(referenceId: referenceId);
  }

  void setTopUpSource(String source) {
    state = state.copyWith(topUpSource: source);
  }

  void setVirtualAccountData({
    String? bankCode,
    String? virtualAccountName,
    String? virtualAccountEmail,
    String? virtualAccountPhone,
    double? totalAmount,
    double? platformFee,
    double? partnerFee,
    String? currency,
  }) {
    state = state.copyWith(
      bankCode: bankCode ?? state.bankCode,
      virtualAccountName: virtualAccountName ?? state.virtualAccountName,
      virtualAccountEmail: virtualAccountEmail ?? state.virtualAccountEmail,
      virtualAccountPhone: virtualAccountPhone ?? state.virtualAccountPhone,
      totalAmount: totalAmount ?? state.totalAmount,
      platformFee: platformFee ?? state.platformFee,
      partnerFee: partnerFee ?? state.partnerFee,
      // currency: currency ?? state.currency,
    );
  }

  // --- REMOVERS ---
  void removeTopUpType() {
    state = state.copyWith(topUpType: TopUpType.normal);
  }

  void removeFromWalletId() {
    state = state.copyWith(fromWalletId: null);
  }

  void removeToWalletId() {
    state = state.copyWith(toWalletId: null);
  }

  void removeFromAmount() {
    state = state.copyWith(fromAmount: null);
  }

  void removeToAmount() {
    state = state.copyWith(toAmount: null);
  }

  void removeTopUpAmount() {
    state = state.copyWith(topUpAmount: null);
  }

  void removeFromCurrency() {
    state = state.copyWith(fromCurrency: null);
  }

  void removeToCurrency() {
    state = state.copyWith(toCurrency: null);
  }

  void removeReferenceId() {
    state = state.copyWith(referenceId: null);
  }

  void removeTopUpSource() {
    state = state.copyWith(topUpSource: null);
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

class TopUpData {
  final TopUpType topUpType;
  final int? fromWalletId;
  final int? toWalletId;
  final int? fromAmount;
  final int? toAmount;
  final int? topUpAmount;
  final String? fromCurrency;
  final String? toCurrency;
  final String? referenceId;
  final String? topUpSource;

  // Virtual Account fields
  final String? bankCode;
  final String? virtualAccountName;
  final String? virtualAccountPhone;
  final String? virtualAccountEmail;
  final double? totalAmount;
  final double? platformFee;
  final double? partnerFee;

  TopUpData({
    required this.topUpType,
    this.fromWalletId,
    this.toWalletId,
    this.fromAmount,
    this.toAmount,
    this.topUpAmount,
    this.fromCurrency,
    this.toCurrency,
    this.referenceId,
    this.topUpSource,
    this.bankCode,
    this.virtualAccountName,
    this.virtualAccountPhone,
    this.virtualAccountEmail,
    this.totalAmount,
    this.platformFee,
    this.partnerFee,
  });

  /// Initial Empty Data
  factory TopUpData.initial() => TopUpData(topUpType: TopUpType.normal);

  /// Copy Data
  TopUpData copyWith({
    TopUpType? topUpType,
    int? fromWalletId,
    int? toWalletId,
    int? fromAmount,
    int? toAmount,
    int? topUpAmount,
    String? fromCurrency,
    String? toCurrency,
    String? referenceId,
    String? topUpSource,
    String? bankCode,
    String? virtualAccountName,
    String? virtualAccountPhone,
    String? virtualAccountEmail,
    double? totalAmount,
    double? platformFee,
    double? partnerFee,
  }) {
    return TopUpData(
      topUpType: topUpType ?? this.topUpType,
      fromWalletId: fromWalletId ?? this.fromWalletId,
      toWalletId: toWalletId ?? this.toWalletId,
      fromAmount: fromAmount ?? this.fromAmount,
      toAmount: toAmount ?? this.toAmount,
      topUpAmount: topUpAmount ?? this.topUpAmount,
      fromCurrency: fromCurrency ?? this.fromCurrency,
      toCurrency: toCurrency ?? this.toCurrency,
      referenceId: referenceId ?? this.referenceId,
      topUpSource: topUpSource ?? this.topUpSource,
      bankCode: bankCode ?? this.bankCode,
      virtualAccountName: virtualAccountName ?? this.virtualAccountName,
      virtualAccountPhone: virtualAccountPhone ?? this.virtualAccountPhone,
      virtualAccountEmail: virtualAccountEmail ?? this.virtualAccountEmail,
      totalAmount: totalAmount ?? this.totalAmount,
      platformFee: platformFee ?? this.platformFee,
      partnerFee: partnerFee ?? this.partnerFee,
    );
  }

  @override
  String toString() {
    return '''
    Top Up Type: $topUpType
    From Wallet ID: $fromWalletId
    To Wallet ID: $toWalletId
    From Amount: $fromAmount
    To Amount: $toAmount
    Top Up Amount: $topUpAmount
    From Currency: $fromCurrency
    To Currency: $toCurrency
    Reference ID: $referenceId
    Top Up Source: $topUpSource
    Bank Code: $bankCode
    Virtual Account Name: $virtualAccountName
    Virtual Account Phone: $virtualAccountPhone
    Virtual Account Email: $virtualAccountEmail
    Total Amount: $totalAmount
    Platform Fee: $platformFee
    Partner Fee: $partnerFee
    ''';
  }
}

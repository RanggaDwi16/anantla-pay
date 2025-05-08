import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transfer_data_provider.g.dart';

enum TransferType { internal, crossPSP }

@Riverpod(keepAlive: true)
class TransferDataNotifier extends _$TransferDataNotifier {
  @override
  TransferData build() {
    return TransferData.initial();
  }

  // Set Transfer Type
  void setTransferType(TransferType type) {
    state = state.copyWith(transferType: type);
  }

  void setFromWalletId(int id) {
    state = state.copyWith(fromWalletId: id);
  }

  void setToWalletId(int? id) {
    state = state.copyWith(toWalletId: id);
  }

  void setFromBalance(int balance) {
    state = state.copyWith(fromBalance: balance);
  }

  void setToPhone(String phone) {
    state = state.copyWith(toPhone: phone);
  }

  void setFromAmount(int amount) {
    state = state.copyWith(fromAmount: amount);
  }

  void setToAmount(int amount) {
    state = state.copyWith(toAmount: amount);
  }

  void setFromName(String name) {
    state = state.copyWith(fromName: name);
  }

  void setFromEmail(String email) {
    state = state.copyWith(fromEmail: email);
  }

  void setReason(String reason) {
    state = state.copyWith(reason: reason);
  }

  void setToName(String name) {
    state = state.copyWith(toName: name);
  }

  void setToEmail(String email) {
    state = state.copyWith(toEmail: email);
  }

  void setNote(String note) {
    state = state.copyWith(note: note);
  }

  void setFees(String fee) {
    state = state.copyWith(fees: fee);
  }

  void setCurrencies({
    String? fromCurrency,
    String? toCurrency,
  }) {
    state = state.copyWith(
      fromCurrency: fromCurrency ?? state.fromCurrency,
      toCurrency: toCurrency ?? state.toCurrency,
    );
  }

  // New fields for bank transfer
  void setBankName(String bankName) {
    state = state.copyWith(bankName: bankName);
  }

  void setBankCode(String bankCode) {
    state = state.copyWith(bankCode: bankCode);
  }

  void setAmountTransferBank(int amountTransferBank) {
    state = state.copyWith(amountTransferBank: amountTransferBank);
  }

  void setReasonTransferBank(String reasonTransferBank) {
    state = state.copyWith(reasonTransferBank: reasonTransferBank);
  }

  void setVirtualAccountName(String virtualAccountName) {
    state = state.copyWith(virtualAccountName: virtualAccountName);
  }

  void setVirtualAccountPhone(String virtualAccountPhone) {
    state = state.copyWith(virtualAccountPhone: virtualAccountPhone);
  }

  void setVirtualAccountEmail(String virtualAccountEmail) {
    state = state.copyWith(virtualAccountEmail: virtualAccountEmail);
  }

  void reset() {
    state = TransferData.initial();
  }
}

/// **✅ TransferData Model**
class TransferData {
  final TransferType transferType;
  final int? fromWalletId;
  final int? toWalletId;
  final int? fromBalance;
  final int? fromAmount;
  final String? toPhone;
  final int? toAmount;
  final String? fromName;
  final String? fromEmail;
  final String? toName;
  final String? reason;
  final String? toEmail;
  final String? note;
  final String? fees;
  final String? fromCurrency;
  final String? toCurrency;

  // New fields for bank transfer
  final String? bankName;
  final String? bankCode;
  final int? amountTransferBank;
  final String? reasonTransferBank;
  final String? virtualAccountName;
  final String? virtualAccountPhone;
  final String? virtualAccountEmail;

  TransferData({
    required this.transferType,
    this.fromWalletId,
    this.toWalletId,
    this.fromBalance,
    this.fromAmount,
    this.toPhone,
    this.toAmount,
    this.fromName,
    this.fromEmail,
    this.toName,
    this.reason,
    this.toEmail,
    this.note,
    this.fees,
    this.fromCurrency,
    this.toCurrency,
    this.bankName,
    this.bankCode,
    this.amountTransferBank,
    this.reasonTransferBank,
    this.virtualAccountName,
    this.virtualAccountPhone,
    this.virtualAccountEmail,
  });

  /// Initial Empty Data
  factory TransferData.initial() =>
      TransferData(transferType: TransferType.internal);

  /// Copy Data (Immutability)
  TransferData copyWith({
    TransferType? transferType,
    int? fromWalletId,
    int? toWalletId,
    int? fromBalance,
    int? fromAmount,
    String? toPhone,
    int? toAmount,
    String? fromName,
    String? fromEmail,
    String? toName,
    String? toEmail,
    String? reason,
    String? note,
    String? fees,
    String? fromCurrency,
    String? toCurrency,

    // New fields for bank transfer
    String? bankName,
    String? bankCode,
    int? amountTransferBank,
    String? reasonTransferBank,
    String? virtualAccountName,
    String? virtualAccountPhone,
    String? virtualAccountEmail,
  }) {
    return TransferData(
      transferType: transferType ?? this.transferType,
      fromWalletId: fromWalletId ?? this.fromWalletId,
      toWalletId: toWalletId ?? this.toWalletId,
      fromBalance: fromBalance ?? this.fromBalance,
      fromAmount: fromAmount ?? this.fromAmount,
      toPhone: toPhone ?? this.toPhone,
      toAmount: toAmount ?? this.toAmount,
      fromName: fromName ?? this.fromName,
      fromEmail: fromEmail ?? this.fromEmail,
      toName: toName ?? this.toName,
      toEmail: toEmail ?? this.toEmail,
      reason: reason ?? this.reason,
      note: note ?? this.note,
      fees: fees ?? this.fees,
      fromCurrency: fromCurrency ?? this.fromCurrency,
      toCurrency: toCurrency ?? this.toCurrency,

      // New fields for bank transfer
      bankName: bankName ?? this.bankName,
      bankCode: bankCode ?? this.bankCode,
      reasonTransferBank: reasonTransferBank ?? this.reasonTransferBank,
      amountTransferBank: amountTransferBank ?? this.amountTransferBank,
      virtualAccountName: virtualAccountName ?? this.virtualAccountName,
      virtualAccountPhone: virtualAccountPhone ?? this.virtualAccountPhone,
      virtualAccountEmail: virtualAccountEmail ?? this.virtualAccountEmail,
    );
  }

  @override
  String toString() {
    return '''
    Transfer Type: $transferType
    From Wallet ID: $fromWalletId
    To Wallet ID: $toWalletId
    From Balance: $fromBalance
    From Amount: $fromAmount
    To Phone: $toPhone
    To Amount: $toAmount
    From Name: $fromName
    From Email: $fromEmail
    To Name: $toName
    Reason: $reason
    To Email: $toEmail
    Note: $note
    Fees: $fees
    From Currency: $fromCurrency
    To Currency: $toCurrency
    Bank Name: $bankName
    Bank Code: $bankCode
    Amount Transfer Bank: $amountTransferBank
    Reason Transfer Bank: $reasonTransferBank
    Virtual Account Name: $virtualAccountName
    Virtual Account Phone: $virtualAccountPhone
    Virtual Account Email: $virtualAccountEmail
    ''';
  }
}

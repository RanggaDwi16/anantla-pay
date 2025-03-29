import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transfer_data_provider.g.dart';

enum TransferType { internal, crossPSP }

@Riverpod(keepAlive: true)
class TransferDataNotifier extends _$TransferDataNotifier {
  @override
  TransferData build() {
    return TransferData.initial();
  }

  /// Set Transfer Type
  void setTransferType(TransferType type) {
    state = state.copyWith(transferType: type);
  }

  /// Set From Wallet ID
  void setFromWalletId(int id) {
    state = state.copyWith(fromWalletId: id);
  }

  /// Set To Wallet ID
  void setToWalletId(int? id) {
    state = state.copyWith(toWalletId: id);
  }

  /// Set Amount
  void setAmount(int amount) {
    state = state.copyWith(amount: amount);
  }

  /// Set Note
  void setNote(String note) {
    state = state.copyWith(note: note);
  }

  /// ✅ **Fix: Set Currencies (Only for Cross PSP)**
  void setCurrencies({String? fromCurrency, String? toCurrency}) {
    state = state.copyWith(
      fromCurrency: fromCurrency ?? state.fromCurrency,
      toCurrency: toCurrency ?? state.toCurrency,
    );

    // 🔥 Debugging: Cek apakah data berhasil disimpan
    print('Updated TransferData: ${state.toString()}');
  }

  /// Reset Transfer Data
  void reset() {
    state = TransferData.initial();
  }
}

/// **✅ TransferData Model**
class TransferData {
  final TransferType transferType;
  final int? fromWalletId;
  final int? toWalletId;
  final int? amount;
  final String? note;
  final String? fromCurrency;
  final String? toCurrency;

  TransferData({
    required this.transferType,
    this.fromWalletId,
    this.toWalletId,
    this.amount,
    this.note,
    this.fromCurrency,
    this.toCurrency,
  });

  /// Initial Empty Data
  factory TransferData.initial() =>
      TransferData(transferType: TransferType.internal);

  /// Copy Data (Immutability)
  TransferData copyWith({
    TransferType? transferType,
    int? fromWalletId,
    int? toWalletId,
    int? amount,
    String? note,
    String? fromCurrency,
    String? toCurrency,
  }) {
    return TransferData(
      transferType: transferType ?? this.transferType,
      fromWalletId: fromWalletId ?? this.fromWalletId,
      toWalletId: toWalletId ?? this.toWalletId,
      amount: amount ?? this.amount,
      note: note ?? this.note,
      fromCurrency: fromCurrency ?? this.fromCurrency,
      toCurrency: toCurrency ?? this.toCurrency,
    );
  }

  @override
  String toString() {
    return '''
    Transfer Type: $transferType
    From Wallet ID: $fromWalletId
    To Wallet ID: $toWalletId
    Amount: $amount
    Note: $note
    From Currency: $fromCurrency
    To Currency: $toCurrency
    ''';
  }
}

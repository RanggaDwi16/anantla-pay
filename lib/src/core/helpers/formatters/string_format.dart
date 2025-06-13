import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatRupiah(String amount) {
  final parsedAmount = double.tryParse(amount) ?? 0;
  final formatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: '', // Menghilangkan Rp
    decimalDigits: 0, // Ubah ke 2 jika ingin tampilkan ,00
  );
  return formatter.format(parsedAmount).trim();
}

String formatEnglishDate(String isoDate) {
  try {
    final dateTime =
        DateTime.parse(isoDate).toLocal(); // agar sesuai zona waktu lokal
    final formatter = DateFormat("MMM dd, yyyy", "en_US");
    return formatter.format(dateTime);
  } catch (e) {
    return isoDate; // fallback jika parsing gagal
  }
}

String getCurrencyFlagAsset(String? currency) {
  switch (currency) {
    case 'USD':
      return Assets.flags.us.path;
    case 'IDR':
      return Assets.flags.id.path;
    case 'SGD':
      return Assets.flags.sgd.path;
    case 'INR':
      return Assets.flags.inr.path;
    default:
      return Assets.flags.us.path;
  }
}

String getCountryFlagAsset(String? code) {
  switch (code?.toUpperCase()) {
    case 'ID':
      return Assets.flags.id.path;
    case 'US':
      return Assets.flags.us.path;
    case 'SG':
      return Assets.flags.sgd.path;
    case 'IN':
      return Assets.flags.inr.path;
    default:
      return Assets.flags.us.path;
  }
}

String maskWalletCode(String code) {
  final parts = code.split('-');
  if (parts.length < 2) return code;
  return '***${parts.skip(1).join('-')}';
}

String getInitials(String name) {
  if (name.trim().isEmpty) return '';

  final parts = name.trim().split(' ');

  if (parts.length == 1) {
    return parts[0][0].toUpperCase();
  } else {
    return (parts[0][0] + parts[1][0]).toUpperCase();
  }
}

String formatWithThousandSeparator(String value) {
  return value.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match m) => '${m[1]},',
      );
}

Color parseColor(String? hexColor) {
  if (hexColor == null || hexColor.isEmpty) return Colors.grey;
  final hex = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hex', radix: 16));
}

String formatCurrency({
  required num amount,
  required String currencyCode,
  bool isTransferAmount = false,
}) {
  final formatter = NumberFormat.currency(
    locale: _getLocaleByCurrency(currencyCode),
    symbol: '',
    decimalDigits: isTransferAmount ? 2 : 0, // Ubah ke 2 jika perlu koma
  );
  return formatter.format(amount).replaceAll('.', ',');
}

String _getLocaleByCurrency(String currencyCode) {
  switch (currencyCode.toUpperCase()) {
    case 'IDR':
      return 'id_ID';
    case 'USD':
      return 'en_US';
    case 'SGD':
      return 'de_DE';
    case 'INR':
      return 'en_IN';
    default:
      return 'en_US';
  }
}

String _getSymbolByCurrency(String currencyCode) {
  switch (currencyCode.toUpperCase()) {
    case 'IDR':
      return 'Rp';
    case 'USD':
      return '\$';
    case 'SGD':
      return 'S\$';
    case 'INR':
      return '₹';
    default:
      return currencyCode; // fallback
  }
}

String formatTransactionType(String? type) {
  switch (type) {
    case 'TOPUP':
      return 'Top Up';
    case 'WALLET_TRANSFER':
      return 'Wallet Transfer';
    case 'WALLET_RECEIVE':
      return 'Wallet Receive';
    default:
      return type ?? 'Unknown';
  }
}


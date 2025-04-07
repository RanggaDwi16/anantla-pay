import 'package:intl/intl.dart';

String formatByCurrency(String value, String currency) {
  final cleaned = value.replaceAll(RegExp(r'[^0-9]'), '');
  if (cleaned.isEmpty) return getCurrencyHint(currency);

  final number = int.tryParse(cleaned) ?? 0;
  final formatter = NumberFormat.currency(
    symbol: getCurrencySymbol(currency),
    locale: getLocaleByCurrency(currency),
    decimalDigits: currency == 'IDR' ? 0 : 2,
  );
  return formatter.format(number / (currency == 'IDR' ? 1 : 100));
}

String getCurrencyHint(String currency) {
  switch (currency) {
    case 'USD':
      return '\$0.00';
    case 'SGD':
      return 'SGD 0.00';
    case 'IDR':
    default:
      return 'Rp 0';
  }
}

String getCurrencySymbol(String currency) {
  switch (currency) {
    case 'USD':
      return '\$';
    case 'SGD':
      return 'SGD ';
    case 'IDR':
    default:
      return 'Rp ';
  }
}

String getLocaleByCurrency(String currency) {
  switch (currency) {
    case 'USD':
      return 'en_US';
    case 'SGD':
      return 'en_SG';
    case 'IDR':
    default:
      return 'id_ID';
  }
}

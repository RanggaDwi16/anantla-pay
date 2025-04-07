import 'package:anantla_pay/src/core/utils/assets.gen.dart';
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
      return Assets.flags.us.path;
    default:
      return Assets.flags.us.path;
  }
}

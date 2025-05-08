// import 'package:anantla_pay/src/presentation/home/provider/currency_state_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:intl/intl.dart';

// class CurrencyInputField extends ConsumerWidget {
//   const CurrencyInputField({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final currency = ref.watch(fromCurrencyProvider);
//     final rawAmount = ref.watch(fromAmountProvider);
//     final formatted = formatByCurrency(rawAmount, currency);

//     return SizedBox(
//       width: 100,
//       child: TextField(
//         decoration: InputDecoration.collapsed(hintText: getCurrencyHint(currency)),
//         controller: TextEditingController(text: formatted)
//           ..selection = TextSelection.collapsed(offset: formatted.length),
//         keyboardType: TextInputType.number,
//         onChanged: (value) {
//           final cleaned = value.replaceAll(RegExp(r'[^\d]'), '');
//           ref.read(fromAmountProvider.notifier).state = cleaned;
//         },
//         style: const TextStyle(fontWeight: FontWeight.w600),
//       ),
//     );
//   }
// }

// String formatByCurrency(String value, String currency) {
//   final cleaned = value.replaceAll(RegExp(r'[^0-9]'), '');
//   if (cleaned.isEmpty) return getCurrencyHint(currency);

//   final number = int.tryParse(cleaned) ?? 0;
//   final formatter = NumberFormat.currency(
//     symbol: getCurrencySymbol(currency),
//     locale: getLocaleByCurrency(currency),
//     decimalDigits: currency == 'IDR' ? 0 : 2,
//   );
//   return formatter.format(number / (currency == 'IDR' ? 1 : 100));
// }

// String getCurrencyHint(String currency) {
//   switch (currency) {
//     case 'USD':
//       return '\$0.00';
//     case 'SGD':
//       return 'SGD 0.00';
//     case 'IDR':
//     default:
//       return 'Rp 0';
//   }
// }

// String getCurrencySymbol(String currency) {
//   switch (currency) {
//     case 'USD':
//       return '\$';
//     case 'SGD':
//       return 'SGD ';
//     case 'IDR':
//     default:
//       return 'Rp ';
//   }
// }

// String getLocaleByCurrency(String currency) {
//   switch (currency) {
//     case 'USD':
//       return 'en_US';
//     case 'SGD':
//       return 'en_SG';
//     case 'IDR':
//     default:
//       return 'id_ID';
//   }
// }

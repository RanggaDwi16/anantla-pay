import 'package:anantla_pay/src/core/utils/constant/path.dart';
import 'package:flutter/material.dart';

final List<Map<String, dynamic>> historyTransactions = [
  {
    'avatar': Icons.arrow_upward, // Ikon transaksi keluar (debit)
    'name': 'City Bank México',
    'date': '20 Aug, 2024',
    'amount': '- \$1,000 MXN',
    'isCredit': false,
  },
  {
    'avatar': ImagePath.avatar1, // Avatar pengguna lain
    'name': 'Luc S',
    'date': '20 Aug, 2024',
    'amount': '+ \$500 MXN',
    'isCredit': true,
  },
  {
    'avatar': Icons.arrow_upward, // Ikon transaksi keluar
    'name': 'Amazon Purchase',
    'date': '18 Aug, 2024',
    'amount': '- \$250 MXN',
    'isCredit': false,
  },
  {
    'avatar': ImagePath.avatar2, // Avatar pengguna lain
    'name': 'Emily J',
    'date': '17 Aug, 2024',
    'amount': '+ \$1,200 MXN',
    'isCredit': true,
  },
  {
    'avatar': Icons.arrow_downward, // Ikon transaksi masuk
    'name': 'Freelance Payment',
    'date': '15 Aug, 2024',
    'amount': '+ \$3,000 MXN',
    'isCredit': true,
  },
  {
    'avatar': Icons.arrow_upward, // Ikon transaksi keluar
    'name': 'Spotify Subscription',
    'date': '12 Aug, 2024',
    'amount': '- \$99 MXN',
    'isCredit': false,
  },
];

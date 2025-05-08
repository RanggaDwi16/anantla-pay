import 'package:flutter/material.dart';

final List<Map<String, dynamic>> currencies = [
  {
    'code': 'IDR',
    'name': 'Indonesian Rupiah',
    'icon': Icons.attach_money,
    'color': Colors.green,
  },
  {
    'code': 'USD',
    'name': 'US Dollar',
    'icon': Icons.attach_money,
    'color': Colors.green
  },
  {'code': 'EUR', 'name': 'Euro', 'icon': Icons.euro, 'color': Colors.blue},
  {
    'code': 'MXN',
    'name': 'Mexican Peso',
    'icon': Icons.monetization_on,
    'color': Colors.green
  },
  {
    'code': 'TRY',
    'name': 'Turkish Lira',
    'icon': Icons.currency_lira,
    'color': Colors.red
  },
  {
    'code': 'COP',
    'name': 'Colombian Peso',
    'icon': Icons.currency_exchange,
    'color': Colors.green
  },
  {
    'code': 'ARS',
    'name': 'Argentine Peso',
    'icon': Icons.attach_money,
    'color': Colors.orange
  },
  {
    'code': 'SGD',
    'name': 'Singapore Dollar',
    'icon': Icons.attach_money,
    'color': Colors.purple,
  },
];

final Map<String, String> currencySymbols = {
  'IDR': 'Rp',
  'USD': '\$',
  'EUR': '€',
  'MXN': '\$',
  'TRY': '₺',
  'COP': '\$',
  'ARS': '\$',
  'SGD': '\$',
};

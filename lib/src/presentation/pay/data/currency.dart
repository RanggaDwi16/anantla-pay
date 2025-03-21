import 'package:flutter/material.dart';

final List<Map<String, dynamic>> currencies = [
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
];

final Map<String, String> currencySymbols = {
  'USD': '\$',
  'EUR': '€',
  'MXN': '\$',
  'TRY': '₺',
  'COP': '\$',
  'ARS': '\$',
};

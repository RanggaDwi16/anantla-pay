import 'package:flutter_riverpod/flutter_riverpod.dart';

final fromCurrencyTypeProvider = StateProvider<String>((ref) => 'IDR');
final toCurrencyTypeProvider = StateProvider<String>((ref) => 'SGD');

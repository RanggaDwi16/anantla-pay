import 'package:flutter_riverpod/flutter_riverpod.dart';

final registerFormValidProvider = Provider.family<
    bool,
    ({
      String name,
      String email,
      String nomorHp,
    })>((ref, data) {
  return data.name.trim().isNotEmpty &&
      data.email.contains('@') &&
      data.nomorHp.length >= 10;
});

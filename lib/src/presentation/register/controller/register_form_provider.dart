import 'package:flutter_riverpod/flutter_riverpod.dart';

final registerFormValidProvider = Provider.family<bool, ({
  String name,
  String email,
  String password,
  String confirmPassword,
})>((ref, data) {
  return data.name.trim().isNotEmpty &&
      data.email.contains('@') &&
      data.password.length >= 6 &&
      data.password == data.confirmPassword;
});

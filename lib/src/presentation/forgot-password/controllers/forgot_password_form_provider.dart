import 'package:flutter_riverpod/flutter_riverpod.dart';

final forgotPasswordFormValidProvider = Provider.family<
    bool,
    ({
      String email,
    })>((ref, data) {
  return data.email.contains('@') && data.email.contains('.');
});

import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginFormProvider = StateProvider<bool>((ref) => false);

final emailErrorProvider = StateProvider<String?>((ref) => null);
final passwordErrorProvider = StateProvider<String?>((ref) => null);

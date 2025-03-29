import 'package:anantla_pay/src/core/main/controllers/authentication_impl_provider.dart';
import 'package:anantla_pay/src/core/main/domain/usecases/forgot_password.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'forgot_password_provider.g.dart';

@riverpod
ForgotPassword forgotPassword (ForgotPasswordRef ref) {
  return ForgotPassword(authenticationRepository: ref.read(authenticationRepositoryProvider)); 
}
import 'package:anantla_pay/src/core/main/controllers/authentication_impl_provider.dart';
import 'package:anantla_pay/src/core/main/domain/usecases/verifOtpLogin.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'verifOtpLogin_provider.g.dart';

@riverpod
VerifOtpLogin verifOtpLogin (VerifOtpLoginRef ref) {
  return VerifOtpLogin(authenticationRepository: ref.read(authenticationRepositoryProvider));
}
import 'package:anantla_pay/src/core/main/controllers/authentication_impl_provider.dart';
import 'package:anantla_pay/src/core/main/domain/usecases/verifOtp.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'verifOtp_provider.g.dart';

@riverpod
Verifotp verifotp (VerifotpRef ref) {
  return Verifotp(authenticationRepository: ref.read(authenticationRepositoryProvider));
}
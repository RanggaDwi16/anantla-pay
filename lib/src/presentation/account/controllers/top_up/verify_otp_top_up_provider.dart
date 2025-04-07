import 'package:anantla_pay/src/presentation/account/controllers/account_impl_provider.dart';
import 'package:anantla_pay/src/presentation/account/domain/usecases/verif_otp_topup.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'verify_otp_top_up_provider.g.dart';

@riverpod
VerifOtpTopup verifOtpTopup (VerifOtpTopupRef ref) {
  return VerifOtpTopup(accountRepository: ref.watch(accountRepositoryProvider)); 
}
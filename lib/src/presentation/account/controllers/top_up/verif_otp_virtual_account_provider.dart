import 'package:anantla_pay/src/presentation/account/controllers/account_impl_provider.dart';
import 'package:anantla_pay/src/presentation/account/domain/usecases/verif_otp_virtual_account.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'verif_otp_virtual_account_provider.g.dart';

@riverpod
VerifOtpVirtualAccount verifOtpVirtualAccount(VerifOtpVirtualAccountRef ref) {
  return VerifOtpVirtualAccount(
      accountRepository: ref.watch(accountRepositoryProvider));
}

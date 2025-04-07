import 'package:anantla_pay/src/presentation/account/controllers/account_impl_provider.dart';
import 'package:anantla_pay/src/presentation/account/domain/usecases/ekyc_verification.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ekyc_verification_provider.g.dart';

@riverpod
EkycVerification ekycVerification(EkycVerificationRef ref) {
  return EkycVerification(
    accountRepository: ref.watch(accountRepositoryProvider),
  );
}

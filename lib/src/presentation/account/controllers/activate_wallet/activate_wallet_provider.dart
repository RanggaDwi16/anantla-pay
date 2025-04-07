import 'package:anantla_pay/src/presentation/account/controllers/account_impl_provider.dart';
import 'package:anantla_pay/src/presentation/account/domain/usecases/activate_wallet.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'activate_wallet_provider.g.dart';

@riverpod
ActivateWallet  activateWallet(ActivateWalletRef ref) {
  return ActivateWallet(
    accountRepository: ref.watch(accountRepositoryProvider),
  );
}
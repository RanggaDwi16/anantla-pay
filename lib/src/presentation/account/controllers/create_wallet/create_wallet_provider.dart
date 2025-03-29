import 'package:anantla_pay/src/presentation/account/controllers/account_impl_provider.dart';
import 'package:anantla_pay/src/presentation/account/domain/usecases/create_wallet.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_wallet_provider.g.dart';

@riverpod
CreateWallet createWallet (CreateWalletRef ref) {
  return CreateWallet(accountRepository: ref.watch(accountRepositoryProvider));
}
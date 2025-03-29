import 'package:anantla_pay/src/presentation/transfer/controllers/transfer_impl_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/usecases/get_all_wallet.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_all_wallet_provider.g.dart';

@riverpod
GetAllWallet getAllWallet (GetAllWalletRef ref) {
  return GetAllWallet(transferRepository: ref.read(transferRepositoryProvider));
}
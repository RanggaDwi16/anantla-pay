import 'package:anantla_pay/src/presentation/transfer/controllers/get_all_wallet/get_all_wallet_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/entities/wallet_model.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/usecases/get_all_wallet.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_all_wallet_provider.g.dart';

@riverpod
class FetchAllWallet extends _$FetchAllWallet {
  @override
  FutureOr<List<WalletModel?>> build() async {
    GetAllWallet getAllWallet = await ref.read(getAllWalletProvider);
    final result = await getAllWallet.call(null);
    return result.fold(
      (error) => throw Exception(error),
      (wallets) => wallets,
    );
  }
}

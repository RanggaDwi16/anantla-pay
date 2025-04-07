import 'package:anantla_pay/src/presentation/account/controllers/create_wallet/create_wallet_provider.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/create_wallet_params.dart';
import 'package:anantla_pay/src/presentation/account/domain/usecases/create_wallet.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_wallet_provider.g.dart';

@Riverpod(keepAlive: true)
class PostWallet extends _$PostWallet {
  @override
  FutureOr<String?> build() {
    return null;
  }

  Future<void> postWallet({
    required CreateWalletParams params,
    required Function(int walletId) onSuccess,
    required Function(String message) onError,
  }) async {
    state = const AsyncLoading();
    CreateWallet createWallet = await ref.read(createWalletProvider);
    final result = await createWallet.call(CreateWalletParams(
      userId: params.userId,
      // clientId: 25,
      countryCode: params.countryCode,
    ));
    result.fold(
      (error) {
        state = AsyncError(error, StackTrace.current);
        onError(error);
      },
      (walletId) {
        state = AsyncData('$walletId');
        onSuccess(walletId);
      },
    );
  }
}

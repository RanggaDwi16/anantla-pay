import 'package:anantla_pay/src/presentation/account/controllers/activate_wallet/activate_wallet_provider.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/create_wallet_params.dart';
import 'package:anantla_pay/src/presentation/account/domain/usecases/activate_wallet.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_activate_wallet_provider.g.dart';

@Riverpod(keepAlive: true)
class PostActivateWallet extends _$PostActivateWallet {
  @override
  FutureOr<String?> build() {
    return null;
  }

  Future<void> postActivateWallet({
    required ActivateWalletParams params,
    required Function(String message) onSuccess,
    required Function(String message) onError,
  }) async {
    state = const AsyncLoading();
    ActivateWallet activateWallet = await ref.read(activateWalletProvider);
    final result = await activateWallet.call(ActivateWalletParams(
      walletId: params.walletId,
      countryCode: params.countryCode,
    ));
    result.fold(
      (error) {
        state = AsyncError(error, StackTrace.current);
        onError(error);
      },
      (data) {
        state = AsyncData(data);
        onSuccess(data);
      },
    );
  }
}

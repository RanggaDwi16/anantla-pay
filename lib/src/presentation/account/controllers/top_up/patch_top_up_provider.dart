import 'package:anantla_pay/src/presentation/account/controllers/top_up/top_up_provider.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/top_up_params.dart';
import 'package:anantla_pay/src/presentation/account/domain/usecases/top_up.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'patch_top_up_provider.g.dart';

@Riverpod(keepAlive: true)
class PatchTopUp extends _$PatchTopUp {
  @override
  FutureOr<String?> build() {
    return null;
  }

  void patchTouUp({
    required TopupParams topupParams,
    required Function(String message) onError,
    required Function(String message) onSuccess,
  }) async {
    state = const AsyncLoading();
    TopUp topUp = await ref.read(topUpProvider);
    final result = await topUp.call(TopupParams(
      amount: topupParams.amount,
      currency: topupParams.currency,
      referenceId: topupParams.referenceId,
      walletId: topupParams.walletId,
    ));
    result.fold(
      (error) {
        state = AsyncError(error, StackTrace.current);
        onError(error);
      },
      (data) {
        onSuccess(data);
        state = AsyncData('Top Up Success');
      },
    );
  }
}

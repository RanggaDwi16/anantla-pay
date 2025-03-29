import 'package:anantla_pay/src/presentation/transfer/controllers/cross_psp_transfer/cross_psp_transfer_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/entities/transfer_params.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/usecases/cross_psp_transfer.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_cross_psp_transfer_provider.g.dart';

@Riverpod(keepAlive: true)
class PostCrossPspTransfer extends _$PostCrossPspTransfer {
  @override
  FutureOr<String?> build() {
    return null;
  }

  Future<void> postCrossPspTransfer({
    required CrossPspParams params,
    required Function(String message) onSuccess,
    required Function(String message) onError,
  }) async {
    state = const AsyncLoading();
    CrossPspTransfer crossPspTransfer =
        await ref.read(crossPspTransferProvider);
    final result = await crossPspTransfer(CrossPspParams(
      amount: params.amount,
      fromWalletId: params.fromWalletId,
      toWalletId: params.toWalletId,
      note: params.note,
      toCurrency: params.toCurrency,
      fromCurrency: params.fromCurrency,
    ));
    return result.fold(
      (error) {
        state = AsyncError(error, StackTrace.current);
        onError(error);
      },
      (data) {
        onSuccess(data);
        state = AsyncData('Transfer Success');
      },
    );
  }
}

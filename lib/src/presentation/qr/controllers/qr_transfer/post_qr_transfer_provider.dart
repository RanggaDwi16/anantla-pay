import 'package:anantla_pay/src/presentation/qr/controllers/qr_transfer/qr_transfer_provider.dart';
import 'package:anantla_pay/src/presentation/qr/domain/usecases/qr_tranfers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_qr_transfer_provider.g.dart';

@Riverpod(keepAlive: true)
class PostQrTransfer extends _$PostQrTransfer {
  @override
  FutureOr<String?> build() {
    return null;
  }

  Future<void> postQrTransfer({
    required String qrCode,
    required Function(String data) onSuccess,
    required Function(String error) onError,
  }) async {
    state = const AsyncLoading();
    QrTranfers qrTranfers = await ref.read(qrTranfersProvider);
    final result = await qrTranfers.call(QrTranfersParams(qrCode: qrCode));

    result.fold(
      (error) {
        state = AsyncError(error, StackTrace.current);
        onError(error);
      },
      (qr) {
        state = AsyncData(qr);
        onSuccess(qr);
      },
    );
  }
}

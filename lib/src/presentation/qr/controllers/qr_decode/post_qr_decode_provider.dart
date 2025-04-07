import 'package:anantla_pay/src/presentation/qr/controllers/qr_decode/qr_decode_provider.dart';
import 'package:anantla_pay/src/presentation/qr/controllers/qr_impl_provider.dart';
import 'package:anantla_pay/src/presentation/qr/domain/entities/qr_model.dart';
import 'package:anantla_pay/src/presentation/qr/domain/usecases/qr_decode.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_qr_decode_provider.g.dart';

@Riverpod(keepAlive: true)
class PostQrDecode extends _$PostQrDecode {
  @override
  FutureOr<QrModel?> build() {
    return null;
  }

  Future<void> postQrDecode({
    required String qrCode,
    required Function(QrModel data) onSuccess,
    required Function(String error) onError,
  }) async {
    state = const AsyncLoading();
    QrDecode qrDecode = await ref.read(qrDecodeProvider);
    final result = await qrDecode.call(DecodeParams(qrCode: qrCode));

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

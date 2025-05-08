import 'package:anantla_pay/src/presentation/qr/controllers/qr_static_cpm/qr_static_cpm_provider.dart';
import 'package:anantla_pay/src/presentation/qr/domain/entities/qr_model.dart';
import 'package:anantla_pay/src/presentation/qr/domain/usecases/qr_static_cpm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_qr_static_cpm_provider.g.dart';

@riverpod
class FetchQrStaticCpm extends _$FetchQrStaticCpm {
  @override
  FutureOr<TransferQrModel?> build() async {
    QrStaticCpm qrStaticCpm = await ref.read(qrStaticCpmProvider);
    final result = await qrStaticCpm.call(null);

    return result.fold(
      (error) {
        state = AsyncError(error, StackTrace.current);
        return null;
      },
      (qr) {
        state = AsyncData(qr);
        return qr;
      },
    );
  }
}

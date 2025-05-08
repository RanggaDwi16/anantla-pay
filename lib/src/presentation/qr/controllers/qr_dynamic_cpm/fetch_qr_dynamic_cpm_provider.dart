import 'package:anantla_pay/src/presentation/qr/controllers/qr_dynamic_cpm/qr_dynamic_cpm_provider.dart';
import 'package:anantla_pay/src/presentation/qr/domain/entities/qr_model.dart';
import 'package:anantla_pay/src/presentation/qr/domain/usecases/qr_dynamic_cpm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_qr_dynamic_cpm_provider.g.dart';

@riverpod
class FetchQrDynamicCpm extends _$FetchQrDynamicCpm {
  @override
  FutureOr<DynamicCpmModel?> build() {
    return null;
  }

  Future<void> fetchQrDynamicCpm({
    required int amount,
    required String note,
    required Function() onSuccess,
    required Function() onError,
  }) async {
    QrDynamicCpm qrDynamicCpm = ref.watch(qrDynamicCpmProvider);
    final result = await qrDynamicCpm.call(
      DynamicCpmParams(
        amount: amount,
        note: note,
      ),
    );

    result.fold(
      (error) {
        onError();
      },
      (qr) {
        state = AsyncValue.data(qr);
        onSuccess();
      },
    );
  }
}

import 'package:anantla_pay/src/presentation/qr/controllers/qr_impl_provider.dart';
import 'package:anantla_pay/src/presentation/qr/domain/usecases/qr_dynamic_cpm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'qr_dynamic_cpm_provider.g.dart';

@riverpod
QrDynamicCpm qrDynamicCpm(QrDynamicCpmRef ref) {
  return QrDynamicCpm(
    repository: ref.watch(qrRepositoryProvider),
  );
}

import 'package:anantla_pay/src/presentation/qr/controllers/qr_impl_provider.dart';
import 'package:anantla_pay/src/presentation/qr/domain/usecases/qr_static_cpm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'qr_static_cpm_provider.g.dart';

@riverpod
QrStaticCpm qrStaticCpm(QrStaticCpmRef ref) {
  return QrStaticCpm(repository: ref.watch(qrRepositoryProvider));
}

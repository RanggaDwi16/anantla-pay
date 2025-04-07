import 'package:anantla_pay/src/presentation/qr/controllers/qr_impl_provider.dart';
import 'package:anantla_pay/src/presentation/qr/domain/usecases/qr_tranfers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'qr_transfer_provider.g.dart';

@riverpod
QrTranfers qrTranfers (QrTranfersRef ref) {
  return QrTranfers(qrRepository: ref.watch(qrRepositoryProvider));
}
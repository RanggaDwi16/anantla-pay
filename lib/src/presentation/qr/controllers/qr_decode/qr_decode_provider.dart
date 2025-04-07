import 'package:anantla_pay/src/presentation/qr/controllers/qr_impl_provider.dart';
import 'package:anantla_pay/src/presentation/qr/domain/usecases/qr_decode.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'qr_decode_provider.g.dart';

@riverpod
QrDecode qrDecode(QrDecodeRef ref) {
  return QrDecode(qrRepository: ref.watch(qrRepositoryProvider));
}

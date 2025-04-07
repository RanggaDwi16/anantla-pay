import 'package:anantla_pay/src/presentation/qr/domain/entities/qr_model.dart';
import 'package:dartz/dartz.dart';

abstract class QrRepository {
  Future<Either<String, QrModel>> decodeQr({
    required String qrCode,
  });
  Future<Either<String, String>> transferQr({
    required String qrCode,
    TransferQrModel? transferQrModel,
  });
}

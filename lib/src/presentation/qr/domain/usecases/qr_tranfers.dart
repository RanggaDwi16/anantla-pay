import 'package:anantla_pay/src/core/utils/usecase/usecase.dart';
import 'package:anantla_pay/src/presentation/qr/domain/entities/qr_model.dart';
import 'package:anantla_pay/src/presentation/qr/domain/repository/qr_repository.dart';
import 'package:dartz/dartz.dart';

class QrTranfers implements UseCase<String, QrTranfersParams> {
  final QrRepository qrRepository;

  QrTranfers({required this.qrRepository});

  @override
  Future<Either<String, String>> call(QrTranfersParams params) {
    return qrRepository.transferQr(
      qrCode: params.qrCode,
      transferQrModel: params.transferQrModel,
    );
  }
}

class QrTranfersParams {
  final String qrCode;
   TransferQrModel? transferQrModel;

  QrTranfersParams({
    required this.qrCode,
    this.transferQrModel,
  });
}

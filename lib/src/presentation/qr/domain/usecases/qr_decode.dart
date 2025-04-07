import 'package:anantla_pay/src/core/utils/usecase/usecase.dart';
import 'package:anantla_pay/src/presentation/qr/domain/entities/qr_model.dart';
import 'package:anantla_pay/src/presentation/qr/domain/repository/qr_repository.dart';
import 'package:dartz/dartz.dart';

class QrDecode implements UseCase<QrModel, DecodeParams> {
  final QrRepository qrRepository;

  QrDecode({required this.qrRepository});

  @override
  Future<Either<String, QrModel>> call(DecodeParams params) {
    return qrRepository.decodeQr(qrCode: params.qrCode);
  }

  
  
}

class DecodeParams {
  final String qrCode;

  DecodeParams({required this.qrCode}); 
}
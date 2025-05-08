import 'package:anantla_pay/src/core/utils/usecase/usecase.dart';
import 'package:anantla_pay/src/presentation/qr/domain/entities/qr_model.dart';
import 'package:anantla_pay/src/presentation/qr/domain/repository/qr_repository.dart';
import 'package:dartz/dartz.dart';

class QrStaticCpm implements UseCase<TransferQrModel, void >{
  final QrRepository repository;

  const QrStaticCpm({required this.repository});

  @override
  Future<Either<String, TransferQrModel>> call(void params) {
    return repository.staticCpmQr();
  }

  
}
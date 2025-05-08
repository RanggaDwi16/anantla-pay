import 'package:anantla_pay/src/core/utils/usecase/usecase.dart';
import 'package:anantla_pay/src/presentation/qr/domain/entities/qr_model.dart';
import 'package:anantla_pay/src/presentation/qr/domain/repository/qr_repository.dart';
import 'package:dartz/dartz.dart';

class QrDynamicCpm implements UseCase<DynamicCpmModel, DynamicCpmParams> {
  final QrRepository repository;

  const QrDynamicCpm({required this.repository});

  @override
  Future<Either<String, DynamicCpmModel>> call(DynamicCpmParams params) {
    return repository.dynamicCpmQr(
      amount: params.amount,
      note: params.note,
    );
  }
}

class DynamicCpmParams {
  final int amount;
  final String note;

  const DynamicCpmParams({
    required this.amount,
    required this.note,
  });
}

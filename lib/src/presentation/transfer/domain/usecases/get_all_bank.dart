import 'package:anantla_pay/src/core/utils/usecase/usecase.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/entities/bank_model.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/repository/transfer_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllBank implements UseCase<List<BankModel>, void> {
  final TransferRepository transferRepository;

  GetAllBank({required this.transferRepository});

  @override
  Future<Either<String, List<BankModel>>> call(void params) {
    return transferRepository.getAllBank();
  }
}
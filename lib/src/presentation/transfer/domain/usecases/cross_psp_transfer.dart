import 'package:anantla_pay/src/core/utils/usecase/usecase.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/entities/transfer_params.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/repository/transfer_repository.dart';
import 'package:dartz/dartz.dart';

class CrossPspTransfer implements UseCase<String, CrossPspParams> {
  final TransferRepository transferRepository;

  CrossPspTransfer({required this.transferRepository});

  @override
  Future<Either<String, String>> call(CrossPspParams params) {
    return transferRepository.crossPspTransfer(params: params);
  }
}
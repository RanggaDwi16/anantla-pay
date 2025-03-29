import 'package:anantla_pay/src/core/utils/usecase/usecase.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/entities/transfer_params.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/repository/transfer_repository.dart';
import 'package:dartz/dartz.dart';

class InternalTransfer implements UseCase<String, InternalTransferParams> {
  final TransferRepository transferRepository;

  InternalTransfer({required this.transferRepository});

  @override
  Future<Either<String, String>> call(InternalTransferParams params) {
    return transferRepository.internalTransfer(params: params);
  }

  
}
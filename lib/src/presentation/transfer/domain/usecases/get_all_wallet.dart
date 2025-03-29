import 'package:anantla_pay/src/core/utils/usecase/usecase.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/entities/wallet_model.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/repository/transfer_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllWallet implements UseCase<List<WalletModel>, void>{
  final TransferRepository transferRepository;

  GetAllWallet({required this.transferRepository});

  @override
  Future<Either<String, List<WalletModel>>> call(void params) {
    return transferRepository.getAllWallet();
  }

  
}
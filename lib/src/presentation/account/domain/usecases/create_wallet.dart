import 'package:anantla_pay/src/core/utils/usecase/usecase.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/create_wallet_params.dart';
import 'package:anantla_pay/src/presentation/account/domain/repository/account_repository.dart';
import 'package:dartz/dartz.dart';

class CreateWallet implements UseCase<int, CreateWalletParams> {
  final AccountRepository accountRepository;

  CreateWallet({required this.accountRepository});

  @override
  Future<Either<String, int>> call(CreateWalletParams params) {
    return accountRepository.createWallet(
      params: CreateWalletParams(
        userId: params.userId,
        // clientId: params.clientId,
        countryCode: params.countryCode,
        
      ),
    );
  }
}
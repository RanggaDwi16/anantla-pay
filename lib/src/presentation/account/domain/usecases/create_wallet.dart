import 'package:anantla_pay/src/core/utils/usecase/usecase.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/create_wallet_params.dart';
import 'package:anantla_pay/src/presentation/account/domain/repository/account_repository.dart';
import 'package:dartz/dartz.dart';

class CreateWallet implements UseCase<String, CreateWalletParams> {
  final AccountRepository accountRepository;

  CreateWallet({required this.accountRepository});

  @override
  Future<Either<String, String>> call(CreateWalletParams params) {
    return accountRepository.createWallet(
      params: CreateWalletParams(
        userId: params.userId,
        countryCode: params.countryCode,
      ),
    );
  }
}
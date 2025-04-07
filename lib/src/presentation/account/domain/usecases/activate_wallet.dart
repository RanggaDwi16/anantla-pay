import 'package:anantla_pay/src/core/utils/usecase/usecase.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/create_wallet_params.dart';
import 'package:anantla_pay/src/presentation/account/domain/repository/account_repository.dart';
import 'package:dartz/dartz.dart';

class ActivateWallet implements UseCase<String, ActivateWalletParams> {
  final AccountRepository accountRepository;

  ActivateWallet({required this.accountRepository});

  @override
  Future<Either<String, String>> call(ActivateWalletParams params) {
    return accountRepository.activateWallet(
      params: ActivateWalletParams(
        countryCode: params.countryCode,
        walletId: params.walletId,
      ),
    );
  }
}
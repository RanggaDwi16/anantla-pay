import 'package:anantla_pay/src/core/utils/usecase/usecase.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/top_up_params.dart';
import 'package:anantla_pay/src/presentation/account/domain/repository/account_repository.dart';
import 'package:dartz/dartz.dart';

class TopUp implements UseCase<String, TopupParams> {
  final AccountRepository accountRepository;

  TopUp({required this.accountRepository});

  @override
  Future<Either<String, String>> call(TopupParams params) {
    return accountRepository.topUp(
      params: TopupParams(
        amount: params.amount,
        currency: params.currency,
        firebaseToken: params.firebaseToken,
        walletId: params.walletId,
      ),
    );
  }

  
}  
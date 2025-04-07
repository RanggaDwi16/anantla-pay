import 'package:anantla_pay/src/core/utils/usecase/usecase.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/balance_model.dart';
import 'package:anantla_pay/src/presentation/account/domain/repository/account_repository.dart';
import 'package:dartz/dartz.dart';

class GetBalance implements UseCase<List<BalanceModel>, void> {
  final AccountRepository accountRepository;

  GetBalance({required this.accountRepository});

  @override
  Future<Either<String, List<BalanceModel>>> call(void params) {
    return accountRepository.getBalance();
  }


}
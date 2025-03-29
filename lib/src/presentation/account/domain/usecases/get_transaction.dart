import 'package:anantla_pay/src/core/utils/usecase/usecase.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/transaction_model.dart';
import 'package:anantla_pay/src/presentation/account/domain/repository/account_repository.dart';
import 'package:dartz/dartz.dart';

class GetTransaction implements UseCase<List<TransactionModel>, void> {
  final AccountRepository accountRepository;

  GetTransaction({required this.accountRepository});

  @override
  Future<Either<String, List<TransactionModel>>> call(void params) {
    return accountRepository.getTransaction();
  }
}
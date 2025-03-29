import 'package:anantla_pay/src/core/utils/usecase/usecase.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/bank_model.dart';
import 'package:anantla_pay/src/presentation/account/domain/repository/account_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllBank implements UseCase<List<BankModel>, void> {
  final AccountRepository   accountRepository;

  GetAllBank({required this.accountRepository});

  @override
  Future<Either<String, List<BankModel>>> call(void params) {
    return accountRepository.getAllBank();
  }
}
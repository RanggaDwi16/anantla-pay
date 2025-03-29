import 'package:anantla_pay/src/core/utils/usecase/usecase.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/virtual_account_model.dart';
import 'package:anantla_pay/src/presentation/account/domain/repository/account_repository.dart';
import 'package:dartz/dartz.dart';

class GetTokenVirtualAccount implements UseCase<String, void> {
  final AccountRepository accountRepository;

  GetTokenVirtualAccount({required this.accountRepository});

  @override
  Future<Either<String, String>> call(void params) {
    return accountRepository.getTokenVirtualAccount();
  }
}
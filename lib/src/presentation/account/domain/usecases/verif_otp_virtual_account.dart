import 'package:anantla_pay/src/core/utils/usecase/usecase.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/top_up_params.dart';
import 'package:anantla_pay/src/presentation/account/domain/repository/account_repository.dart';
import 'package:dartz/dartz.dart';

class VerifOtpVirtualAccount implements UseCase<String, VirtualAccountParams> {
  final AccountRepository accountRepository;

  VerifOtpVirtualAccount({required this.accountRepository});

  @override
  Future<Either<String, String>> call(VirtualAccountParams params) {
    return accountRepository.verifyOtpVirtualAccount(params: params);
  }
}
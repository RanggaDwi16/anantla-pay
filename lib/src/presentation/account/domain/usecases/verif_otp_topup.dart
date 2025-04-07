import 'package:anantla_pay/src/core/utils/usecase/usecase.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/top_up_params.dart';
import 'package:anantla_pay/src/presentation/account/domain/repository/account_repository.dart';
import 'package:dartz/dartz.dart';

class VerifOtpTopup implements UseCase<String, VerifyOtpTopupParams> {
  final AccountRepository accountRepository;

  VerifOtpTopup({required this.accountRepository});

  @override
  Future<Either<String, String>> call(VerifyOtpTopupParams params) {
    return accountRepository.verifyOtpTopUp(params: params);
  }
}

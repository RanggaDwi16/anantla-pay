import 'package:anantla_pay/src/core/utils/usecase/usecase.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/top_up_params.dart';
import 'package:anantla_pay/src/presentation/account/domain/repository/account_repository.dart';
import 'package:dartz/dartz.dart';

class GetFees implements UseCase<FeeModel, VirtualAccountParams> {
  final AccountRepository accountRepository;

  GetFees({required this.accountRepository});

  @override
  Future<Either<String, FeeModel>> call(VirtualAccountParams params) {
    return accountRepository.getFees(params: params);
  }
}
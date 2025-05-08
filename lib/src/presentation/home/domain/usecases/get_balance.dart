import 'package:anantla_pay/src/core/utils/usecase/usecase.dart';
import 'package:anantla_pay/src/presentation/home/domain/entities/balance_model.dart';
import 'package:anantla_pay/src/presentation/home/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class GetBalance implements UseCase<List<BalanceModel>, void> {
  final HomeRepository homeRepository;

  GetBalance({required this.homeRepository});

  @override
  Future<Either<String, List<BalanceModel>>> call(void params) {
    return homeRepository.getBalance();
  }


}
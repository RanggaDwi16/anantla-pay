import 'package:anantla_pay/src/core/utils/usecase/usecase.dart';
import 'package:anantla_pay/src/presentation/home/domain/entities/transaction_model.dart';
import 'package:anantla_pay/src/presentation/home/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class GetTransaction implements UseCase<List<TransactionModel>, void> {
  final HomeRepository homeRepository;

  GetTransaction({required this.homeRepository});

  @override
  Future<Either<String, List<TransactionModel>>> call(void params) {
    return homeRepository.getTransaction();
  }
}
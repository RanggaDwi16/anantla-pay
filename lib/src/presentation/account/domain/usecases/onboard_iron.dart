import 'package:anantla_pay/src/core/utils/usecase/usecase.dart';
import 'package:anantla_pay/src/presentation/account/domain/repository/account_repository.dart';
import 'package:dartz/dartz.dart';

class OnboardIron implements UseCase<String, OnboardIronParams> {
  final AccountRepository repository;

  OnboardIron({required this.repository});

  @override
  Future<Either<String, String>> call(OnboardIronParams params) {
    return repository.onboardIron(userId: params.userId);
  }

  
}

class OnboardIronParams {
  final int userId;

  OnboardIronParams({required this.userId});
}
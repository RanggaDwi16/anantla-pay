import 'package:anantla_pay/src/core/utils/usecase/usecase.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/repository/transfer_repository.dart';
import 'package:dartz/dartz.dart';

class GetExchangeRate implements UseCase<String, ExhangeRateParams> {
  final TransferRepository repository;

  GetExchangeRate({required this.repository});

  @override
  Future<Either<String, String>> call(ExhangeRateParams params) {
    return repository.getExchangeRate(
      fromCurrency: params.fromCurrency,
      toCurrency: params.toCurrency,
      amount: params.amount,
    );
  }
}

class ExhangeRateParams {
  final String fromCurrency;
  final String toCurrency;
  final String amount;

  ExhangeRateParams({
    required this.fromCurrency,
    required this.toCurrency,
    required this.amount,
  });
}

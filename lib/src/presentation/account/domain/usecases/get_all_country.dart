import 'package:anantla_pay/src/core/utils/usecase/usecase.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/country_model.dart';
import 'package:anantla_pay/src/presentation/account/domain/repository/account_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllCountry implements UseCase<List<CountryModel>, void> {
  final AccountRepository accountRepository;

  GetAllCountry({required this.accountRepository});

  @override
  Future<Either<String, List<CountryModel>>> call(void params) {
    return accountRepository.getAllCountryCode();
  }

  
}
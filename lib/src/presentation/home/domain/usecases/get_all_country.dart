import 'package:anantla_pay/src/core/utils/usecase/usecase.dart';
import 'package:anantla_pay/src/presentation/home/domain/entities/country_model.dart';
import 'package:anantla_pay/src/presentation/home/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllCountry implements UseCase<List<CountryModel>, void> {
  final HomeRepository homeRepository;

  GetAllCountry({required this.homeRepository});

  @override
  Future<Either<String, List<CountryModel>>> call(void params) {
    return homeRepository.getAllCountryCode();
  }
}

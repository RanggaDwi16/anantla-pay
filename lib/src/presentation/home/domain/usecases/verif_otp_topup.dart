import 'package:anantla_pay/src/core/utils/usecase/usecase.dart';
import 'package:anantla_pay/src/presentation/home/domain/entities/top_up_params.dart';
import 'package:anantla_pay/src/presentation/home/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class VerifOtpTopup implements UseCase<String, VerifyOtpTopupParams> {
  final HomeRepository homeRepository;

  VerifOtpTopup({required this.homeRepository});

  @override
  Future<Either<String, String>> call(VerifyOtpTopupParams params) {
    return homeRepository.verifyOtpTopUp(params: params);
  }
}

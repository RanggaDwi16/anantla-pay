import 'package:anantla_pay/src/core/utils/usecase/usecase.dart';
import 'package:anantla_pay/src/presentation/home/domain/entities/top_up_params.dart';
import 'package:anantla_pay/src/presentation/home/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class VerifOtpVirtualAccount implements UseCase<String, VirtualAccountParams> {
  final HomeRepository homeRepository;

  VerifOtpVirtualAccount({required this.homeRepository});

  @override
  Future<Either<String, String>> call(VirtualAccountParams params) {
    return homeRepository.verifyOtpVirtualAccount(params: params);
  }
}
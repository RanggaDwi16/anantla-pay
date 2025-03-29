import 'package:anantla_pay/src/core/main/domain/entities/login_model.dart';
import 'package:anantla_pay/src/core/main/domain/entities/otp_params.dart';
import 'package:anantla_pay/src/core/main/domain/repository/authentication_repository.dart';
import 'package:anantla_pay/src/core/utils/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class Verifotp implements UseCase<LoginModel, OtpParams> {
  final AuthenticationRepository authenticationRepository;

  Verifotp({required this.authenticationRepository});

  @override
  Future<Either<String, LoginModel>> call(OtpParams params) {
    return authenticationRepository.verifOtp(params: params);
  }

  
}
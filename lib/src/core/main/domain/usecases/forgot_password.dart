import 'package:anantla_pay/src/core/main/domain/entities/register_param.dart';
import 'package:anantla_pay/src/core/main/domain/repository/authentication_repository.dart';
import 'package:anantla_pay/src/core/utils/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class ForgotPassword implements UseCase<String, RegisterParams> {
  final AuthenticationRepository authenticationRepository;

  ForgotPassword({required this.authenticationRepository});

  @override
  Future<Either<String, String>> call(RegisterParams params) {
    return authenticationRepository.forgotPassword(params: params);
  }
}
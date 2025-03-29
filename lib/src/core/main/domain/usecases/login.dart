import 'package:anantla_pay/src/core/main/domain/entities/login_model.dart';
import 'package:anantla_pay/src/core/main/domain/repository/authentication_repository.dart';
import 'package:anantla_pay/src/core/utils/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class Login implements UseCase<String, LoginParams> {
  final AuthenticationRepository authenticationRepository;

  Login({required this.authenticationRepository});

  @override
  Future<Either<String, String>> call(LoginParams params) {
    return authenticationRepository.login(
        email: params.email, password: params.password, fcmToken: params.fcmToken);
  }
}

class LoginParams {
  final String email;
  final String password;
  final String fcmToken;

  LoginParams({required this.email, required this.password, required this.fcmToken});
}

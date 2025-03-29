import 'package:anantla_pay/src/core/main/domain/repository/authentication_repository.dart';
import 'package:anantla_pay/src/core/utils/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class Logout implements UseCase<String, void> {
  final AuthenticationRepository authenticationRepository;

  Logout({required this.authenticationRepository});

  @override
  Future<Either<String, String>> call(void params) {
    return authenticationRepository.logout();
  }
}
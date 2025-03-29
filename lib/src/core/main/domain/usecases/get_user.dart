import 'package:anantla_pay/src/core/main/domain/entities/user_model.dart';
import 'package:anantla_pay/src/core/main/domain/repository/authentication_repository.dart';
import 'package:anantla_pay/src/core/utils/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class GetUser implements UseCase<UserModel, GetUserParams> {
  final AuthenticationRepository authenticationRepository;

  GetUser({required this.authenticationRepository});

  @override
  Future<Either<String, UserModel>> call(GetUserParams params) {
    return authenticationRepository.getUser(
      userId: params.userId
    );
  }

  
}

class GetUserParams {
  final int userId;

  GetUserParams({required this.userId});
}
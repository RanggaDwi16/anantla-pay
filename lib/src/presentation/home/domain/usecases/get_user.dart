import 'package:anantla_pay/src/core/main/domain/entities/user_model.dart';
import 'package:anantla_pay/src/core/utils/usecase/usecase.dart';
import 'package:anantla_pay/src/presentation/home/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class GetUser implements UseCase<UserModel, GetUserParams> {
  final HomeRepository homeRepository;

  GetUser({required this.homeRepository});

  @override
  Future<Either<String, UserModel>> call(GetUserParams params) {
    return homeRepository.getUser(userId: params.userId);
  }
}

class GetUserParams {
  final int userId;

  GetUserParams({required this.userId});
}

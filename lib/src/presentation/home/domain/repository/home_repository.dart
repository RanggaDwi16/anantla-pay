import 'package:anantla_pay/src/core/main/domain/entities/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<String, UserModel>> getUser({
    required int userId,
  });
}
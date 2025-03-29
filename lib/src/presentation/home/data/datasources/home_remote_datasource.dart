import 'package:anantla_pay/src/core/main/domain/entities/user_model.dart';
import 'package:anantla_pay/src/core/utils/errors/dio_error.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class HomeRemoteDataSource {
  Future<Either<String, UserModel>> getUser({
    required int userId,
  });
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final Dio httpClient;

  HomeRemoteDataSourceImpl({required this.httpClient});
  
  @override
  Future<Either<String, UserModel>> getUser({required int userId}) async {
    try {
      final response = await httpClient.get('/me');
      if (response.statusCode == 200) {
        final user = response.data['value'];
        return Right(UserModel.fromJson(user));
      } else if (response.statusCode == 401) {
        return Left(response.data['value']['message']);
      } else if (response.statusCode == 404) {
        return Left(response.data['value']['message']);
      } else if (response.statusCode == 500) {
        return Left(response.data['value']['message']);
      } else if (response.statusCode == 400) {
        return Left(response.data['value']['message']);
      } else {
        return const Left("Something went wrong");
      }
    } on DioException catch (e) {
      final error = await DioErrorHandler.handleError(e);
      print('Error: $error');
      return Left(error);
    } catch (e) {
      return Left('Error: $e');
    }
  }

  
}

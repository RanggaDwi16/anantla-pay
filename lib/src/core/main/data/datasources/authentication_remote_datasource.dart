import 'package:anantla_pay/src/core/main/domain/entities/login_model.dart';
import 'package:anantla_pay/src/core/main/domain/entities/otp_params.dart';
import 'package:anantla_pay/src/core/main/domain/entities/register_param.dart';
import 'package:anantla_pay/src/core/main/domain/entities/user_model.dart';
import 'package:anantla_pay/src/core/utils/errors/dio_error.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class AuthenticationRemoteDataSource {
  Future<Either<String, LoginModel>> login({
    required String email,
    required String password,
    required String fcmToken,
  });
  Future<Either<String, String>> register({required RegisterParams params});
  Future<Either<String, LoginModel>> verifOtpLogin({
    required OtpParams params,
  });
  Future<Either<String, UserModel>> getUser({required int userId});
  Future<Either<String, String>> logout();
  Future<Either<String, String>> addWishtList();
  Future<Either<String, String>> forgotPassword({
    required RegisterParams params,
  });
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  final Dio httpClient;
  final Dio adminHttpClient;

  AuthenticationRemoteDataSourceImpl(
      {required this.httpClient, required this.adminHttpClient});

  @override
  Future<Either<String, LoginModel>> login({
    required String email,
    required String password,
    required String fcmToken,
  }) async {
    try {
      final response = await httpClient.post(
        '/users/login',
        data: {
          'usernameoremail': email,
          'password': password,
          'firebase_token': fcmToken,
        },
      );
      if (response.statusCode == 200) {
        final token = response.data['token'];
        final userId = response.data['user']['user_id'];
        final loginModel = LoginModel(
          token: token,
          user: User(userId: userId),
        );
        return Right(loginModel);
      } else if (response.statusCode == 202) {
        return Right(response.data['message']);
      } else if (response.statusCode == 400) {
        return Left(response.data['message']);
      } else if (response.statusCode == 404) {
        return Left(response.data['message']);
      } else if (response.statusCode == 500) {
        return Left(response.data['message']);
      } else if (response.statusCode == 401) {
        return Left(response.data['message']);
      } else {
        return const Left("Something went wrong");
      }
    } on DioException catch (e) {
      final error = e.response?.data['error'] ?? 'Unknown error occurred';
      print('Error: $error');
      return Left(error);
    } catch (e) {
      return Left('Error: $e');
    }
  }

  @override
  Future<Either<String, UserModel>> getUser({required int userId}) async {
    try {
      final response = await httpClient.get('/me');
      if (response.statusCode == 200) {
        final user = response.data;
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
      final error = e.response?.data['error'] ?? 'We encountered an issue';
      print('Error: $error');
      return Left(error);
    } catch (e) {
      return Left('Error: $e');
    }
  }

  @override
  Future<Either<String, String>> register(
      {required RegisterParams params}) async {
    try {
      final response =
          await adminHttpClient.post('/users/register', data: params.toJson());
      if (response.statusCode == 201) {
        return Right(response.data['temp_password']);
      } else if (response.statusCode == 400) {
        return Left(response.data['message']);
      } else {
        return const Left("Something went wrong");
      }
    } on DioException catch (e) {
      final error = e.response?.data['error'] ?? 'Unknown error occurred';
      print('Error: $error');
      return Left(error);
    } catch (e) {
      return Left('Error: $e');
    }
  }

  @override
  Future<Either<String, String>> logout() async {
    try {
      final response = await httpClient.post('/users/logout');
      if (response.statusCode == 200) {
        return Right(response.data['message']);
      } else if (response.statusCode == 401) {
        return Left(response.data['message']);
      } else {
        return const Left("Something went wrong");
      }
    } on DioException catch (e) {
      final error = e.response?.data['error'] ?? 'We encountered an issue';
      print('Error: $error');
      return Left(error);
    } catch (e) {
      return Left('Error: $e');
    }
  }

  @override
  Future<Either<String, String>> forgotPassword(
      {required RegisterParams params}) async {
    try {
      final response = await httpClient.post('/users/forgot-password',
          data: params.toJson());
      if (response.statusCode == 200) {
        return Right(response.data['reset_link']);
      } else if (response.statusCode == 400) {
        return Left(response.data['message']);
      } else {
        return const Left("Something went wrong");
      }
    } on DioException catch (e) {
      final error = e.response?.data['error'] ?? 'We encountered an issue';
      print('Error: $error');
      return Left(error);
    } catch (e) {
      return Left('Error: $e');
    }
  }

  @override
  Future<Either<String, LoginModel>> verifOtpLogin(
      {required OtpParams params}) async {
    try {
      final response =
          await httpClient.post('/users/verifOtp', data: params.toJson());
      if (response.statusCode == 200) {
        final user = response.data;
        return Right(LoginModel.fromJson(user));
      } else if (response.statusCode == 400) {
        return Left(response.data['message']);
      } else {
        return const Left("Something went wrong");
      }
    } on DioException catch (e) {
      final error = e.response?.data['error'] ?? 'We encountered an issue';
      print('Error: $error');
      return Left(error);
    } catch (e) {
      return Left('Error: $e');
    }
  }

  @override
  Future<Either<String, String>> addWishtList() async {
    try {
      final response = await httpClient.get('/lists/wish-list');
      if (response.statusCode == 200) {
        return Right(response.data['message']);
      } else if (response.statusCode == 401) {
        return Left(response.data['message']);
      } else {
        return const Left("Something went wrong");
      }
    } on DioException catch (e) {
      final error = e.response?.data['error'] ?? 'We encountered an issue';
      print('Error: $error');
      return Left(error);
    } catch (e) {
      return Left('Error: $e');
    }
  }
}

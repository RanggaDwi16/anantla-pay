import 'package:anantla_pay/src/core/main/data/datasources/authentication_remote_datasource.dart';
import 'package:anantla_pay/src/core/main/domain/entities/login_model.dart';
import 'package:anantla_pay/src/core/main/domain/entities/otp_params.dart';
import 'package:anantla_pay/src/core/main/domain/entities/register_param.dart';
import 'package:anantla_pay/src/core/main/domain/entities/user_model.dart';
import 'package:anantla_pay/src/core/main/domain/repository/authentication_repository.dart';
import 'package:dartz/dartz.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource remoteDataSource;

  AuthenticationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<String, String>> login({required String email, required String password, required String fcmToken}) async {
    try{
      final result = await remoteDataSource.login(email: email, password: password, fcmToken:  fcmToken);
      return result.fold(
        (error) => Left(error),
        (login) => Right(login),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, UserModel>> getUser({required int userId}) async {
    try{
      final result = await remoteDataSource.getUser(userId: userId);
      return result.fold(
        (error) => Left(error),
        (user) => Right(user),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> logout() async {
    try{
      final result = await remoteDataSource.logout();
      return result.fold(
        (error) => Left(error),
        (message) => Right(message),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> register({required RegisterParams params}) async{
    try{
      final result = await remoteDataSource.register(params: params);
      return result.fold(
        (error) => Left(error),
        (message) => Right(message),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }
  
  @override
  Future<Either<String, String>> forgotPassword({required RegisterParams params}) async{
    try{
      final result = await remoteDataSource.forgotPassword(params: params);
      return result.fold(
        (error) => Left(error),
        (message) => Right(message),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, LoginModel>> verifOtpLogin({required OtpParams params})  async{
    try{
      final result = await remoteDataSource.verifOtpLogin(params: params);
      return result.fold(
        (error) => Left(error),
        (message) => Right(message),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }
  
  @override
  Future<Either<String, String>> addWishtList() async{
    try{
      final result = await remoteDataSource.addWishtList();
      return result.fold(
        (error) => Left(error),
        (message) => Right(message),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  
}
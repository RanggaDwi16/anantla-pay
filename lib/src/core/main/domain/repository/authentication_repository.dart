import 'package:anantla_pay/src/core/main/domain/entities/login_model.dart';
import 'package:anantla_pay/src/core/main/domain/entities/otp_params.dart';
import 'package:anantla_pay/src/core/main/domain/entities/register_param.dart';
import 'package:anantla_pay/src/core/main/domain/entities/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthenticationRepository {
  Future<Either<String, LoginModel>> login(
      {required String email,
      required String password,
      required String fcmToken});
  Future<Either<String, String>> register({required RegisterParams params});
  Future<Either<String, LoginModel>> verifOtpLogin({
    required OtpParams params,
  });
  Future<Either<String, String>> logout();
  Future<Either<String, String>> addWishtList();
  Future<Either<String, UserModel>> getUser({required int userId});
  Future<Either<String, String>> forgotPassword({
    required RegisterParams params,
  });
}

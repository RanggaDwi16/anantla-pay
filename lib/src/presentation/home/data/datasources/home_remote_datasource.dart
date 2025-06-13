import 'package:anantla_pay/src/core/main/domain/entities/user_model.dart';
import 'package:anantla_pay/src/core/utils/errors/dio_error.dart';
import 'package:anantla_pay/src/presentation/home/domain/entities/balance_model.dart';
import 'package:anantla_pay/src/presentation/home/domain/entities/country_model.dart';
import 'package:anantla_pay/src/presentation/home/domain/entities/create_wallet_params.dart';
import 'package:anantla_pay/src/presentation/home/domain/entities/top_up_params.dart';
import 'package:anantla_pay/src/presentation/home/domain/entities/transaction_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class HomeRemoteDataSource {
  Future<Either<String, UserModel>> getUser({
    required int userId,
  });

  Future<Either<String, List<BalanceModel>>> getBalance();
  Future<Either<String, List<CountryModel>>> getAllCountryCode();
  Future<Either<String, String>> topUp({
    required TopupParams params,
  });
  Future<Either<String, String>> verifyOtpTopUp({
    required VerifyOtpTopupParams params,
  });
  Future<Either<String, int>> createWallet(
      {required CreateWalletParams params});

  Future<Either<String, String>> activateWallet({
    required ActivateWalletParams params,
  });
  // Future<Either<String, String>> ekycVerification({
  //   required EKycParams params,
  // });
  Future<Either<String, List<TransactionModel>>> getTransaction();
  Future<Either<String, String>> getTokenVirtualAccount();
  Future<Either<String, String>> topUpVirtualAccount({
    required VirtualAccountParams params,
  });
  Future<Either<String, String>> verifyOtpVirtualAccount({
    required VirtualAccountParams params,
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
      final error = e.response?.data['details'] ?? 'We encountered an issue';
      print('Error: $error');
      return Left(error);
    } catch (e) {
      return Left('Error: $e');
    }
  }

  @override
  Future<Either<String, List<BalanceModel>>> getBalance() async {
    try {
      final response = await httpClient.get('/lists/me');
      if (response.statusCode == 200) {
        final balance = response.data['wallets'];
        return Right(
            (balance as List).map((e) => BalanceModel.fromJson(e)).toList());
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
      final error = e.response?.data['details'] ?? 'We encountered an issue';
      print('Error: $error');
      return Left(error);
    } catch (e) {
      return Left('Error: $e');
    }
  }

  @override
  Future<Either<String, String>> activateWallet(
      {required ActivateWalletParams params}) {
    // TODO: implement activateWallet
    throw UnimplementedError();
  }

  @override
  Future<Either<String, int>> createWallet(
      {required CreateWalletParams params}) {
    // TODO: implement createWallet
    throw UnimplementedError();
  }

  @override
  Future<Either<String, List<CountryModel>>> getAllCountryCode() {
    // TODO: implement getAllCountryCode
    throw UnimplementedError();
  }

  @override
  Future<Either<String, String>> getTokenVirtualAccount() {
    // TODO: implement getTokenVirtualAccount
    throw UnimplementedError();
  }

  @override
  Future<Either<String, List<TransactionModel>>> getTransaction() {
    // TODO: implement getTransaction
    throw UnimplementedError();
  }

  @override
  Future<Either<String, String>> topUp({required TopupParams params}) {
    // TODO: implement topUp
    throw UnimplementedError();
  }

  @override
  Future<Either<String, String>> topUpVirtualAccount(
      {required VirtualAccountParams params}) {
    // TODO: implement topUpVirtualAccount
    throw UnimplementedError();
  }

  @override
  Future<Either<String, String>> verifyOtpTopUp(
      {required VerifyOtpTopupParams params}) {
    // TODO: implement verifyOtpTopUp
    throw UnimplementedError();
  }

  @override
  Future<Either<String, String>> verifyOtpVirtualAccount(
      {required VirtualAccountParams params}) {
    // TODO: implement verifyOtpVirtualAccount
    throw UnimplementedError();
  }
}

import 'package:anantla_pay/src/core/utils/errors/dio_error.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/balance_model.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/bank_model.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/create_wallet_params.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/top_up_params.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/transaction_model.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/virtual_account_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class AccountRemoteDataSource {
  Future<Either<String, BalanceModel>> getBalance();
  Future<Either<String, List<BankModel>>> getAllBank();
  Future<Either<String, String>> topUp({
    required TopupParams params,
  });
  Future<Either<String, String>> createWallet(
      {required CreateWalletParams params});
  Future<Either<String, List<TransactionModel>>> getTransaction();
  Future<Either<String, String>> getTokenVirtualAccount();
}

class AccountRemoteDataSourceImpl implements AccountRemoteDataSource {
  final Dio httpClient;
  final Dio virtualHttpClient;

  AccountRemoteDataSourceImpl(
      {required this.httpClient, required this.virtualHttpClient});

  @override
  Future<Either<String, BalanceModel>> getBalance() async {
    try {
      final response = await httpClient.get('/wallet');
      if (response.statusCode == 200) {
        final balance = response.data;
        return Right(BalanceModel.fromJson(balance));
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

  @override
  Future<Either<String, String>> topUp({required TopupParams params}) async {
    try {
      final response = await httpClient.post('/topup', data: params.toJson());
      if (response.statusCode == 201) {
        return Right(response.data['message']);
      } else if (response.statusCode == 401) {
        return Left(response.data['value']['error']);
      } else if (response.statusCode == 404) {
        return Left(response.data['value']['error']);
      } else if (response.statusCode == 500) {
        return Left(response.data['value']['error']);
      } else if (response.statusCode == 400) {
        return Left(response.data['value']['error']);
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

  @override
  Future<Either<String, String>> createWallet(
      {required CreateWalletParams params}) async {
    try {
      final response =
          await httpClient.post('/create-wallet', data: params.toJson());

      if (response.statusCode == 201) {
        return Right(response.data['value']['message']);
      } else if (response.statusCode == 400) {
        return Left(response.data['value']['error']);
      } else if (response.statusCode == 401) {
        return Left(response.data['value']['error']);
      } else if (response.statusCode == 404) {
        return Left(response.data['value']['error']);
      } else if (response.statusCode == 500) {
        return Left(response.data['value']['error']);
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

  @override
  Future<Either<String, List<TransactionModel>>> getTransaction() async {
    try {
      final response = await httpClient.get('/transactions');
      if (response.statusCode == 200) {
        final transactions = response.data['transactions'];
        return Right((transactions as List)
            .map((e) => TransactionModel.fromJson(e))
            .toList());
      } else if (response.statusCode == 401) {
        return Left(response.data['value']['error']);
      } else if (response.statusCode == 404) {
        return Left(response.data['value']['error']);
      } else if (response.statusCode == 500) {
        return Left(response.data['value']['error']);
      } else if (response.statusCode == 400) {
        return Left(response.data['value']['error']);
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

  @override
  Future<Either<String, String>> getTokenVirtualAccount() async {
    try {
      final response = await virtualHttpClient.get('/sd/token');
      if (response.statusCode == 200) {
        final virtualAccount = response.data['data']['accessToken'];
        return Right(virtualAccount);
      } else if (response.statusCode == 401) {
        return Left(response.data['value']['error']);
      } else if (response.statusCode == 404) {
        return Left(response.data['value']['error']);
      } else if (response.statusCode == 500) {
        return Left(response.data['value']['error']);
      } else if (response.statusCode == 400) {
        return Left(response.data['value']['error']);
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

  @override
  Future<Either<String, List<BankModel>>> getAllBank() async {
    try {
      final response = await httpClient.get('/lists/banklist');
      if (response.statusCode == 200) {
        final banks = response.data['banks'];
        return Right(
            (banks as List).map((e) => BankModel.fromJson(e)).toList());
      } else if (response.statusCode == 401) {
        return Left(response.data['value']['error']);
      } else if (response.statusCode == 404) {
        return Left(response.data['value']['error']);
      } else if (response.statusCode == 500) {
        return Left(response.data['value']['error']);
      } else if (response.statusCode == 400) {
        return Left(response.data['value']['error']);
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

import 'package:anantla_pay/src/core/utils/errors/dio_error.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/balance_model.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/bank_model.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/country_model.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/create_wallet_params.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/top_up_params.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/transaction_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class AccountRemoteDataSource {
  Future<Either<String, List<BalanceModel>>> getBalance();
  Future<Either<String, List<BankModel>>> getAllBank();
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
  Future<Either<String, String>> ekycVerification({
    required EKycParams params,
  });
  Future<Either<String, List<TransactionModel>>> getTransaction();
  Future<Either<String, String>> getTokenVirtualAccount();
  Future<Either<String, FeeModel>> getFees({
    required VirtualAccountParams params,
  });
  Future<Either<String, String>> topUpVirtualAccount({
    required VirtualAccountParams params,
  });
  Future<Either<String, String>> verifyOtpVirtualAccount({
    required VirtualAccountParams params,
  });
  Future<Either<String, String>> onboardIron({
    required int userId,
  });
}

class AccountRemoteDataSourceImpl implements AccountRemoteDataSource {
  final Dio httpClient;
  final Dio virtualHttpClient;
  final Dio adminHttpClient;

  AccountRemoteDataSourceImpl(
      {required this.httpClient,
      required this.virtualHttpClient,
      required this.adminHttpClient});

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
  Future<Either<String, String>> topUp({required TopupParams params}) async {
    try {
      final response = await httpClient.post('/topup', data: params.toJson());
      if (response.statusCode == 202) {
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
      final error = e.response?.data['details'] ?? 'We encountered an issue';
      print('Error: $error');
      return Left(error);
    } catch (e) {
      return Left('Error: $e');
    }
  }

  @override
  Future<Either<String, String>> verifyOtpTopUp(
      {required VerifyOtpTopupParams params}) async {
    try {
      final response = await httpClient.post('topup', data: params.toJson());
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
      final error = e.response?.data['details'] ?? 'We encountered an issue';
      print('Error: $error');
      return Left(error);
    } catch (e) {
      return Left('Error: $e');
    }
  }

  @override
  Future<Either<String, int>> createWallet(
      {required CreateWalletParams params}) async {
    try {
      final response =
          await adminHttpClient.post('/create-wallet', data: params.toJson());

      if (response.statusCode == 201) {
        return Right(response.data['wallet_id']);
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
      final error = e.response?.data['details'] ?? 'We encountered an issue';
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
      final error = e.response?.data['details'] ?? 'We encountered an issue';
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
      final error = e.response?.data['details'] ?? 'We encountered an issue';
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
      final error = e.response?.data['details'] ?? 'We encountered an issue';
      print('Error: $error');
      return Left(error);
    } catch (e) {
      return Left('Error: $e');
    }
  }

  @override
  Future<Either<String, String>> topUpVirtualAccount(
      {required VirtualAccountParams params}) async {
    try {
      final response =
          await httpClient.post('/dokuVAtopup', data: params.toJson());
      if (response.statusCode == 200) {
        return Right(response.data['data']['virtualAccountData']['trxId']);
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
      final error = e.response?.data['details'] ?? 'We encountered an issue';
      print('Error: $error');
      return Left(error);
    } catch (e) {
      return Left('Error: $e');
    }
  }

  @override
  Future<Either<String, String>> verifyOtpVirtualAccount(
      {required VirtualAccountParams params}) async {
    try {
      final response =
          await httpClient.post('/dokuVAcallback', data: params.toJson());
      if (response.statusCode == 200) {
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
      final error = e.response?.data['details'] ?? 'We encountered an issue';
      print('Error: $error');
      return Left(error);
    } catch (e) {
      return Left('Error: $e');
    }
  }

  @override
  Future<Either<String, List<CountryModel>>> getAllCountryCode() async {
    try {
      final response = await httpClient.get('/lists/countries');
      if (response.statusCode == 200) {
        final countries = response.data['countries'];
        return Right(
            (countries as List).map((e) => CountryModel.fromJson(e)).toList());
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
      final error = e.response?.data['details'] ?? 'We encountered an issue';
      print('Error: $error');
      return Left(error);
    } catch (e) {
      return Left('Error: $e');
    }
  }

  @override
  Future<Either<String, String>> activateWallet(
      {required ActivateWalletParams params}) async {
    try {
      final response =
          await httpClient.post('/activate-wallet', data: params.toJson());
      if (response.statusCode == 200) {
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
      final error = e.response?.data['details'] ?? 'We encountered an issue';
      print('Error: $error');
      return Left(error);
    } catch (e) {
      return Left('Error: $e');
    }
  }

  @override
  Future<Either<String, String>> ekycVerification(
      {required EKycParams params}) async {
    try {
      final response = await httpClient.post('/e-kyc', data: params.toJson());
      if (response.statusCode == 200) {
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
      final error = e.response?.data['details'] ?? 'We encountered an issue';
      print('Error: $error');
      return Left(error);
      
    } catch (e) {
      return Left('Error: $e');
    }
  }

  @override
  Future<Either<String, FeeModel>> getFees(
      {required VirtualAccountParams params}) async {
    try {
      final response =
          await httpClient.post('/onramp_quotes', data: params.toJson());
      if (response.statusCode == 200) {
        final fee = response.data;
        return Right(FeeModel.fromJson(fee));
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
      final error =
          e.response?.data['details']['error'] ?? 'We encountered an issue';
      print('Error: $error');
      return Left(error);
    } catch (e) {
      return Left('Error: $e');
    }
  }
  
  @override
  Future<Either<String, String>> onboardIron({required int userId}) async {
    try{
      final response = await virtualHttpClient.post('/iron/onboard', data: {'user_id': userId});
      if (response.statusCode == 200) {
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
    }on DioException catch (e) {
      final error =
          e.response?.data['details']['error'] ?? 'We encountered an issue';
      print('Error: $error');
      return Left(error);
    } catch (e) {
      return Left('Error: $e');
    }
  }
}

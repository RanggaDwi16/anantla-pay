import 'package:anantla_pay/src/core/utils/errors/dio_error.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/entities/bank_model.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/entities/transfer_params.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/entities/wallet_model.dart';
import 'package:dartz/dartz.dart';

import 'package:dio/dio.dart';

abstract class TransferRemoteDataSource {
  Future<Either<String, String>> internalTransfer({
    required InternalTransferParams params,
  });
  Future<Either<String, String>> crossPspTransfer({
    required CrossPspParams params,
  });

  Future<Either<String, List<WalletModel>>> getAllWallet();
  Future<Either<String, List<BankModel>>> getAllBank();

  Future<Either<String, String>> getExchangeRate({
    required String fromCurrency,
    required String toCurrency,
    required String amount,
  });
}

class TransferRemoteDataSourceImpl implements TransferRemoteDataSource {
  final Dio httpClient;

  TransferRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<Either<String, String>> internalTransfer(
      {required InternalTransferParams params}) async {
    try {
      final response = await httpClient.post('/wallet-transfer/internal',
          data: params.toJson());

      if (response.statusCode == 200) {
        return Right(response.data['message']);
      } else if (response.statusCode == 202) {
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
      final error =
          e.response?.data['details']['message'] ?? 'We encountered an issue';
      print('Error: $error');
      return Left(error);
    } catch (e) {
      return Left('Error: $e');
    }
  }

  @override
  Future<Either<String, String>> crossPspTransfer(
      {required CrossPspParams params}) async {
    try {
      final response = await httpClient.post('/wallet-transfer/cross-psp',
          data: params.toJson());
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
  Future<Either<String, List<WalletModel>>> getAllWallet() async {
    try {
      final response = await httpClient.get('/lists/walletlist');
      if (response.statusCode == 200) {
        final wallets = response.data['wallets'];
        return Right((wallets as List)
            .map((wallet) => WalletModel.fromJson(wallet))
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
  Future<Either<String, String>> getExchangeRate(
      {required String fromCurrency,
      required String toCurrency,
      required String amount}) async {
    try {
      final response = await httpClient
          .get('/exchange?from=$fromCurrency&to=$toCurrency&amount=$amount');
      if (response.statusCode == 200) {
        return Right(response.data['converted_amount'].toString());
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
}

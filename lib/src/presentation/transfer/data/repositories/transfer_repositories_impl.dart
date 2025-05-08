import 'package:anantla_pay/src/presentation/transfer/data/datasources/transfer_remote_datasource.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/entities/bank_model.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/entities/transfer_params.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/entities/wallet_model.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/repository/transfer_repository.dart';
import 'package:dartz/dartz.dart';

class TransferRepositoriesImpl implements TransferRepository {
  final TransferRemoteDataSource remoteDataSource;

  TransferRepositoriesImpl({required this.remoteDataSource});

  @override
  Future<Either<String, String>> internalTransfer(
      {required InternalTransferParams params}) async {
    try {
      final result = await remoteDataSource.internalTransfer(params: params);
      return result.fold(
        (error) => Left(error),
        (message) => Right(message),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> crossPspTransfer(
      {required CrossPspParams params}) async {
    try {
      final result = await remoteDataSource.crossPspTransfer(params: params);
      return result.fold(
        (error) => Left(error),
        (message) => Right(message),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<WalletModel>>> getAllWallet() async {
    try {
      final result = await remoteDataSource.getAllWallet();
      return result.fold(
        (error) => Left(error),
        (wallet) => Right(wallet),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> getExchangeRate(
      {required String fromCurrency,
      required String toCurrency,
      required String amount}) async{
    try { 
      final result = await remoteDataSource.getExchangeRate(
        fromCurrency: fromCurrency,
        toCurrency: toCurrency,
        amount: amount,
      );
      return result.fold(
        (error) => Left(error),
        (exchangeRate) => Right(exchangeRate),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<BankModel>>> getAllBank() async{
    try {
      final result = await remoteDataSource.getAllBank();
      return result.fold(
        (error) => Left(error),
        (bank) => Right(bank),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }
}

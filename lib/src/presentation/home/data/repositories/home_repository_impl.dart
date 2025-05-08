import 'package:anantla_pay/src/core/main/domain/entities/user_model.dart';
import 'package:anantla_pay/src/presentation/home/domain/entities/country_model.dart';
import 'package:anantla_pay/src/presentation/home/domain/entities/balance_model.dart';
import 'package:anantla_pay/src/presentation/home/data/datasources/home_remote_datasource.dart';
import 'package:anantla_pay/src/presentation/home/domain/entities/create_wallet_params.dart';
import 'package:anantla_pay/src/presentation/home/domain/entities/top_up_params.dart';
import 'package:anantla_pay/src/presentation/home/domain/entities/transaction_model.dart';
import 'package:anantla_pay/src/presentation/home/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<String, UserModel>> getUser({required int userId}) async{
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
  Future<Either<String, List<BalanceModel>>> getBalance() async {
    try {
      final result = await remoteDataSource.getBalance();
      return result.fold(
        (error) => Left(error),
        (balance) => Right(balance),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, int>> createWallet({required CreateWalletParams params})async {
    try {
      final result = await remoteDataSource.createWallet(params: params);
      return result.fold(
        (error) => Left(error),
        (walletId) => Right(walletId),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<CountryModel>>> getAllCountryCode()async {
    try {
      final result = await remoteDataSource.getAllCountryCode();
      return result.fold(
        (error) => Left(error),
        (countryCodes) => Right(countryCodes),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<TransactionModel>>> getTransaction() async {
    try {
      final result = await remoteDataSource.getTransaction();
      return result.fold(
        (error) => Left(error),
        (transactions) => Right(transactions),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> topUp({required TopupParams params}) async {
    try {
      final result = await remoteDataSource.topUp(params: params);
      return result.fold(
        (error) => Left(error),
        (message) => Right(message),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> topUpVirtualAccount({required VirtualAccountParams params}) async {
    try {
      final result = await remoteDataSource.topUpVirtualAccount(params: params);
      return result.fold(
        (error) => Left(error),
        (message) => Right(message),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> verifyOtpTopUp({required VerifyOtpTopupParams params}) async{
    try {
      final result = await remoteDataSource.verifyOtpTopUp(params: params);
      return result.fold(
        (error) => Left(error),
        (message) => Right(message),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> verifyOtpVirtualAccount({required VirtualAccountParams params}) async{
    try {
      final result = await remoteDataSource.verifyOtpVirtualAccount(params: params);
      return result.fold(
        (error) => Left(error),
        (message) => Right(message),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  
}
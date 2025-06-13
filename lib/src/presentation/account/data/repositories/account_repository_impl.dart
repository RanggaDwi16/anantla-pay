import 'package:anantla_pay/src/presentation/account/data/datasource/account_remote_datasource.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/balance_model.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/bank_model.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/country_model.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/create_wallet_params.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/top_up_params.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/transaction_model.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/virtual_account_model.dart';
import 'package:anantla_pay/src/presentation/account/domain/repository/account_repository.dart';
import 'package:dartz/dartz.dart';

class AccountRepositoryImpl implements AccountRepository {
  final AccountRemoteDataSource remoteDataSource;

  AccountRepositoryImpl({required this.remoteDataSource});

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
  Future<Either<String, int>> createWallet(
      {required CreateWalletParams params}) async {
    try {
      final result = await remoteDataSource.createWallet(params: params);
      return result.fold(
        (error) => Left(error),
        (message) => Right(message),
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
        (transaction) => Right(transaction),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> getTokenVirtualAccount() async {
    try {
      final result = await remoteDataSource.getTokenVirtualAccount();
      return result.fold(
        (error) => Left(error),
        (virtualAccount) => Right(virtualAccount),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<BankModel>>> getAllBank() async {
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

  @override
  Future<Either<String, String>> verifyOtpTopUp(
      {required VerifyOtpTopupParams params}) async {
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
  Future<Either<String, String>> topUpVirtualAccount(
      {required VirtualAccountParams params}) async {
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
  Future<Either<String, String>> verifyOtpVirtualAccount(
      {required VirtualAccountParams params}) async {
    try {
      final result =
          await remoteDataSource.verifyOtpVirtualAccount(params: params);
      return result.fold(
        (error) => Left(error),
        (message) => Right(message),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<CountryModel>>> getAllCountryCode() async {
    try {
      final result = await remoteDataSource.getAllCountryCode();
      return result.fold(
        (error) => Left(error),
        (country) => Right(country),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }
  
  @override
  Future<Either<String, String>> activateWallet({required ActivateWalletParams params}) async{
    try {
      final result = await remoteDataSource.activateWallet(params: params);
      return result.fold(
        (error) => Left(error),
        (message) => Right(message),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }
  
  @override
  Future<Either<String, String>> eKycVerification({required EKycParams params}) async{
    try {
      final result = await remoteDataSource.ekycVerification(params: params);
      return result.fold(
        (error) => Left(error),
        (message) => Right(message),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }
  
  @override
  Future<Either<String, FeeModel>> getFees({required VirtualAccountParams params})  async{
    try {
      final result = await remoteDataSource.getFees(params: params);
      return result.fold(
        (error) => Left(error),
        (message) => Right(message),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }
  
  @override
  Future<Either<String, String>> onboardIron({required int userId}) async{
    try {
      final result = await remoteDataSource.onboardIron(userId: userId);
      return result.fold(
        (error) => Left(error),
        (message) => Right(message),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }
}

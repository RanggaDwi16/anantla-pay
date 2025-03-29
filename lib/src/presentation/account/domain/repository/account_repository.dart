import 'package:anantla_pay/src/presentation/account/domain/entities/balance_model.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/bank_model.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/create_wallet_params.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/top_up_params.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/transaction_model.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/virtual_account_model.dart';
import 'package:dartz/dartz.dart';

abstract class AccountRepository {
  Future<Either<String, BalanceModel>> getBalance();
  Future<Either<String,List<BankModel>>> getAllBank();
  Future<Either<String, String>> topUp({
    required TopupParams params,
  });
  Future<Either<String, List<TransactionModel>>> getTransaction();
  Future<Either<String, String>> createWallet({
    required CreateWalletParams params,
  });
  Future<Either<String, String>> getTokenVirtualAccount();
  // Future<Either<String, String>> createVirtualAccount({
  //   required 
  // })
}
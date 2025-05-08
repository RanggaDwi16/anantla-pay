import 'package:anantla_pay/src/core/main/domain/entities/user_model.dart';
import 'package:anantla_pay/src/presentation/home/domain/entities/country_model.dart';
import 'package:anantla_pay/src/presentation/home/domain/entities/balance_model.dart';
import 'package:anantla_pay/src/presentation/home/domain/entities/create_wallet_params.dart';
import 'package:anantla_pay/src/presentation/home/domain/entities/top_up_params.dart';
import 'package:anantla_pay/src/presentation/home/domain/entities/transaction_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<String, UserModel>> getUser({
    required int userId,
  });

  Future<Either<String, List<BalanceModel>>> getBalance();
  Future<Either<String, String>> topUp({
    required TopupParams params,
  });

  Future<Either<String, String>> verifyOtpTopUp({
    required VerifyOtpTopupParams params,
  });

  Future<Either<String, List<TransactionModel>>> getTransaction();
  Future<Either<String, int>> createWallet({
    required CreateWalletParams params,
  });
  Future<Either<String, String>> topUpVirtualAccount({
    required VirtualAccountParams params,
  });
  Future<Either<String, String>> verifyOtpVirtualAccount({
    required VirtualAccountParams params,
  });
  Future<Either<String, List<CountryModel>>> getAllCountryCode();
}

import 'package:anantla_pay/src/presentation/transfer/domain/entities/bank_model.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/entities/transfer_params.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/entities/wallet_model.dart';
import 'package:dartz/dartz.dart';

abstract class TransferRepository {
  Future<Either<String, String>> internalTransfer(
      {required InternalTransferParams params});
  Future<Either<String, String>> crossPspTransfer(
      {required CrossPspParams params});
  Future<Either<String, List<WalletModel>>> getAllWallet();
  Future<Either<String, List<BankModel>>> getAllBank();

  //ONLY IDR TO SGD
  Future<Either<String, String>> getExchangeRate({
    required String fromCurrency,
    required String toCurrency,
    required String amount,
  });
}

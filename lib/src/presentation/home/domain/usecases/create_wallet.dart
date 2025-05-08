import 'package:anantla_pay/src/core/utils/usecase/usecase.dart';
import 'package:anantla_pay/src/presentation/home/domain/entities/create_wallet_params.dart';
import 'package:anantla_pay/src/presentation/account/domain/repository/account_repository.dart';
import 'package:anantla_pay/src/presentation/home/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class CreateWallet implements UseCase<int, CreateWalletParams> {
  final HomeRepository homeRepository;

  CreateWallet({required this.homeRepository});

  @override
  Future<Either<String, int>> call(CreateWalletParams params) {
    return homeRepository.createWallet(
      params: CreateWalletParams(
        userId: params.userId,
        // clientId: params.clientId,
        countryCode: params.countryCode,
        
      ),
    );
  }
}
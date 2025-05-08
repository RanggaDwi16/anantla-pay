import 'package:anantla_pay/src/core/utils/usecase/usecase.dart';
import 'package:anantla_pay/src/presentation/home/domain/entities/top_up_params.dart';
import 'package:anantla_pay/src/presentation/home/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class TopUp implements UseCase<String, TopupParams> {
  final HomeRepository homeRepository;

  TopUp({required this.homeRepository});

  @override
  Future<Either<String, String>> call(TopupParams params) {
    return homeRepository.topUp(
      params: TopupParams(
        amount: params.amount,
        currency: params.currency,
        firebaseToken: params.firebaseToken,
        walletId: params.walletId,
      ),
    );
  }

  
}  
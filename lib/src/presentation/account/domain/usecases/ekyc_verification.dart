import 'package:anantla_pay/src/core/utils/usecase/usecase.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/create_wallet_params.dart';
import 'package:anantla_pay/src/presentation/account/domain/repository/account_repository.dart';
import 'package:dartz/dartz.dart';

class EkycVerification implements UseCase<String, EKycParams> {
  final AccountRepository accountRepository;

  EkycVerification({required this.accountRepository});

  @override
  Future<Either<String, String>> call(EKycParams params) {
    return accountRepository.eKycVerification(params: EKycParams(
      clientId: params.clientId,
      countryCode: params.countryCode,
      userId: params.userId,
      kycData: KycData(
        fullName: params.kycData!.fullName,
        birthDate: params.kycData!.birthDate,
        idNumber: params.kycData!.idNumber,
        attachments: params.kycData!.attachments,

      )
    ));
  }
}

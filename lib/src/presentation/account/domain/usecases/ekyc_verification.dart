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
        firstName: params.kycData!.firstName,
        lastName: params.kycData!.lastName,
        dob: params.kycData!.dob,
        taxId: params.kycData!.taxId,
        kycType: params.kycData!.kycType,
        address: KycAddress(
          line1: params.kycData!.address!.line1,
          line2: params.kycData!.address!.line2,
          city: params.kycData!.address!.city,
          state: params.kycData!.address!.state,
          country: params.kycData!.address!.country,
          postalCode: params.kycData!.address!.postalCode,
        ),

      )
    ));
  }
}

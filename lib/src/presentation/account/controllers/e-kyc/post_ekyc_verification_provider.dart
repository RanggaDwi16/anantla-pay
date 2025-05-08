import 'package:anantla_pay/src/presentation/account/controllers/e-kyc/ekyc_verification_provider.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/create_wallet_params.dart';
import 'package:anantla_pay/src/presentation/account/domain/usecases/ekyc_verification.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_ekyc_verification_provider.g.dart';

@Riverpod(keepAlive: true)
class PostEkycVerification extends _$PostEkycVerification {
  @override
  FutureOr<String?> build() {
    return null;
  }

  Future<void> eKycVerification({
    required EKycParams params,
    required Function(String message) onSuccess,
    required Function(String message) onError,
  }) async {
    state = const AsyncLoading();
    EkycVerification ekycVerification =
        await ref.read(ekycVerificationProvider);
    final result = await ekycVerification.call(EKycParams(
      clientId: 2,
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
      ),
    ));
    result.fold(
      (error) {
        state = AsyncError(error, StackTrace.current);
        onError(error);
      },
      (message) {
        state = AsyncData(message);
        onSuccess(message);
      },
    );
  }
}

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
      clientId: 25,
      countryCode: params.countryCode,
      userId: params.userId,
      kycData: KycData(
        fullName: params.kycData!.fullName,
        birthDate: params.kycData!.birthDate,
        idNumber: params.kycData!.idNumber,
        attachments: [
          "https://upload.wikimedia.org/wikipedia/en/a/a9/Example.jpg",
          "https://upload.wikimedia.org/wikipedia/en/a/a9/Example.jpg"
        ],
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

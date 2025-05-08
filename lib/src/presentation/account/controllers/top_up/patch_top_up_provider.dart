import 'package:anantla_pay/src/core/main/controllers/notification_service/notification_services.dart';
import 'package:anantla_pay/src/presentation/account/controllers/top_up/get_fees_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/top_up/top_up_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/top_up/top_up_virtual_account_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/top_up/verif_otp_virtual_account_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/top_up/verify_otp_top_up_provider.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/top_up_params.dart';
import 'package:anantla_pay/src/presentation/account/domain/usecases/get_fees.dart';
import 'package:anantla_pay/src/presentation/account/domain/usecases/top_up.dart';
import 'package:anantla_pay/src/presentation/account/domain/usecases/top_up_vitual_account.dart';
import 'package:anantla_pay/src/presentation/account/domain/usecases/verif_otp_topup.dart';
import 'package:anantla_pay/src/presentation/account/domain/usecases/verif_otp_virtual_account.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'patch_top_up_provider.g.dart';

@Riverpod(keepAlive: true)
class PatchTopUp extends _$PatchTopUp {
  @override
  FutureOr<String?> build() {
    return null;
  }

  void patchTouUp({
    required TopupParams topupParams,
    required Function(String message) onError,
    required Function(String message) onSuccess,
  }) async {
    state = const AsyncLoading();
    TopUp topUp = await ref.read(topUpProvider);
    NotificationService notificationService = NotificationService();
    final fcmToken = await notificationService.getToken();
    final result = await topUp.call(TopupParams(
      amount: topupParams.amount,
      currency: topupParams.currency,
      // // firebaseToken:
      //     'dqAb6xh4SxCdF7tbOpc0Vn:APA91bGDBSekoO9p1H7DDhU3jtv2LiwFP8WCrUEKB7vvv06CDjatNldt8dI1YvVZlcReUfNMHeRoQl0mjDbtbG507A6tGtOBbl6LXUmFQtq3gdNM10tDi30',
      firebaseToken: fcmToken ?? '',
      walletId: topupParams.walletId,
    ));
    result.fold(
      (error) {
        state = AsyncError(error, StackTrace.current);
        onError(error);
      },
      (data) {
        onSuccess(data);
        state = AsyncData('Top Up Success');
      },
    );
  }

  void verifOtpTopUp({
    required VerifyOtpTopupParams params,
    required Function(String message) onError,
    required Function(String message) onSuccess,
  }) async {
    state = const AsyncLoading();
    VerifOtpTopup verifOtpTopup = await ref.read(verifOtpTopupProvider);
    NotificationService notificationService = NotificationService();

    final fcmToken = await notificationService.getToken();

    final result = await verifOtpTopup.call(VerifyOtpTopupParams(
      firebaseToken: fcmToken ?? '',
      currency: params.currency,
      amount: params.amount,
      otpCode: params.otpCode,
      walletId: params.walletId,
    ));
    result.fold(
      (error) {
        state = AsyncError(error, StackTrace.current);
        onError(error);
      },
      (data) {
        onSuccess(data);
        state = AsyncData('Top Up Success');
      },
    );
  }

  void getFees({
    required VirtualAccountParams params,
    required Function(String message) onError,
    required Function(FeeModel data) onSuccess,
  }) async {
    state = const AsyncLoading();
    GetFees getFees = ref.read(getFeesProvider);
    final result = await getFees.call(VirtualAccountParams(
      walletId: params.walletId,
      amount: params.amount,
      currency: params.currency,
      coverFee: params.coverFee,
    ));
    return result.fold(
      (error) {
        state = AsyncError(error, StackTrace.current);
        onError(error);
      },
      (data) {
        onSuccess(data);
        state = AsyncData('Top Up Success');
      },
    );
  }

  void topUpVirtualAccount({
    required VirtualAccountParams params,
    required Function(String message) onError,
    required Function(String message) onSuccess,
  }) async {
    state = const AsyncLoading();
    TopUpVitualAccount topUpVitualAccount =
        ref.read(topUpVitualAccountProvider);
    final result = await topUpVitualAccount.call(VirtualAccountParams(
      walletId: params.walletId,
      bankCode: params.bankCode,
      platformFee: params.platformFee,
      partnerFee: params.partnerFee,
      virtualAccountName: params.virtualAccountName,
      virtualAccountEmail: params.virtualAccountEmail,
      virtualAccountPhone: params.virtualAccountPhone,
      totalAmount: params.totalAmount,
    ));

    return result.fold(
      (error) {
        state = AsyncError(error, StackTrace.current);
        onError(error);
      },
      (data) {
        onSuccess(data);
        state = AsyncData('Top Up Success');
      },
    );
  }

  void verifyOtpVirtualAccount({
    required VirtualAccountParams params,
    required Function(String message) onError,
    required Function(String message) onSuccess,
  }) async {
    state = const AsyncLoading();
    VerifOtpVirtualAccount verifOtpVirtualAccount =
        ref.read(verifOtpVirtualAccountProvider);
    final result = await verifOtpVirtualAccount.call(VirtualAccountParams(
      trxId: params.trxId,
      bankCode: params.bankCode,
    ));
    result.fold(
      (error) {
        state = AsyncError(error, StackTrace.current);
        onError(error);
      },
      (data) {
        onSuccess(data);
        state = AsyncData('Top Up Success');
      },
    );
  }
}

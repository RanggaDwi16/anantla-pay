import 'package:anantla_pay/src/core/main/domain/usecases/verifOtpLogin.dart';
import 'package:anantla_pay/src/core/provider/token_manager_provider.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/presentation/add_money/pages/top_up_choose_bank_page.dart';
import 'package:anantla_pay/src/presentation/home/domain/entities/balance_model.dart';
import 'package:anantla_pay/src/presentation/account/pages/account_page.dart';
import 'package:anantla_pay/src/presentation/add_money/pages/add_money_page.dart';
import 'package:anantla_pay/src/presentation/add_money/pages/success_top_up_page.dart';
import 'package:anantla_pay/src/presentation/add_money/pages/top_up_option_page.dart';
import 'package:anantla_pay/src/presentation/add_money/pages/top_up_pick_wallet_page.dart';
import 'package:anantla_pay/src/presentation/add_money/pages/top_up_review_detail_page.dart';
import 'package:anantla_pay/src/presentation/add_money/pages/verify_otp_top_up_page.dart';
import 'package:anantla_pay/src/presentation/home/pages/detail_wallet_page.dart';
import 'package:anantla_pay/src/presentation/login/pages/set_up_biometric_page.dart';
import 'package:anantla_pay/src/presentation/login/pages/success_set_up_biometric_page.dart';
import 'package:anantla_pay/src/presentation/main/pages/coming_soon_page.dart';
import 'package:anantla_pay/src/presentation/onboarding/pages/join_wait_list_page.dart';
import 'package:anantla_pay/src/presentation/qr/pages/success_scan_transaction_page.dart';
import 'package:anantla_pay/src/presentation/recipient/pages/recipient_page.dart';
import 'package:anantla_pay/src/presentation/transfer/pages/add_account/add_account_bussiness_page.dart';
import 'package:anantla_pay/src/presentation/transfer/pages/add_account/add_account_other_page.dart';
import 'package:anantla_pay/src/presentation/transfer/pages/add_recipient_page.dart';
import 'package:anantla_pay/src/presentation/transfer/pages/add_account/add_account_me_page.dart';
import 'package:anantla_pay/src/presentation/transfer/pages/review_detail_transfer_bank_page.dart';
import 'package:anantla_pay/src/presentation/transfer/pages/transfer_amount_page.dart';
import 'package:anantla_pay/src/presentation/transfer/pages/choose_bank_page.dart';
import 'package:anantla_pay/src/presentation/transfer/pages/choose_e_wallet_page.dart';
import 'package:anantla_pay/src/presentation/transfer/pages/choose_wallet_page.dart';
import 'package:anantla_pay/src/presentation/transfer/pages/review_detail_transfer_page.dart';
import 'package:anantla_pay/src/presentation/transfer/pages/sending_to_page.dart';
import 'package:anantla_pay/src/presentation/transfer/pages/success_transfer_page.dart';
import 'package:anantla_pay/src/presentation/transfer/pages/transfer_bank_amount_page.dart';
import 'package:anantla_pay/src/presentation/transfer/pages/transfer_bank_reason_page.dart';
import 'package:anantla_pay/src/presentation/transfer/pages/transfer_reason_page.dart';
import 'package:anantla_pay/src/presentation/transfer/pages/verify_otp_transfer_bank_page.dart';
import 'package:anantla_pay/src/presentation/transfer/pages/verify_otp_transfer_page.dart';
import 'package:anantla_pay/src/presentation/transfer_main/pages/transfer_main_page.dart';
import 'package:anantla_pay/src/presentation/wallet/pages/ekyc_verification_page.dart';
import 'package:anantla_pay/src/presentation/wallet/pages/create_wallet_page.dart';
import 'package:anantla_pay/src/presentation/wallet/pages/wallet_page.dart';
import 'package:anantla_pay/src/presentation/forgot-password/pages/forgot_password_page.dart';
import 'package:anantla_pay/src/presentation/home/pages/receive_page.dart';
import 'package:anantla_pay/src/presentation/home/pages/spent_page.dart';
import 'package:anantla_pay/src/presentation/transaction/pages/detail/detail-add/detail_add_page.dart';
import 'package:anantla_pay/src/presentation/transaction/pages/detail/detail_cancel_page.dart';
import 'package:anantla_pay/src/presentation/transaction/pages/detail/detail_refund_page.dart';
import 'package:anantla_pay/src/presentation/transaction/pages/all_transaction_page.dart';
import 'package:anantla_pay/src/presentation/home/pages/home_page.dart';
import 'package:anantla_pay/src/presentation/login/pages/login_page.dart';
import 'package:anantla_pay/src/presentation/login/pages/verify_otp_login_page.dart';
import 'package:anantla_pay/src/presentation/main/pages/main_page.dart';
import 'package:anantla_pay/src/presentation/notification/pages/notification_page.dart';
import 'package:anantla_pay/src/presentation/onboarding/pages/onboarding_page.dart';
import 'package:anantla_pay/src/presentation/pay/pages/pay_page.dart';
import 'package:anantla_pay/src/presentation/qr/domain/entities/qr_model.dart';
import 'package:anantla_pay/src/presentation/qr/pages/invoice_page.dart';
import 'package:anantla_pay/src/presentation/qr/pages/payment_option_page.dart';
import 'package:anantla_pay/src/presentation/qr/pages/qrCode_page.dart';
import 'package:anantla_pay/src/presentation/qr/pages/qr_tab_page.dart';
import 'package:anantla_pay/src/presentation/qr/pages/qris_scanner_page.dart';
import 'package:anantla_pay/src/presentation/register/pages/register_page.dart';
import 'package:anantla_pay/src/presentation/review/pages/review_page.dart';
import 'package:anantla_pay/src/presentation/setting/pages/setting_page.dart';
import 'package:anantla_pay/src/presentation/splash/pages/splash_page.dart';
import 'package:anantla_pay/src/presentation/topUp/pages/payload_page.dart';
import 'package:anantla_pay/src/presentation/topUp/pages/manual_bank_transfer_page.dart';
import 'package:anantla_pay/src/presentation/topUp/pages/top_up_page.dart';
import 'package:anantla_pay/src/presentation/transaction/pages/detail/detail-sent/detail_sent_page.dart';
import 'package:anantla_pay/src/presentation/transaction/pages/help_page.dart';
import 'package:anantla_pay/src/presentation/transfer/pages/cross_psp_transfer/cross_psp_transfer_page.dart';
import 'package:anantla_pay/src/presentation/transfer/pages/internal_transfer/internal_transfer_page.dart';
import 'package:anantla_pay/src/presentation/transfer/pages/transfer_page.dart';
import 'package:anantla_pay/src/presentation/withdraw/pages/withdraw_page.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:local_auth/local_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'go_router_provider.g.dart';

@Riverpod(keepAlive: true)
Raw<GoRouter> router(RouterRef ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: false,
    routes: [
      GoRoute(
        path: '/',
        name: RouteName.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: '/onboarding',
        name: RouteName.onboarding,
        builder: (context, state) => const OnboardingPage(),
        redirect: (context, state) async {
          final tokenManager = await ref.read(tokenManagerProvider.future);
          final isOnboardingDone = tokenManager.isOnboardingCompleted();

          if (isOnboardingDone) {
            return RouteName.login;
          } else {
            return RouteName.onboarding;
          }
        },
      ),
      GoRoute(
        path: '/joinWaitlist',
        name: RouteName.joinWaitlist,
        builder: (context, state) {
          return JoinWaitListPage();
        },
      ),
      GoRoute(
        path: '/main',
        name: RouteName.main,
        builder: (context, state) {
          return MainPage();
        },
        redirect: (context, state) async {
          final tokenManager = await ref.read(tokenManagerProvider.future);
          final isFingerprintEnabled =
              await tokenManager.isFingerprintEnabled();

          // Cek apakah fingerprint aktif
          if (isFingerprintEnabled) {
            final auth = LocalAuthentication();
            final canCheckBiometrics = await auth.canCheckBiometrics;
            final isDeviceSupported = await auth.isDeviceSupported();

            if (canCheckBiometrics && isDeviceSupported) {
              try {
                final didAuthenticate = await auth.authenticate(
                  localizedReason: 'Scan your fingerprint or Face ID to log in',
                  options: const AuthenticationOptions(
                    biometricOnly: false,
                    stickyAuth: true,
                  ),
                );

                if (!didAuthenticate) {
                  SystemNavigator.pop();
                }
              } catch (e) {
                // Kalau error fingerprint, keluar aplikasi
                SystemNavigator.pop();
              }
            } else {
              // Kalau device tidak support, skip (bisa langsung masuk)
              return null;
            }
          }

          return null; // Kalau fingerprint tidak diaktifkan, langsung masuk ke MainPage
        },
      ),
      GoRoute(
        path: '/addMoney',
        name: RouteName.addMoney,
        builder: (context, state) {
          return AddMoneyPage();
        },
      ),
      GoRoute(
        path: '/topUpOption',
        name: RouteName.topUpOption,
        builder: (context, state) {
          return TopUpOptionPage();
        },
      ),
      GoRoute(
        path: '/topUpChooseBank',
        name: RouteName.topUpChooseBank,
        builder: (context, state) {
          return TopUpChooseBankPage();
        },
      ),
      GoRoute(
        path: '/pickWallet',
        name: RouteName.pickWallet,
        builder: (context, state) {
          return TopUpPickWalletPage();
        },
      ),
      GoRoute(
        path: '/topUpReviewDetail',
        name: RouteName.topUpReviewDetail,
        builder: (context, state) {
          return TopUpReviewDetailPage();
        },
      ),
      GoRoute(
        path: '/verifyOtpTopUp',
        name: RouteName.verifyOtpTopUp,
        builder: (context, state) {
          return VerifyOtpTopUpPage();
        },
      ),
      GoRoute(
        path: '/topUpSuccess',
        name: RouteName.topUpSuccess,
        builder: (context, state) {
          return SuccessTopUpPage();
        },
      ),
      GoRoute(
        path: '/createWallet',
        name: RouteName.createWallet,
        builder: (context, state) {
          return CreateWalletPage();
        },
      ),
      GoRoute(
        path: '/ekyc',
        name: RouteName.ekyc,
        builder: (context, state) {
          return EkycVerificationPage();
        },
      ),
      GoRoute(
        path: '/detailWallet',
        name: RouteName.detailWallet,
        builder: (context, state) {
          final wallet = state.extra as BalanceModel;
          return DetailWalletPage(wallet: wallet);
        },
      ),
      GoRoute(
        path: '/receive',
        name: RouteName.receive,
        builder: (context, state) {
          return ReceivePage();
        },
      ),
      GoRoute(
        path: '/spent',
        name: RouteName.spent,
        builder: (context, state) {
          return SpentPage();
        },
      ),
      GoRoute(
        path: '/notification',
        name: RouteName.notification,
        builder: (context, state) {
          return NotificationPage();
        },
      ),
      GoRoute(
        path: '/allTransaction',
        name: RouteName.allTransaction,
        builder: (context, state) {
          return AllTransactionPage();
        },
      ),
      GoRoute(
        path: '/detailAdd',
        name: RouteName.detailAdd,
        builder: (context, state) {
          return DetailAddPage();
        },
      ),
      GoRoute(
        path: '/detailCancel',
        name: RouteName.detailCancel,
        builder: (context, state) {
          return DetailCancelPage();
        },
      ),
      GoRoute(
        path: '/detailRefund',
        name: RouteName.detailRefund,
        builder: (context, state) {
          return DetailRefundPage();
        },
      ),
      GoRoute(
        path: '/detailSent',
        name: RouteName.detailSent,
        builder: (context, state) {
          return DetailSentPage();
        },
      ),
      GoRoute(
        path: '/help',
        name: RouteName.help,
        builder: (context, state) {
          return HelpPage();
        },
      ),
      GoRoute(
        path: '/setting',
        name: RouteName.setting,
        builder: (context, state) {
          return SettingPage();
        },
      ),
      GoRoute(
        path: '/login',
        name: RouteName.login,
        builder: (context, state) => LoginPage(),
        redirect: (context, state) async {
          final token = await ref.read(tokenManagerProvider.future);
          final userId = await token.getUserId();
          final tokenValue = await token.getToken();
          print('Token: $tokenValue');
          print('User ID: $userId');
          final isLogin = await token.isLogin();

          if (isLogin) {
            return RouteName.main;
          }

          return null;
        },
      ),
      GoRoute(
        path: '/verifyOtpLogin',
        name: RouteName.verifyOtpLogin,
        builder: (context, state) {
          final email = state.extra as String;
          return VerifyOtpLoginPage(email: email);
        },
      ),
      GoRoute(
        path: '/setUpBiometric',
        name: RouteName.setUpBiometric,
        builder: (context, state) {
          return SetUpBiometricPage();
        },
      ),
      GoRoute(
        path: '/successSetUpBiometric',
        name: RouteName.successSetUpBiometric,
        builder: (context, state) {
          return SuccessSetUpBiometricPage();
        },
      ),
      GoRoute(
        path: '/register',
        name: RouteName.register,
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: '/forgotPassword',
        name: RouteName.forgotPassword,
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      GoRoute(
        path: '/home',
        name: RouteName.home,
        builder: (context, state) {
          return HomePage();
        },
      ),
      GoRoute(
        path: '/comnigSoon',
        name: RouteName.comingSoon,
        builder: (context, state) {
          return ComingSoonPage();
        },
      ),
      GoRoute(
        path: '/transferMain',
        name: RouteName.transferMain,
        builder: (context, state) {
          return TransferMainPage();
        },
      ),
      GoRoute(
        path: '/recipient',
        name: RouteName.recipient,
        builder: (context, state) {
          return RecipientPage();
        },
      ),
      GoRoute(
        path: '/qrtab',
        name: RouteName.qrtab,
        builder: (context, state) {
          return QRTabPage();
        },
      ),
      GoRoute(
        path: '/qrcode',
        name: RouteName.qrcode,
        builder: (context, state) {
          return QrcodePage();
        },
      ),
      GoRoute(
        path: '/qrisScanner',
        name: RouteName.qrisScanner,
        builder: (context, state) {
          return QrisScannerPage();
        },
      ),
      GoRoute(
        path: '/paymentOption',
        name: RouteName.paymentOption,
        builder: (context, state) {
          return PaymentOptionPage();
        },
      ),
      GoRoute(
        path: '/invoice',
        name: RouteName.invoice,
        builder: (context, state) {
          // final qr = state.extra as QrModel?;
          return InvoicePage(
              // qrModel: qr,/
              );
        },
      ),
      GoRoute(
        path: '/successScanTransaction',
        name: RouteName.successScanTransaction,
        builder: (context, state) {
          return SuccessScanTransactionPage();
        },
      ),
      GoRoute(
        path: '/pay',
        name: RouteName.pay,
        builder: (context, state) {
          return PayPage();
        },
      ),
      GoRoute(
        path: '/review',
        name: RouteName.review,
        builder: (context, state) {
          return ReviewPage();
        },
      ),
      GoRoute(
        path: '/wallet',
        name: RouteName.wallet,
        builder: (context, state) => const WalletPage(),
      ),
      GoRoute(
        path: '/account',
        name: RouteName.account,
        builder: (context, state) => const AccountPage(),
      ),
      GoRoute(
        path: '/topUp',
        name: RouteName.topUp,
        builder: (context, state) {
          return TopUpPage();
        },
      ),
      GoRoute(
        path: '/payload',
        name: RouteName.payload,
        builder: (context, state) {
          return PayloadPage();
        },
      ),
      GoRoute(
        path: '/manualBankTransfer',
        name: RouteName.manualBankTransfer,
        builder: (context, state) => ManualBankTransferPage(),
      ),
      GoRoute(
          path: '/withdraw',
          name: RouteName.withdraw,
          builder: (context, state) {
            final walletId = state.extra as int;
            return WithdrawPage(walletId: walletId);
          }),
      GoRoute(
        path: '/sendingTo',
        name: RouteName.sendingTo,
        builder: (context, state) {
          return SendingToPage();
        },
      ),
      GoRoute(
        path: '/addRecipient',
        name: RouteName.addRecipient,
        builder: (context, state) {
          return AddRecipientPage();
        },
      ),
      GoRoute(
        path: '/transferAmount',
        name: RouteName.transferAmount,
        builder: (context, state) {
          return TransferAmountPage();
        },
      ),
      GoRoute(
        path: '/transferReason',
        name: RouteName.transferReason,
        builder: (context, state) {
          return TransferReasonPage();
        },
      ),
      GoRoute(
        path: '/reviewDetailTransfer',
        name: RouteName.reviewDetailTransfer,
        builder: (context, state) {
          return ReviewDetailTransferPage();
        },
      ),
      GoRoute(
        path: '/verifyOtpTransfer',
        name: RouteName.verifyOtpTransfer,
        builder: (context, state) {
          return VerifyOtpTransferPage();
        },
      ),
      GoRoute(
        path: '/successTransfer',
        name: RouteName.successTransfer,
        builder: (context, state) {
          return SuccessTransferPage();
        },
      ),
      GoRoute(
        path: '/transfer',
        name: RouteName.transfer,
        builder: (context, state) {
          return TransferPage();
        },
      ),
      GoRoute(
        path: '/chooseWallet',
        name: RouteName.chooseWallet,
        builder: (context, state) {
          return ChooseWalletPage();
        },
      ),
      GoRoute(
        path: '/chooseEWallet',
        name: RouteName.chooseEWallet,
        builder: (context, state) {
          return ChooseEWalletPage();
        },
      ),
      GoRoute(
        path: '/chooseBank',
        name: RouteName.chooseBank,
        builder: (context, state) {
          return ChooseBankPage();
        },
      ),
      GoRoute(
        path: '/transferBankAmount',
        name: RouteName.transferBankAmount,
        builder: (context, state) {
          return TransferBankAmountPage();
        },
      ),
      GoRoute(
        path: '/transferBankReason',
        name: RouteName.transferBankReason,
        builder: (context, state) {
          return TransferBankReasonPage();
        },
      ),
      GoRoute(
        path: '/reviewDetailTransferBank',
        name: RouteName.reviewDetailTransferBank,
        builder: (context, state) {
          return ReviewDetailTransferBankPage();
        },
      ),
      GoRoute(
        path: '/verifyOtpTransferBank',
        name: RouteName.verifyOtpTransferBank,
        builder: (context, state) {
          return VerifyOtpTransferBankPage();
        },
      ),
      GoRoute(
        path: '/addAccountMe',
        name: RouteName.addAccountMe,
        builder: (context, state) {
          return AddAccountMePage();
        },
      ),
      GoRoute(
        path: '/addAccountOther',
        name: RouteName.addAccountOther,
        builder: (context, state) {
          return AddAccountOtherPage();
        },
      ),
      GoRoute(
        path: '/addAccountBussiness',
        name: RouteName.addAccountBusiness,
        builder: (context, state) {
          return AddAccountBussinessPage();
        },
      ),
      GoRoute(
        path: '/internalTransfer',
        name: RouteName.internalTransfer,
        builder: (context, state) {
          return InternalTransferPage();
        },
      ),
      GoRoute(
        path: '/crossPspTransfer',
        name: RouteName.crossPspTransfer,
        builder: (context, state) {
          return CrossPspTransferPage();
        },
      ),
    ],
  );
}

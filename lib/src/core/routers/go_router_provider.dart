import 'package:anantla_pay/src/core/provider/token_manager_provider.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/presentation/account/pages/account_page.dart';
import 'package:anantla_pay/src/presentation/card/pages/card_page.dart';
import 'package:anantla_pay/src/presentation/forgot-password/pages/forgot_password_page.dart';
import 'package:anantla_pay/src/presentation/home/pages/home_page.dart';
import 'package:anantla_pay/src/presentation/login/pages/login_page.dart';
import 'package:anantla_pay/src/presentation/main/pages/main_page.dart';
import 'package:anantla_pay/src/presentation/onboarding/pages/onboarding_page.dart';
import 'package:anantla_pay/src/presentation/pay/pages/pay_page.dart';
import 'package:anantla_pay/src/presentation/register/pages/register_page.dart';
import 'package:anantla_pay/src/presentation/review/pages/review_page.dart';
import 'package:anantla_pay/src/presentation/splash/pages/splash_page.dart';
import 'package:anantla_pay/src/presentation/topUp/pages/payload_page.dart';
import 'package:anantla_pay/src/presentation/topUp/pages/manual_bank_transfer_page.dart';
import 'package:anantla_pay/src/presentation/topUp/pages/top_up_page.dart';
import 'package:anantla_pay/src/presentation/transfer/pages/cross_psp_transfer/cross_psp_transfer_page.dart';
import 'package:anantla_pay/src/presentation/transfer/pages/internal_transfer/internal_transfer_page.dart';
import 'package:anantla_pay/src/presentation/transfer/pages/transfer_page.dart';
import 'package:anantla_pay/src/presentation/withdraw/pages/withdraw_page.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'go_router_provider.g.dart';

@Riverpod(keepAlive: true)
Raw<GoRouter> router(RouterRef ref) {
  return GoRouter(initialLocation: '/', debugLogDiagnostics: false, routes: [
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
      path: '/main',
      name: RouteName.main,
      builder: (context, state) {
        // final userId = state.extra as int;
        // print('User ID MAIN: $userId');
        return MainPage();
      },
    ),
    GoRoute(
      path: '/login',
      name: RouteName.login,
      builder: (context, state) => LoginPage(),
      redirect: (context, state) async {
        final token = await ref.read(tokenManagerProvider.future);
        final userId = await token.getUserId();
        print('User ID: $userId');
        final isLogin = await token.isLogin();

        if (isLogin) {
          return RouteName.main;
        }

        return null;
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
        path: '/pay',
        name: RouteName.pay,
        builder: (context, state) {
          return PayPage();
        }),
    GoRoute(
      path: '/review',
      name: RouteName.review,
      builder: (context, state) {
        return ReviewPage();
      },
    ),
    GoRoute(
      path: '/card',
      name: RouteName.card,
      builder: (context, state) => const CardPage(),
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
      path: '/transfer',
      name: RouteName.transfer,
      builder: (context, state) {
        return TransferPage();
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
  ]);
}

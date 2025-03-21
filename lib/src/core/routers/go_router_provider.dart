import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/presentation/account/pages/account_page.dart';
import 'package:anantla_pay/src/presentation/card/pages/card_page.dart';
import 'package:anantla_pay/src/presentation/home/pages/home_page.dart';
import 'package:anantla_pay/src/presentation/main/pages/main_page.dart';
import 'package:anantla_pay/src/presentation/pay/pages/pay_page.dart';
import 'package:anantla_pay/src/presentation/review/pages/review_page.dart';
import 'package:anantla_pay/src/presentation/splash/pages/splash_page.dart';
import 'package:flutter/material.dart';
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
      path: '/main',
      name: RouteName.main,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const MainPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: '/home',
      name: RouteName.home,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/pay',
      name: RouteName.pay,
      builder: (context, state) => const PayPage(),
    ),
    GoRoute(
      path: '/review',
      name: RouteName.review,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const ReviewPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final curved = CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            );
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0), // dari kanan ke kiri
                end: Offset.zero,
              ).animate(curved),
              child: child,
            );
          },
        );
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
  ]);
}

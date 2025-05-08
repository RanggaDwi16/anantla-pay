import 'package:anantla_pay/src/core/main/controllers/auth/authentication_provider.dart';
import 'package:anantla_pay/src/core/main/domain/entities/register_param.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

Future<void> registerUser({
  required WidgetRef ref,
  required BuildContext context,
  required RegisterParams params,
}) async {
  ref.read(authenticationProvider.notifier).register(
        params: params,
        onSuccess: (message) {
          context.showSuccessDialog(
            title: 'Success Register',
            message:
                'Please check your email to verify your account and login to the app',
            onConfirm: () => context.pushReplacementNamed(RouteName.login),
          );
        },
        onError: (message) {
          context.customErrorDialog(message);
        },
      );
}

void addToWishlist({
  required WidgetRef ref,
  required BuildContext context,
}) {
  ref.read(authenticationProvider.notifier).addWishList(
    onSuccess: (message) {
      context.showCustomSnackBar('Successfully added wishlist');
    },
    onError: (message) {
      context.showCustomSnackBar('Failed to add wishlist');
    },
  );
}

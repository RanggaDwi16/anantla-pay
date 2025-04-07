import 'package:anantla_pay/src/core/main/domain/entities/otp_params.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anantla_pay/src/core/main/controllers/auth/authentication_provider.dart';
import 'package:anantla_pay/src/presentation/home/controllers/get_user/fetch_user_provider.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

typedef OnSuccessCallback = void Function(String message);
typedef OnErrorCallback = void Function();

void loginWithEmailPassword({
  required WidgetRef ref,
  required String email,
  required String password,
  required OnSuccessCallback onSuccess,
  required OnErrorCallback onError,
}) {
  ref.read(authenticationProvider.notifier).login(
        email: email,
        password: password,
        onSuccess: (message) {
          ref.invalidate(fetchUserProvider);
          onSuccess(message);
        },
        onError: onError,
      );
}

void showOtpDialog({
  required BuildContext context,
  required WidgetRef ref,
  required String email,
}) {
  final otpController = TextEditingController();

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: const Text("Enter OTP"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("We have sent a verification code to $email."),
            const Gap(10),
            TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "OTP Code",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              final enteredOtp = otpController.text.trim();
              if (enteredOtp.isNotEmpty) {
                ref.read(authenticationProvider.notifier).verifOtpLogin(
                      params: OtpParams(
                        otpCode: enteredOtp,
                        email: email,
                      ),
                      onSuccess: () {
                        Navigator.pop(dialogContext);
                        context.showSuccessDialog(
                          title: "Success",
                          message: "OTP Verified!",
                          onConfirm: () {
                            context.pushReplacementNamed(RouteName.main);
                          },
                        );
                      },
                      onError: () {
                        context.showCustomSnackBar("Invalid OTP!",
                            isError: true);
                      },
                    );
              } else {
                context.showCustomSnackBar("Please enter the OTP!",
                    isError: true);
              }
            },
            child: const Text("Verify"),
          ),
        ],
      );
    },
  );
}
import 'package:anantla_pay/src/core/main/controllers/auth/authentication_provider.dart';
import 'package:anantla_pay/src/core/main/domain/entities/otp_params.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:anantla_pay/src/presentation/home/controllers/get_user/fetch_user_provider.dart';
import 'package:anantla_pay/src/presentation/login/controllers/action/login_action.dart';
import 'package:anantla_pay/src/presentation/login/controllers/login_form_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gap/gap.dart';

import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/helpers/widgets/custom_text_field.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //tari@bangunrumah.com
    //U(8kZv%yPe
    final auth = ref.watch(authenticationProvider);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    final isFormValid = ref.watch(loginFormProvider);
    final emailError = ref.watch(emailErrorProvider);
    final passwordError = ref.watch(passwordErrorProvider);

    final isPasswordVisible = useState(false);

    /// Real-time validation
    useEffect(() {
      void validate() {
        final email = emailController.text.trim();
        final password = passwordController.text.trim();

        // Email validation
        if (email.isEmpty) {
          ref.read(emailErrorProvider.notifier).state = 'Email cannot be empty';
        } else if (!email.contains('@')) {
          ref.read(emailErrorProvider.notifier).state =
              'Invalid email format, must contain @';
        } else {
          ref.read(emailErrorProvider.notifier).state = null;
        }

        // Password validation
        if (password.isEmpty) {
          ref.read(passwordErrorProvider.notifier).state =
              'Password cannot be empty';
        } else if (password.length < 6) {
          ref.read(passwordErrorProvider.notifier).state =
              'Password must be at least 6 characters';
        } else {
          ref.read(passwordErrorProvider.notifier).state = null;
        }

        // Form valid state
        ref.read(loginFormProvider.notifier).state =
            ref.read(emailErrorProvider) == null &&
                ref.read(passwordErrorProvider) == null;
      }

      emailController.addListener(validate);
      passwordController.addListener(validate);

      return () {
        emailController.removeListener(validate);
        passwordController.removeListener(validate);
      };
    }, []);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      // Form Area
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Container(
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColor.primaryWhite,
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColor.primaryBlack
                                          .withOpacity(0.1),
                                      blurRadius: 20,
                                      offset: const Offset(0, 10),
                                    ),
                                  ],
                                ),
                                child: Image.asset(
                                  Assets.images.anantlaLogo.path,
                                  fit: BoxFit.cover,
                                  color: AppColor.primaryColor,
                                ),
                              ),
                            ),
                            Gap(24),
                            Center(
                              child: Text(
                                "Let's Sign you in",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.copyWith(fontSize: 24),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Access your wallet securely and easily.",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        fontSize: 14,
                                        color: AppColor.primaryGray),
                              ),
                            ),
                            const Gap(40),

                            // Email Field
                            CustomTextField(
                              prefixIcon: Image.asset(
                                Assets.icons.email.path,
                                width: 20,
                              ),
                              controller: emailController,
                              labelText: "Email Address",
                              hintText: "Enter your email",
                              isRequired: true,
                            ),
                            if (emailError != null) ...[
                              const Gap(10),
                              Text(emailError,
                                  style: const TextStyle(color: Colors.red)),
                            ],
                            const Gap(20),

                            // Password Field
                            CustomTextField(
                              controller: passwordController,
                              labelText: "Password",
                              hintText: "Enter your password",
                              obscureText: !isPasswordVisible.value,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isPasswordVisible.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: AppColor.primaryBlack,
                                ),
                                onPressed: () => isPasswordVisible.value =
                                    !isPasswordVisible.value,
                              ),
                              isRequired: true,
                            ),
                            if (passwordError != null) ...[
                              const Gap(10),
                              Text(passwordError,
                                  style: const TextStyle(color: Colors.red)),
                            ],

                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () =>
                                    context.pushNamed(RouteName.forgotPassword),
                                child: Text(
                                  "Forgot Password?",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: AppColor.primaryColor,
                                      ),
                                ),
                              ),
                            ),
                            const Gap(24),

                            Button.filled(
                              label: auth.isLoading ? 'Loading...' : 'Login',
                              color: auth.isLoading
                                  ? Colors.grey
                                  : AppColor.primaryColor,
                              disabled: !isFormValid,
                              textColor: Colors.white,
                              onPressed: () {
                                loginWithEmailPassword(
                                  ref: ref,
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                  onSuccess: (message) {
                                    ref.invalidate(fetchUserProvider);
                                    showOtpDialog(
                                      context: context,
                                      ref: ref,
                                      email: emailController.text.trim(),
                                    );
                                  },
                                  onError: () {
                                    context.customErrorDialog(
                                        'Login Failed, Try Again');
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),

                      // Sign up link di bawah
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                            ),
                            TextButton(
                              onPressed: () =>
                                  context.pushNamed(RouteName.register),
                              child: Text(
                                "Register Now",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        fontSize: 14,
                                        color: AppColor.primaryColor),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  /// **Dialog OTP setelah login**
  // void _showOtpDialog(BuildContext context, WidgetRef ref, String email) {
  //   final otpController = TextEditingController();

  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext dialogContext) {
  //       // ✅ Store the dialog context
  //       return AlertDialog(
  //         title: const Text("Enter OTP"),
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Text("We have sent a verification code to $email."),
  //             const Gap(10),
  //             TextField(
  //               controller: otpController,
  //               keyboardType: TextInputType.number,
  //               decoration: const InputDecoration(
  //                 labelText: "OTP Code",
  //                 border: OutlineInputBorder(),
  //               ),
  //             ),
  //           ],
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               if (dialogContext.mounted) Navigator.pop(dialogContext);
  //             },
  //             child: const Text("Cancel"),
  //           ),
  //           TextButton(
  //             onPressed: () {
  //               final enteredOtp = otpController.text.trim();
  //               if (enteredOtp.isNotEmpty) {
  //                 ref.read(authenticationProvider.notifier).verifOtpLogin(
  //                       params: OtpParams(
  //                         otpCode: enteredOtp,
  //                         email: email, // ✅ Use email from login input
  //                       ),
  //                       onSuccess: () {
  //                         if (dialogContext.mounted) {
  //                           Navigator.pop(
  //                               dialogContext); // ✅ Close OTP Dialog first
  //                         }

  //                         if (context.mounted) {
  //                           context.showSuccessDialog(
  //                             title: "Success",
  //                             message: "OTP Verified!",
  //                             onConfirm: () {
  //                               if (context.mounted) {
  //                                 context.pushReplacementNamed(RouteName.main);
  //                               }
  //                             },
  //                           );
  //                         }
  //                       },
  //                       onError: () {
  //                         if (dialogContext.mounted) {
  //                           context.showCustomSnackBar("Invalid OTP!",
  //                               isError: true);
  //                         }
  //                       },
  //                     );
  //               } else {
  //                 context.showCustomSnackBar("Please enter the OTP!",
  //                     isError: true);
  //               }
  //             },
  //             child: const Text("Verify"),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}

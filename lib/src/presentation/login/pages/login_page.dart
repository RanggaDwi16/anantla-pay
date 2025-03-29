import 'package:anantla_pay/src/core/main/controllers/auth/authentication_provider.dart';
import 'package:anantla_pay/src/core/main/domain/entities/otp_params.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:anantla_pay/src/presentation/home/controllers/get_user/fetch_user_provider.dart';
import 'package:anantla_pay/src/presentation/login/controllers/login_form_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
    final auth = ref.watch(authenticationProvider);
    final emailController =
        useTextEditingController(text: 'tari@bangunrumah.com');
    final passwordController = useTextEditingController(text: 'U(8kZv%yPe');

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(40),
                const Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryBlack,
                  ),
                ),
                const Text(
                  "Please log in to your account",
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
                const Gap(40),

                /// Email
                CustomTextField(
                  controller: emailController,
                  labelText: "Email",
                  hintText: "Enter your email",
                  isRequired: true,
                ),

                if (emailError != null) ...[
                  const Gap(10),
                  Text(
                    emailError,
                    style: const TextStyle(color: Colors.red),
                  ),
                ],
                const Gap(20),

                /// Password
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
                    onPressed: () =>
                        isPasswordVisible.value = !isPasswordVisible.value,
                  ),
                  isRequired: true,
                ),
                if (passwordError != null) ...[
                  const Gap(10),
                  Text(
                    passwordError,
                    style: const TextStyle(color: Colors.red),
                  ),
                ],
                const Gap(40),

                /// Login Button
                Button.filled(
                  label: auth.isLoading ? 'Loading...' : 'Login',
                  color: auth.isLoading ? Colors.grey : AppColor.primaryBlack,
                  disabled: !isFormValid,
                  textColor: Colors.white,
                  borderRadius: 12,
                  onPressed: () {
                    ref.read(authenticationProvider.notifier).login(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                          onSuccess: (message) {
                            ref.invalidate(fetchUserProvider);
                            _showOtpDialog(
                                context, ref, emailController.text.trim());
                          },
                          onError: () {
                            context.customErrorDialog(
                              'Login Failed, Try Again',
                            );
                          },
                        );
                  },
                ),

                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () => context.pushNamed(RouteName.register),
                      child: const Text("Register Now"),
                    ),
                  ],
                ),

                //forgot password
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () =>
                          context.pushNamed(RouteName.forgotPassword),
                      child: const Text("Forgot Password?"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// **Dialog OTP setelah login**
  void _showOtpDialog(BuildContext context, WidgetRef ref, String email) {
    final otpController = useTextEditingController();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        // ✅ Store the dialog context
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
              onPressed: () {
                if (dialogContext.mounted) Navigator.pop(dialogContext);
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                final enteredOtp = otpController.text.trim();
                if (enteredOtp.isNotEmpty) {
                  ref.read(authenticationProvider.notifier).verifOtp(
                        params: OtpParams(
                          otpCode: enteredOtp,
                          email: email, // ✅ Use email from login input
                        ),
                        onSuccess: () {
                          if (dialogContext.mounted) {
                            Navigator.pop(
                                dialogContext); // ✅ Close OTP Dialog first
                          }

                          if (context.mounted) {
                            context.showSuccessDialog(
                              title: "Success",
                              message: "OTP Verified!",
                              onConfirm: () {
                                if (context.mounted) {
                                  context.pushReplacementNamed(RouteName.main);
                                }
                              },
                            );
                          }
                        },
                        onError: () {
                          if (dialogContext.mounted) {
                            context.showCustomSnackBar("Invalid OTP!",
                                isError: true);
                          }
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
}

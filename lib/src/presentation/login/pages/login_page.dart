import 'package:anantla_pay/src/core/main/controllers/auth/authentication_provider.dart';
import 'package:anantla_pay/src/core/provider/auth_local_provider.dart';
import 'package:anantla_pay/src/core/provider/token_manager_provider.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:anantla_pay/src/presentation/home/controllers/get_user/fetch_user_provider.dart';
import 'package:anantla_pay/src/presentation/login/controllers/action/login_action.dart';
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
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    final isFormValid = ref.watch(loginFormProvider);
    final emailError = ref.watch(emailErrorProvider);
    final passwordError = ref.watch(passwordErrorProvider);

    final isPasswordVisible = useState(false);

    useEffect(() {
      void validate() {
        final email = emailController.text.trim();
        final password = passwordController.text.trim();

        if (email.isEmpty) {
          ref.read(emailErrorProvider.notifier).state =
              'Username or email cannot be empty';
        } else {
          ref.read(emailErrorProvider.notifier).state = null;
        }

        if (password.isEmpty) {
          ref.read(passwordErrorProvider.notifier).state =
              'Password cannot be empty';
        } else if (password.length < 6) {
          ref.read(passwordErrorProvider.notifier).state =
              'Password must be at least 6 characters';
        } else {
          ref.read(passwordErrorProvider.notifier).state = null;
        }

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
      backgroundColor: AppColor.secondaryBackground,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(60),
                    Center(
                      child: Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.primaryBlack.withOpacity(0.1),
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
                    const Gap(24),
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
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 14,
                              color: AppColor.primaryGray,
                            ),
                      ),
                    ),
                    const Gap(40),

                    // Email
                    CustomTextField(
                      prefixIcon: Image.asset(
                        Assets.icons.email.path,
                        width: 20,
                      ),
                      controller: emailController,
                      labelText: "Email Address or Username",
                      hintText: "Enter your email or username",
                      isRequired: true,
                    ),
                    if (emailError != null) ...[
                      const Gap(10),
                      Text(emailError,
                          style: const TextStyle(color: Colors.red)),
                    ],
                    const Gap(20),

                    // Password
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
                              ?.copyWith(color: AppColor.primaryColor),
                        ),
                      ),
                    ),
                    const Gap(24),

                    Row(
                      children: [
                        // Tombol Login
                        Expanded(
                          child: Button.filled(
                            label: auth.isLoading ? 'Loading...' : 'Login',
                            color: auth.isLoading
                                ? Colors.grey
                                : AppColor.primaryColor,
                            disabled: !isFormValid,
                            textColor: Colors.white,
                            onPressed: () {
                              ref.read(authenticationProvider.notifier).login(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                    onSuccess: (data) {
                                      ref.invalidate(fetchUserProvider);
                                      context.goNamed(RouteName.setUpBiometric);
                                    },
                                    onError: (message) {
                                      context.customErrorDialog(message);
                                    },
                                  );
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        InkWell(
                          onTap: () async {
                            final tokenManager =
                                await ref.read(tokenManagerProvider.future);
                            final isFingerprintEnabled =
                                await tokenManager.isFingerprintEnabled();

                            if (!isFingerprintEnabled) {
                              context.customErrorDialog(
                                  'Fingerprint is disabled. Please login manually.');
                              return;
                            }

                            final success = await ref.read(
                                authenticateWithBiometricsProvider.future);
                            if (success) {
                              final token = await tokenManager.getToken();
                              if (token != null && token.isNotEmpty) {
                                context.goNamed(RouteName.main);
                              } else {
                                context.customErrorDialog(
                                    'Session expired. Please login manually.');
                              }
                            } else {
                              context.customErrorDialog(
                                  'Fingerprint authentication failed.');
                            }
                          },
                          child: Container(
                            width: 52,
                            height: 48,
                            decoration: BoxDecoration(
                              color: AppColor.primaryColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: const EdgeInsets.all(12),
                            child: Image.asset(
                              Assets.icons.fingerprint.path,
                              color: Colors.white,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const Gap(20),
                    Button.outlined(
                      onPressed: () async {
                        final tokenManager =
                            await ref.read(tokenManagerProvider.future);
                        final isEnabled =
                            await tokenManager.isFingerprintEnabled();

                        if (!isEnabled) {
                          context.customErrorDialog(
                              'Face ID is not enabled. Please log in manually first.');
                          return;
                        }

                        final success = await ref
                            .read(authenticateWithBiometricsProvider.future);
                        if (success) {
                          context.goNamed(RouteName.main);
                        } else {
                          context.customErrorDialog(
                              'Face ID authentication failed');
                        }
                      },
                      label: 'Unlock with Face ID',
                      color: AppColor.primaryWhite,
                      textColor: AppColor.primaryBlack,
                      borderColor: AppColor.textGray,
                    ),
                    Gap(20),
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
                                  fontWeight: FontWeight.w400,
                                ),
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
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.primaryColor,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

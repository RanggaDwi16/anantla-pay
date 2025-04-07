import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/helpers/widgets/custom_text_field.dart';
import 'package:anantla_pay/src/core/main/controllers/auth/authentication_provider.dart';
import 'package:anantla_pay/src/core/main/domain/entities/register_param.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:anantla_pay/src/presentation/forgot-password/controllers/forgot_password_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ForgotPasswordPage extends HookConsumerWidget {
  const ForgotPasswordPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authenticationProvider);
    final emailController = useTextEditingController();

    final formData = useState((email: '',));

    final emailError = useState<String?>(null);

    useEffect(() {
      void update() {
        formData.value = (email: emailController.text,);

        emailError.value = !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                .hasMatch(formData.value.email)
            ? 'Invalid email'
            : null;
      }

      emailController.addListener(update);

      return () {
        emailController.removeListener(update);
      };
    }, []);
    final isValid =
        ref.watch(forgotPasswordFormValidProvider(formData.value)) &&
            emailError.value == null;
    return Scaffold(
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
                      Expanded(
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
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
                                  "Forget Password",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge
                                      ?.copyWith(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600),
                                ),
                              ),
                              Center(
                                child: Text(
                                  "Please fill the form to reset your password",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: AppColor.textGray),
                                ),
                              ),
                              const Gap(40),

                              /// Email Field
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

                              if (emailError.value != null) ...[
                                const Gap(10),
                                Text(
                                  emailError.value!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: Colors.red,
                                        fontSize: 12,
                                      ),
                                ),
                              ],
                              const Gap(40),

                              /// Submit Button
                              Button.filled(
                                label: auth.isLoading
                                    ? 'Loading...'
                                    : 'Forgot Password',
                                color: auth.isLoading
                                    ? Colors.grey
                                    : AppColor.primaryColor,
                                textColor: Colors.white,
                                disabled: !isValid,
                                onPressed: () {
                                  if (isValid) {
                                    ref
                                        .read(authenticationProvider.notifier)
                                        .forgotPassword(
                                          params: RegisterParams(
                                            email: formData.value.email,
                                          ),
                                          onSuccess: (message) {
                                            context.showSuccessDialog(
                                              title:
                                                  'Forgot Password, Link Sent',
                                              message: message,
                                              enableLink: true,
                                              onConfirm: () {
                                                context.pushReplacementNamed(
                                                    RouteName.login);
                                              },
                                            );
                                          },
                                          onError: () {
                                            context.customErrorDialog(
                                                'Forgot Password Failed');
                                          },
                                        );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),

                      /// Bottom Login Link
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            TextButton(
                              onPressed: () => context.pop(),
                              child: Text(
                                "Login",
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
              ),
            );
          },
        ),
      ),
    );
  }
}

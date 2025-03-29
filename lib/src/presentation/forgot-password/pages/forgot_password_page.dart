import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/helpers/widgets/custom_text_field.dart';
import 'package:anantla_pay/src/core/main/controllers/auth/authentication_provider.dart';
import 'package:anantla_pay/src/core/main/domain/entities/register_param.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
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
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(40),
                const Text(
                  "Forgot Password",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryBlack,
                  ),
                ),
                const Text(
                  "Please fill the form to reset your password",
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
                if (emailError.value != null) ...[
                  const Gap(10),
                  Text(
                    emailError.value!,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                  ),
                ],

                const Gap(40),

                Button.filled(
                    label: auth.isLoading ? 'Loading...' : 'Forgot Password',
                    color: auth.isLoading ? Colors.grey : AppColor.primaryBlack,
                    textColor: Colors.white,
                    borderRadius: 12,
                    disabled: !isValid,
                    onPressed: () {
                      if (isValid) {
                        ref
                            .read(authenticationProvider.notifier)
                            .forgotPassword(
                                params: RegisterParams(
                                  email: formData.value.email,
                                ),
                                onSuccess: () {
                                  context.showSuccessDialog(
                                    title: 'Forgot Password',
                                    message:
                                        'Forgot Password Success. Please check your email to reset your password',
                                    onConfirm: () {
                                      context.pushReplacementNamed(
                                          RouteName.login);
                                    },
                                  );
                                },
                                onError: () {
                                  context.customErrorDialog(
                                      'Forgot Password Failed');
                                });
                      }
                    }),
                const Gap(20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    TextButton(
                      onPressed: () => context.pop(),
                      child: const Text("Login"),
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
}

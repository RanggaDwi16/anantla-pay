import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/helpers/widgets/custom_text_field.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:anantla_pay/src/presentation/register/controller/register_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegisterPage extends HookConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();

    final passwordVisible = useState(false);
    final confirmPasswordVisible = useState(false);

    final formData =
        useState((name: '', email: '', password: '', confirmPassword: ''));

    final nameError = useState<String?>(null);
    final emailError = useState<String?>(null);
    final passwordError = useState<String?>(null);
    final confirmPasswordError = useState<String?>(null);

    useEffect(() {
      void update() {
        if (!nameController.hasListeners) return;

        formData.value = (
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
          confirmPassword: confirmPasswordController.text,
        );
      }

      nameController.addListener(update);
      emailController.addListener(update);
      passwordController.addListener(update);
      confirmPasswordController.addListener(update);

      return () {
        nameController.removeListener(update);
        emailController.removeListener(update);
        passwordController.removeListener(update);
        confirmPasswordController.removeListener(update);
      };
    }, []);

    final isValid = ref.watch(registerFormValidProvider(formData.value));

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
                  "Create Account",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryBlack,
                  ),
                ),
                const Text(
                  "Please fill the form to continue",
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
                const Gap(40),

                /// Name
                CustomTextField(
                  controller: nameController,
                  labelText: "Full Name",
                  hintText: "Enter your full name",
                  isRequired: true,
                ),
                if (nameError.value != null) ...[
                  const Gap(10),
                  Text(
                    nameError.value!,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                  ),
                ],
                const Gap(20),

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
                const Gap(20),

                /// Password
                CustomTextField(
                  controller: passwordController,
                  labelText: "Password",
                  hintText: "Enter your password",
                  obscureText: !passwordVisible.value,
                  isRequired: true,
                  suffixIcon: IconButton(
                    icon: Icon(
                      passwordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColor.primaryBlack,
                    ),
                    onPressed: () =>
                        passwordVisible.value = !passwordVisible.value,
                  ),
                ),
                if (passwordError.value != null) ...[
                  const Gap(10),
                  Text(
                    passwordError.value!,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                  ),
                ],
                const Gap(20),

                /// Confirm Password
                CustomTextField(
                  controller: confirmPasswordController,
                  labelText: "Confirm Password",
                  hintText: "Re-enter your password",
                  obscureText: !confirmPasswordVisible.value,
                  isRequired: true,
                  suffixIcon: IconButton(
                    icon: Icon(
                      confirmPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColor.primaryBlack,
                    ),
                    onPressed: () => confirmPasswordVisible.value =
                        !confirmPasswordVisible.value,
                  ),
                ),
                if (confirmPasswordError.value != null) ...[
                  const Gap(10),
                  Text(
                    confirmPasswordError.value!,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                  ),
                ],

                const Gap(40),

                Button.filled(
                    label: "Register",
                    color: isValid ? AppColor.primaryBlack : Colors.grey,
                    textColor: Colors.white,
                    borderRadius: 12,
                    onPressed: () {
                      if (isValid) {
                        context.showSuccessDialog(
                          title: "Success!",
                          message: "Your registration is successful",
                          onConfirm: () {
                            context.pop();
                            context.pushReplacementNamed(RouteName.login);
                          },
                        );
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

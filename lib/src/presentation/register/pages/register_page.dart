import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/helpers/widgets/custom_text_field.dart';
import 'package:anantla_pay/src/core/main/controllers/auth/authentication_provider.dart';
import 'package:anantla_pay/src/core/main/domain/entities/register_param.dart';
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
    final auth = ref.watch(authenticationProvider);
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final nomorHpController = useTextEditingController();
    final wishlistChecked = useState<bool>(false);

    final formData = useState((
      name: '',
      email: '',
      nomorHp: '',
    ));

    final nameError = useState<String?>(null);
    final emailError = useState<String?>(null);
    final nomorHpError = useState<String?>(null);

    useEffect(() {
      void update() {
        formData.value = (
          name: nameController.text,
          email: emailController.text,
          nomorHp: nomorHpController.text,
        );

        // Real-time validation
        nameError.value =
            formData.value.name.isEmpty ? 'Name is required' : null;

        emailError.value = !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                .hasMatch(formData.value.email)
            ? 'Invalid email'
            : null;

        nomorHpError.value =
            formData.value.nomorHp.length < 10 ? 'Nomor HP tidak valid' : null;
      }

      nameController.addListener(update);
      emailController.addListener(update);
      nomorHpController.addListener(update);

      return () {
        nameController.removeListener(update);
        emailController.removeListener(update);
        nomorHpController.removeListener(update);
      };
    }, []);

    final isValid = ref.watch(registerFormValidProvider(formData.value)) &&
        nameError.value == null &&
        emailError.value == null &&
        nomorHpError.value == null;

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
                  labelText: "User Name",
                  hintText: "Enter your user name",
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

                /// Nomor HP
                CustomTextField(
                  controller: nomorHpController,
                  labelText: "Nomor HP",
                  hintText: "08xxxxxxxxxx",
                  isRequired: true,
                ),
                if (nomorHpError.value != null) ...[
                  const Gap(10),
                  Text(
                    nomorHpError.value!,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                  ),
                ],
                const Gap(20),

                /// Wishlist Checkbox
                const Text(
                  "Do you want to be included in the wishlist?",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const Gap(5),
                Text(
                  "By enabling the checkbox below, you will be included in the list of people who will be notified when the app is fully released.",
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
                const Gap(10),
                Row(
                  children: [
                    Checkbox(
                      value: wishlistChecked.value,
                      onChanged: (value) {
                        wishlistChecked.value = value ?? false;
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      activeColor: AppColor.primaryBlack,
                    ),
                    const Text(
                      "Yes, I want in",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),

                const Gap(40),

                Button.filled(
                    label: auth.isLoading ? 'Loading...' : 'Register',
                    color: auth.isLoading ? Colors.grey : AppColor.primaryBlack,
                    textColor: Colors.white,
                    borderRadius: 12,
                    disabled: !isValid,
                    onPressed: () {
                      if (isValid) {
                        ref.read(authenticationProvider.notifier).register(
                            params: RegisterParams(
                              username: formData.value.name,
                              email: formData.value.email,
                              phone: formData.value.nomorHp,
                              countryCode: 'ID',
                              clientId: 25,
                            ),
                            onSuccess: () {
                              context.showSuccessDialog(
                                title: 'Register',
                                message:
                                    'Register Success, We sent your password to your email',
                                onConfirm: () {
                                  context.pushReplacementNamed(RouteName.login);
                                },
                              );
                            },
                            onError: () {
                              context.customErrorDialog('Register Failed');
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

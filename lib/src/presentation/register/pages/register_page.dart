import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/helpers/widgets/custom_text_field.dart';
import 'package:anantla_pay/src/core/main/controllers/auth/authentication_provider.dart';
import 'package:anantla_pay/src/core/main/domain/entities/register_param.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:anantla_pay/src/presentation/register/controller/action/register_action.dart';
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

        nomorHpError.value = !formData.value.nomorHp.startsWith('62')
            ? 'Nomor HP has to start with 62'
            : formData.value.nomorHp.length < 10
                ? 'Nomor HP must be at least 10 digits'
                : null;
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
                Text(
                  "Create Account",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                ),

                Text(
                  "Create, send, receive, and save effortlessly.",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColor.textGray,
                      ),
                ),

                const Gap(40),

                /// Name
                CustomTextField(
                  prefixIcon: Image.asset(
                    Assets.icons.person.path,
                    width: 20,
                  ),
                  controller: nameController,
                  labelText: "User Name",
                  hintText: "Enter your user name",
                  isRequired: true,
                ),
                if (nameError.value != null) ...[
                  const Gap(10),
                  Text(
                    nameError.value!,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                  ),
                ],
                const Gap(20),

                /// Email
                CustomTextField(
                  prefixIcon: Image.asset(
                    Assets.icons.email.path,
                    width: 20,
                  ),
                  controller: emailController,
                  labelText: "Email",
                  hintText: "Enter your email",
                  isRequired: true,
                ),
                if (emailError.value != null) ...[
                  const Gap(10),
                  Text(
                    emailError.value!,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                  ),
                ],
                const Gap(20),

                /// Nomor HP
                CustomTextField(
                  prefixIcon: Image.asset(
                    Assets.icons.phone.path,
                    width: 20,
                  ),
                  controller: nomorHpController,
                  labelText: "Phone Number",
                  hintText: "628XXXXXXXX",
                  keyboardType: TextInputType.phone,
                  isRequired: true,
                ),
                if (nomorHpError.value != null) ...[
                  const Gap(10),
                  Text(
                    nomorHpError.value!,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                  ),
                ],
                // const Gap(20),

                // /// Wishlist Checkbox
                // Text(
                //   "Do you want to be included in the wishlist?",
                //   style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                //         fontWeight: FontWeight.w600,
                //       ),
                // ),

                // const Gap(5),
                // Text(
                //   "By enabling the checkbox below, you will be included in the list of people who will be notified when the app is fully released.",
                //   style: Theme.of(context).textTheme.bodySmall?.copyWith(
                //         color: AppColor.textGray,
                //       ),
                // ),

                // const Gap(10),
                // Row(
                //   children: [
                //     Checkbox(
                //       value: wishlistChecked.value,
                //       onChanged: (value) {
                //         wishlistChecked.value = value ?? false;
                //         if (wishlistChecked.value) {
                //           addToWishlist(ref: ref, context: context);
                //         }
                //       },
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(4),
                //       ),
                //       activeColor: AppColor.primaryColor,
                //     ),
                //     Text(
                //       "Yes, I want in",
                //       style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
                //     ),
                //   ],
                // ),

                const Gap(40),

                Button.filled(
                    label: auth.isLoading ? 'Loading...' : 'Register',
                    color: auth.isLoading ? Colors.grey : AppColor.primaryColor,
                    textColor: Colors.white,
                    disabled: !isValid,
                    onPressed: () {
                      if (isValid) {
                        registerUser(
                          ref: ref,
                          context: context,
                          params: RegisterParams(
                            username: formData.value.name,
                            email: formData.value.email,
                            phone: formData.value.nomorHp,
                            countryCode: 'ID',
                            clientId: 2,
                          ),
                        );
                      }
                    }),
                const Gap(20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    TextButton(
                      onPressed: () => context.pop(),
                      child: Text(
                        "Login",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColor.primaryColor,
                            ),
                      ),
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

import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/main/controllers/auth/authentication_provider.dart';
import 'package:anantla_pay/src/core/main/domain/entities/otp_params.dart';
import 'package:anantla_pay/src/core/provider/token_manager_provider.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class VerifyOtpLoginPage extends ConsumerStatefulWidget {
  final String email;
  const VerifyOtpLoginPage({super.key, required this.email});

  @override
  ConsumerState<VerifyOtpLoginPage> createState() => _VerifyOtpLoginPageState();
}

class _VerifyOtpLoginPageState extends ConsumerState<VerifyOtpLoginPage> {
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    for (var controller in _controllers) {
      controller.addListener(_checkFilledFields);
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNodes[0].requestFocus();
    });
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller
        ..removeListener(_checkFilledFields)
        ..dispose();
    }
    for (final node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty && index < 5) {
      _focusNodes[index + 1].requestFocus();
    }
  }

  void _checkFilledFields() {
    final allFilled = _controllers.every((c) => c.text.isNotEmpty);
    if (allFilled != isButtonEnabled) {
      setState(() {
        isButtonEnabled = allFilled;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final verifyOtp = ref.watch(authenticationProvider);
    return Scaffold(
      backgroundColor: AppColor.secondaryBackground,
      appBar: CustomAppBar(
        backgroundColor: AppColor.secondaryBackground,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: GestureDetector(
            onTap: () => context.pop(),
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: AppColor.primaryWhite,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  Assets.icons.arrowLeft.path,
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Verification Code',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColor.primaryBlack,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Gap(8),
            Text(
              'We Have Sent the Code verification to notification',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColor.textGray,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (index) {
                return SizedBox(
                  width: 48,
                  height: 58,
                  child: TextField(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    decoration: InputDecoration(
                      counterText: '',
                      filled: true,
                      fillColor: AppColor.primaryWhite,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ),
                    onChanged: (value) => _onChanged(value, index),
                  ),
                );
              }),
            ),
            const Gap(24),
            Button.filled(
              disabled: !isButtonEnabled,
              color: verifyOtp.isLoading
                  ? AppColor.textGray
                  : AppColor.primaryColor,
              onPressed: () {
                print(_controllers.map((e) => e.text).join());
                ref.read(authenticationProvider.notifier).verifOtpLogin(
                      params: OtpParams(
                        otpCode: _controllers.map((e) => e.text).join(),
                        email: widget.email, // ✅ Use email from login input
                      ),
                      onSuccess: () async {
                        context.pushNamed(RouteName.setUpBiometric);
                      },
                      onError: () {
                        context.customErrorDialog(
                          'Invalid OTP code. Please try again.',
                        );
                      },
                    );
              },
              label: verifyOtp.isLoading ? 'Verifying...' : 'Verify',
            )
          ],
        ),
      ),
    );
  }
}

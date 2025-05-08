import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/provider/token_manager_provider.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SetUpBiometricPage extends ConsumerWidget {
  const SetUpBiometricPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 160,
                    height: 160,
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      // color: AppColor.primaryWhite,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      Assets.icons.icFingerprint.path,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    'STAY SECURE WITH BIOMETRICS',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const Gap(8),
                  Text(
                    'Use biometrics to quickly and securely log in, approve transactions and unlock this app.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 16,
                          color: AppColor.primaryBlack.withOpacity(0.6),
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Button.filled(
              label: 'Set Up Biometrics',
              onPressed: () async {
                final tokenManager =
                    await ref.read(tokenManagerProvider.future);
                await tokenManager.setFingerprintEnabled(true);
                context.goNamed(RouteName.successSetUpBiometric);
              },
            ),
            const Gap(16),
            Button.outlined(
              label: 'Skip',
              onPressed: () async {
                final tokenManager =
                    await ref.read(tokenManagerProvider.future);
                await tokenManager.setFingerprintEnabled(false);
                context.successOtpDialog(onComplete: () {
                  context.goNamed(RouteName.main);
                });
              },
            ),
            const Gap(12),
          ],
        ),
      ),
    );
  }
}

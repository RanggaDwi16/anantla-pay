import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/main/controllers/auth/authentication_provider.dart';
import 'package:anantla_pay/src/core/provider/token_manager_provider.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:anantla_pay/src/presentation/setting/widgets/setting_menu_item.dart';
import 'package:anantla_pay/src/presentation/setting/widgets/user_info_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColor.secondaryBackground,
      appBar: CustomAppBar(
        title: 'Account',
        centertitle: true,
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserInfoHeader(),
              Gap(24),
              Text(
                'General',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Gap(12),
              SettingMenuItem(
                title: 'Payment Methods',
                icon: Assets.icons.settings.walletLinear.path,
                onTap: () {},
              ),
              Gap(12),
              SettingMenuItem(
                title: 'Personal Info',
                icon: Assets.icons.settings.person.path,
                onTap: () {},
              ),
              Gap(12),
              SettingMenuItem(
                title: 'Security',
                icon: Assets.icons.settings.security.path,
                onTap: () {},
              ),
              Gap(12),
              SettingMenuItem(
                title: 'Notification',
                icon: Assets.icons.settings.notification.path,
                onTap: () {},
              ),
              Gap(12),
              SettingMenuItem(
                title: 'Language',
                icon: Assets.icons.settings.language.path,
                trailingText: 'English (US)',
                onTap: () {},
              ),
              Gap(24),
              Text(
                'Help & Info',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Gap(12),
              SettingMenuItem(
                title: 'Help Center',
                icon: Assets.icons.settings.customerService.path,
                onTap: () => context.pushNamed(RouteName.help),
              ),
              Gap(12),
              SettingMenuItem(
                title: 'Privacy Policy',
                icon: Assets.icons.settings.privacyPolicy.path,
                onTap: () {},
              ),
              Gap(12),
              SettingMenuItem(
                title: 'About CashlessPay App',
                icon: Assets.icons.settings.information.path,
                onTap: () {},
              ),
              Gap(12),
              SettingMenuItem(
                title: 'Logout',
                icon: Assets.icons.settings.logout.path,
                onTap: () {
                  ref.read(authenticationProvider.notifier).logout(
                      onSuccess: () {
                    context.showSuccessDialog(
                      title: 'Logout',
                      message: 'Logout Success',
                      onConfirm: () async {
                        final tokenManager =
                            await ref.read(tokenManagerProvider.future);
                        await tokenManager.removeData();

                        context.goNamed(RouteName.login);
                      },
                    );
                  }, onError: () {
                    print('Error Logout');
                  });
                },
              ),
              Gap(24),
            ],
          ),
        ),
      ),
    );
  }
}

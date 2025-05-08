import 'package:anantla_pay/src/presentation/add_money/controllers/top_up_data_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';

class SuccessTopUpPage extends ConsumerStatefulWidget {
  const SuccessTopUpPage({super.key});

  @override
  ConsumerState<SuccessTopUpPage> createState() => _SuccessTopUpPageState();
}

class _SuccessTopUpPageState extends ConsumerState<SuccessTopUpPage> {
  bool isTopUpComplete = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isTopUpComplete = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final topUpData = ref.watch(topUpDataNotifierProvider);
    return WillPopScope(
      onWillPop: () async {
        ref.read(topUpDataNotifierProvider.notifier).reset();
        context.goNamed(RouteName.main);
        return true;
      },
      child: Scaffold(
        backgroundColor: AppColor.secondaryBackground,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Gap(1),

              // ✅ Center Card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 32),
                      decoration: BoxDecoration(
                        color: AppColor.primaryWhite,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            transitionBuilder: (child, animation) =>
                                ScaleTransition(scale: animation, child: child),
                            child: Container(
                              key: ValueKey(isTopUpComplete),
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: isTopUpComplete
                                    ? AppColor.primaryColor
                                    : AppColor.primaryColor.withOpacity(0.3),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: isTopUpComplete
                                    ? const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 40,
                                      )
                                    : const SizedBox(
                                        width: 32,
                                        height: 32,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 3,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                          const Gap(24),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            transitionBuilder: (child, animation) =>
                                FadeTransition(
                                    opacity: animation, child: child),
                            child: Text(
                              isTopUpComplete
                                  ? 'Your money has been transferred'
                                  : 'Your money is being transferred',
                              key: ValueKey('topup_title_$isTopUpComplete'),
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800,
                                  ),
                            ),
                          ),
                          const Gap(12),
                          Text.rich(
                            textAlign: TextAlign.center,
                            TextSpan(
                              text:
                                  'Sit back and relax, we will process your transfer of ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: AppColor.textGray),
                              children: [
                                TextSpan(
                                  text:
                                      '${topUpData.topUpAmount} ${topUpData.toCurrency} ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.primaryBlack,
                                      ),
                                ),
                                const TextSpan(text: 'to '),
                                TextSpan(
                                  text: '${topUpData.virtualAccountName}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.primaryBlack,
                                      ),
                                ),
                                const TextSpan(text: ' immediately.'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // ✅ Bottom Button
              Padding(
                padding: const EdgeInsets.all(20),
                child: Button.filled(
                  onPressed: () {
                    context.goNamed(RouteName.main);
                    ref.read(topUpDataNotifierProvider.notifier).reset();
                  },
                  label: 'Back to My Balance',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

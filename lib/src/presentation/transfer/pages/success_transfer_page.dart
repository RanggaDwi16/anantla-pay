import 'package:anantla_pay/src/core/helpers/formatters/string_format.dart';
import 'package:anantla_pay/src/presentation/account/controllers/get_balance/fetch_balance_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/get_transaction/fetch_transaction_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/pages/transfer_amount_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/presentation/transfer/controllers/transfer_data_provider.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';

class SuccessTransferPage extends ConsumerStatefulWidget {
  const SuccessTransferPage({super.key});

  @override
  ConsumerState<SuccessTransferPage> createState() =>
      _SuccessTransferPageState();
}

class _SuccessTransferPageState extends ConsumerState<SuccessTransferPage> {
  bool isTransferComplete = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isTransferComplete = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final transferData = ref.watch(transferDataNotifierProvider);
    bool isBankTransfer =
        transferData.transferType == TransferType.internal ? false : true;

    return WillPopScope(
      onWillPop: () async {
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
                              key: ValueKey(isTransferComplete),
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: isTransferComplete
                                    ? AppColor.primaryColor
                                    : AppColor.primaryColor.withOpacity(0.3),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: isTransferComplete
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
                              isTransferComplete
                                  ? 'Your money has been transferred'
                                  : 'Your money is being transferred',
                              key: ValueKey('title_$isTransferComplete'),
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
                                if (isBankTransfer) ...[
                                  TextSpan(
                                    text: formatCurrency(
                                      amount:
                                          transferData.amountTransferBank ?? 0,
                                      currencyCode:
                                          transferData.fromCurrency ?? '',
                                    ),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.primaryBlack,
                                        ),
                                  ),
                                  const TextSpan(text: ' to '),
                                  TextSpan(
                                    text: '${transferData.virtualAccountName}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.primaryBlack,
                                        ),
                                  ),
                                ] else ...[
                                  TextSpan(
                                    text: formatCurrency(
                                        amount: transferData.toAmount ?? 0,
                                        currencyCode:
                                            transferData.toCurrency ?? '',
                                        isTransferAmount:
                                            transferData.fromCurrency !=
                                                transferData.toCurrency),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.primaryBlack,
                                        ),
                                  ),
                                  const TextSpan(text: ' to '),
                                  TextSpan(
                                    text: '${transferData.toName}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.primaryBlack,
                                        ),
                                  ),
                                ],
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
              Padding(
                padding: const EdgeInsets.all(20),
                child: Button.filled(
                  onPressed: () {
                    ref.read(convertedAmountProvider.notifier).state = '';
                    context.goNamed(RouteName.main);
                  },
                  disabled: !isTransferComplete,
                  label: 'Back to My Balance',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

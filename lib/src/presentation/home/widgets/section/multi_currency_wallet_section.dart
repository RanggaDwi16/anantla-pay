import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/presentation/home/controllers/get_balance/fetch_balance_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anantla_pay/src/core/helpers/formatters/string_format.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:go_router/go_router.dart';

class MultiCurrencyWalletSection extends ConsumerWidget {
  const MultiCurrencyWalletSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wallets = ref.watch(fetchBalanceProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Multi-currency Wallet',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: AppColor.primaryBlack,
              ),
        ),
        const Gap(16),
        wallets.when(
          data: (data) {
            if (data!.isEmpty) {
              return const Center(
                  child: Text('No wallets found. Please create a wallet.'));
            }
            return SizedBox(
              height: context.deviceHeight * 0.10,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                separatorBuilder: (_, __) => const Gap(12),
                itemBuilder: (context, index) {
                  final wallet = data[index];
                  final currency = data[index].currency;
                  final number = data[index].walletCode;
                  final flag = getCurrencyFlagAsset(wallet.currency);

                  return GestureDetector(
                    onTap: () {
                      context.pushNamed(
                        RouteName.detailWallet,
                        extra: wallet, // ✅ Kirim wallet sebagai parameter
                      );
                    },
                    child: Container(
                      width: 120,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  flag,
                                  width: 24,
                                  height: 24,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                currency ?? '',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Text(
                            formatCurrency(
                              amount: wallet.balance ?? 0,
                              currencyCode: wallet.currency ?? '',
                              isTransferAmount: wallet.currency != 'IDR',
                            ),
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
          error: (error, stack) {
            return Center(
              child: Text(
                'Error: $error',
                style: const TextStyle(
                  color: AppColor.textGray,
                  fontSize: 14,
                ),
              ),
            );
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        )
      ],
    );
  }
}

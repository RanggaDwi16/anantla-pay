import 'package:anantla_pay/src/core/helpers/formatters/string_format.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/presentation/account/controllers/get_balance/fetch_balance_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/top_up/top_up_data_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/controllers/transfer_data_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class BalanceSection extends ConsumerWidget {
  const BalanceSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balance = ref.watch(fetchBalanceProvider);

    return balance.when(
      loading: () => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          height: 170,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      error: (error, stack) => _buildBalanceCard(context, '0.00', '', 0, ref),
      data: (data) => _buildBalanceCard(context, data!.balance.toString(),
          data.currency ?? '', data.walletId ?? 0, ref),
    );
  }

  Widget _buildBalanceCard(BuildContext context, String balance,
      String currency, int walletId, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'Virtual Account',
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Gap(10),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.account_balance_wallet_rounded,
                      color: Colors.white, size: 32),
                  const Gap(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Total Balance",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '$currency ${formatRupiah(balance)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Gap(20),
              Row(
                children: [
                  Expanded(
                    child: _actionButton(
                      context,
                      label: "Top Up",
                      onPressed: () {
                        print('walletId: $walletId'); // Debugging print

                        ref
                            .read(topUpDataNotifierProvider.notifier)
                            .setWalletId(walletId);

                        // Verify if it's stored correctly
                        final storedWalletId =
                            ref.read(topUpDataNotifierProvider).walletId;
                        print('Stored Wallet ID in Provider: $storedWalletId');

                        context.pushNamed(RouteName.topUp);
                      },
                    ),
                  ),
                  // const SizedBox(width: 8),
                  // Expanded(
                  //   child: _actionButton(
                  //     context,
                  //     label: "Withdraw",
                  //     onPressed: () => context.pushNamed(
                  //       RouteName.withdraw,
                  //       extra: walletId,
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _actionButton(context, label: "Transfer",
                        onPressed: () {
                      ref
                          .read(transferDataNotifierProvider.notifier)
                          .setFromWalletId(walletId);
                      ref.read(transferDataNotifierProvider.notifier).setCurrencies(
                          fromCurrency: currency);
                      context.pushNamed(RouteName.transfer);
                    }),
                  ),
                ],
              ),
            ],
          ),
        ),
        Gap(20),
        Button.filled(
          onPressed: () {
            ref.read(topUpDataNotifierProvider.notifier).setWalletId(walletId);
            context.pushNamed(RouteName.pay);
          },
          label: 'Simulate Top Up',
          color: AppColor.primaryBlack,
        )
      ],
    );
  }

  Widget _actionButton(BuildContext context,
      {required String label, required VoidCallback onPressed}) {
    return Button.filled(
      onPressed: onPressed,
      label: label,
      color: Colors.white,
      textColor: AppColor.primaryBlack,
      borderRadius: 10,
      height: 40,
    );
  }
}

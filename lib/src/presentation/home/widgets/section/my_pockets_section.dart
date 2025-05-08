import 'package:anantla_pay/src/core/helpers/formatters/string_format.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/presentation/home/controllers/get_balance/fetch_balance_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class MyPocketsSection extends ConsumerWidget {
  const MyPocketsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wallets = ref.watch(fetchBalanceProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          'My Pockets',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: AppColor.primaryBlack,
              ),
        ),
        const Gap(16),

        // Grid layout
        wallets.when(
          data: (data) {
            final items = [
              const _CreateWalletCard(),
              ...data!.map((wallet) => _WalletCard(wallet: wallet)),
            ];

            return GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.2,
              children: items,
            );
          },
          error: (error, stack) => Text('Error: $error'),
          loading: () => const CircularProgressIndicator(),
        ),
      ],
    );
  }
}

class _CreateWalletCard extends StatelessWidget {
  const _CreateWalletCard();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(RouteName.createWallet),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: AppColor.secondaryBackground,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: AppColor.primaryBlack,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, color: Colors.white),
            ),
            const Gap(8),
            const Text(
              'Create a new',
              style: TextStyle(fontSize: 14, color: AppColor.primaryBlack),
            ),
            const Text(
              'Wallet',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColor.primaryBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WalletCard extends StatelessWidget {
  final dynamic wallet; // Ganti `dynamic` dengan tipe wallet kamu

  const _WalletCard({required this.wallet});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: Image.asset(
              getCurrencyFlagAsset(wallet.currency),
              width: 32,
              height: 32,
              fit: BoxFit.cover,
            ),
          ),
          const Gap(8),
          Text(
            wallet.currency ?? '',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColor.primaryWhite,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const Gap(4),
          Text(
            formatCurrency(
              amount: wallet.balance,
              currencyCode: wallet.currency,
              isTransferAmount: wallet.currency != 'IDR',
            ),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColor.primaryWhite,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

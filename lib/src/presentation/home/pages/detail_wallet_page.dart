import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/presentation/account/controllers/top_up/top_up_data_provider.dart';
import 'package:anantla_pay/src/presentation/home/controllers/get_user/fetch_user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/helpers/formatters/string_format.dart';
import 'package:anantla_pay/src/core/helpers/widgets/custom_search_field.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/presentation/home/domain/entities/balance_model.dart';
import 'package:anantla_pay/src/presentation/home/widgets/all_transaction/transaction_item_widget.dart';
import 'package:anantla_pay/src/presentation/wallet/data/transaction_data.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class DetailWalletPage extends ConsumerWidget {
  final BalanceModel wallet;

  const DetailWalletPage({super.key, required this.wallet});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flag = getCurrencyFlagAsset(wallet.currency);
    final formattedBalance = formatCurrency(
      amount: wallet.balance ?? 0,
      currencyCode: wallet.currency ?? '',
    );
    final user = ref.watch(fetchUserProvider);
    return Scaffold(
      backgroundColor: AppColor.secondaryBackground,
      appBar: CustomAppBar(
        backgroundColor: AppColor.secondaryBackground,
        centertitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: AppColor.primaryWhite, // abu-abu terang sesuai gambar
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
      body: Column(
        children: [
          Gap(24),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Flag

                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      flag, // Ganti dengan path yang sesuai
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Gap(24),

                // Amount Text
                Text(
                  formattedBalance,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontSize: 46,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primaryBlack,
                      ),
                ),
                // const SizedBox(height: 8),
                Gap(12),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildActionButton(
                          Assets.icons.addmoney.path, 'Add Money', onTap: () {
                        ref
                            .read(topUpDataNotifierProvider.notifier)
                            .setVirtualAccountData(
                                virtualAccountName: user.value!.username,
                                virtualAccountEmail: user.value!.email,
                                virtualAccountPhone: user.value!.phone);
                        context.pushNamed(RouteName.addMoney);
                      }),
                      _buildActionButton(Assets.icons.send.path, 'Transfer',
                          onTap: () => context.pushNamed(RouteName.sendingTo)),
                      _buildActionButton(
                          Assets.icons.outOutlined.path, 'Request', onTap: () {
                        context.pushNamed(RouteName.comingSoon);
                      }),
                      _buildActionButton(Assets.icons.scan.path, 'Scan & Pay',
                          onTap: () {
                        context.pushNamed(RouteName.qrisScanner);
                      }),
                    ],
                  ),
                ),

                //jika belum ekyc, your balance is limited to 5,000,000 IDR until you have finished ekyc process, dan keluarkan button do ekyc now
                if (wallet.isLimited == true) ...[
                  Gap(12),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Your balance is limited to 5,000,000 until you have finished ekyc process',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColor.textError,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Gap(12),
                  // Button E-KYC Now
                  Button.filled(
                    width: 200,
                    onPressed: () {
                      context.pushNamed(RouteName.ekyc);
                    },
                    label: 'EYC Now',
                  ),
                ],

                // Conversion Rate
                // RichText(
                //   text: TextSpan(
                //     text: '1 SGD = ',
                //     style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                //           color: AppColor.textGray,
                //         ),
                //     children: [
                //       TextSpan(
                //         text: '11,421.20 IDR',
                //         style: const TextStyle(
                //           fontWeight: FontWeight.w600,
                //           color: AppColor.primaryBlack,
                //         ),
                //       ),
                //       TextSpan(
                //         text: ', As of today',
                //         style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                //               color: AppColor.textGray,
                //             ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
          Gap(24),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.primaryWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Transactions:',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: AppColor.primaryBlack,
                                  ),
                        ),
                      ],
                    ),
                    const Gap(24),
                    CustomSearchField(),
                    const Gap(24),

                    /// Scrollable items only
                    Expanded(
                      child: ListView.builder(
                        itemCount: transactions.length,
                        itemBuilder: (context, index) {
                          final tx = transactions[index];
                          return TransactionItem(
                            name: tx['name'] ?? '',
                            date: tx['date'] ?? '',
                            amount: tx['amount'] ?? '',
                            currency: tx['currency'] ?? '',
                            iconPath: tx['icon'] ?? '',
                            statusLabel: tx['statusLabel'] ?? '',
                            statusColor: parseColor(tx['statusColor']),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String iconPath, String label,
      {Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: AppColor.primaryColor,
              shape: BoxShape.circle,
            ),
            child: Image.asset(iconPath,
                width: 24, height: 24, color: AppColor.primaryColor2),
          ),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

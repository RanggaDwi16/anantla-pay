import 'package:anantla_pay/src/core/helpers/formatters/string_format.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:anantla_pay/src/presentation/home/controllers/get_balance/fetch_balance_provider.dart';
import 'package:anantla_pay/src/presentation/home/domain/entities/balance_model.dart';
import 'package:anantla_pay/src/presentation/add_money/controllers/top_up_data_provider.dart';
import 'package:anantla_pay/src/presentation/home/controllers/get_user/fetch_user_provider.dart';
import 'package:anantla_pay/src/presentation/home/provider/balance_visibility_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/controllers/get_exhange_rate/fetch_exhange_rate_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/controllers/transfer_data_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final selectedWalletProvider = StateProvider<int>((ref) => 0);

class BalanceSummarySection extends HookConsumerWidget {
  const BalanceSummarySection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletsAsync = ref.watch(fetchBalanceProvider);
    final selectedIndex = ref.watch(selectedWalletProvider);
    final user = ref.watch(fetchUserProvider);
    final isBalanceVisible = ref.watch(balanceVisibilityProvider);
    final isBalanceVisibleNotifier =
        ref.read(balanceVisibilityProvider.notifier);

    return walletsAsync.when(
      data: (data) {
        if (data!.isEmpty) {
          return const Center(
              child: Text('No wallets found. Please create a wallet.'));
        }

        final selectedWallet = data[selectedIndex];
        final currency = selectedWallet.currency ?? '';
        final balance = selectedWallet.balance ?? 0;

        return Column(
          children: [
            // Header bar
            SizedBox(
              height: 40,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Text(
                    'Available balance',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColor.textGray,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () async {
                        final newSelectedIndex =
                            await showModalBottomSheet<int>(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(24)),
                          ),
                          builder: (_) => _WalletSelectorBottomSheet(
                            wallets: data,
                            selectedIndex: selectedIndex,
                          ),
                        );
                        if (newSelectedIndex != null) {
                          ref.read(selectedWalletProvider.notifier).state =
                              newSelectedIndex;
                        }
                      },
                      child: Container(
                        width: context.deviceWidth * 0.18,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColor.primaryWhite,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Row(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                getCurrencyFlagAsset(currency),
                                width: 20,
                                height: 20,
                              ),
                            ),
                            const Icon(Icons.keyboard_arrow_down_rounded,
                                size: 20, color: AppColor.textGray),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(
                        isBalanceVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        size: 20,
                        color: AppColor.textGray,
                      ),
                      onPressed: () {
                        isBalanceVisibleNotifier.state = !isBalanceVisible;
                      },
                    ),
                  ),
                ],
              ),
            ),

            const Gap(14),

            // Balance text / shimmer
            SizedBox(
              height: 58,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Shimmer background (invisible if visible)
                  if (!isBalanceVisible)
                    SizedBox(
                      width: _getTextWidth(context, balance, currency),
                      height: 48,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ),
                  // Formatted balance text (invisible if not visible)
                  Visibility(
                    visible: isBalanceVisible,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: Text(
                      formatCurrency(
                        amount: balance,
                        currencyCode: currency,
                        isTransferAmount: currency != 'IDR',
                      ),
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 48,
                              ),
                    ),
                  ),
                ],
              ),
            ),

            const Gap(20),

            // Received / Spent Box
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  _buildInfoBox(
                    context,
                    icon: Icons.arrow_upward,
                    color: AppColor.primaryColor2,
                    label: 'Received',
                    amount: selectedWallet.totalReceived ?? 0,
                    currency: currency,
                    onTap: () => context.pushNamed(RouteName.receive),
                    isVisible: isBalanceVisible,
                  ),
                  Container(width: 1, height: 40, color: Colors.grey.shade300),
                  _buildInfoBox(
                    context,
                    icon: Icons.arrow_downward,
                    color: AppColor.errorRed,
                    label: 'Spent',
                    amount: selectedWallet.totalSpent ?? 0,
                    currency: currency,
                    onTap: () => context.pushNamed(RouteName.spent),
                    isVisible: isBalanceVisible,
                  ),
                ],
              ),
            ),

            const Gap(24),

            // Action buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildActionButton(Assets.icons.addmoney.path, 'Add Money',
                    onTap: () {
                  ref
                      .read(topUpDataNotifierProvider.notifier)
                      .setVirtualAccountData(
                        virtualAccountName: user.value!.username ?? '',
                        virtualAccountEmail: user.value!.email ?? '',
                        virtualAccountPhone: user.value!.phone ?? '',
                      );
                  ref
                      .read(topUpDataNotifierProvider.notifier)
                      .setFromWalletId(selectedWallet.walletId!);
                  context.pushNamed(RouteName.addMoney);
                }),
                _buildActionButton(Assets.icons.send.path, 'Transfer',
                    onTap: () {
                  ref
                      .read(transferDataNotifierProvider.notifier)
                      .setFromWalletId(selectedWallet.walletId!);
                  ref
                      .read(transferDataNotifierProvider.notifier)
                      .setCurrencies(fromCurrency: currency);
                  ref
                      .read(transferDataNotifierProvider.notifier)
                      .setFromBalance(balance);
                  context.pushNamed(RouteName.sendingTo);
                }),
                _buildActionButton(
                  Assets.icons.outOutlined.path,
                  'Request',
                  disabled: true,
                ),
                _buildActionButton(Assets.icons.scan.path, 'Scan & Pay',
                    onTap: () {
                  context.pushNamed(RouteName.qrisScanner);
                }),
              ],
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) =>
          Center(child: Text('Failed to load wallets: $error')),
    );
  }

  Widget _buildInfoBox(
    BuildContext context, {
    required IconData icon,
    required Color color,
    required String label,
    required num amount,
    required String currency,
    required VoidCallback onTap,
    required bool isVisible,
  }) {
    final width = _getTextWidth(context, amount, currency);

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: Theme.of(context).textTheme.labelLarge),
                const SizedBox(height: 4),
                SizedBox(
                  height: 20,
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      if (!isVisible)
                        Container(
                          width: 30,
                          height: 18,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      Visibility(
                        visible: isVisible,
                        maintainSize: true,
                        maintainAnimation: true,
                        maintainState: true,
                        child: Text(
                          formatCurrency(
                            amount: amount.toDouble(),
                            currencyCode: currency,
                            isTransferAmount: currency.toUpperCase() != 'IDR',
                          ),
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(String iconPath, String label,
      {Function()? onTap, bool disabled = false}) {
    return GestureDetector(
      onTap: disabled ? null : onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: disabled ? Colors.grey.shade400 : AppColor.primaryColor,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              iconPath,
              width: 24,
              height: 24,
              color: AppColor.primaryWhite,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: disabled ? Colors.grey[350] : AppColor.primaryBlack,
            ),
          ),
        ],
      ),
    );
  }

  double _getTextWidth(BuildContext context, num amount, String currency) {
    final text = formatCurrency(
      amount: amount.toDouble(),
      currencyCode: currency,
      isTransferAmount: currency.toUpperCase() != 'IDR',
    );

    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    return textPainter.size.width;
  }
}

class _WalletSelectorBottomSheet extends StatelessWidget {
  final List<BalanceModel> wallets;
  final int selectedIndex;

  const _WalletSelectorBottomSheet({
    super.key,
    required this.wallets,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      shrinkWrap: true,
      itemCount: wallets.length,
      separatorBuilder: (_, __) => const Gap(12),
      itemBuilder: (context, index) {
        final wallet = wallets[index];
        final isSelected = index == selectedIndex;

        return ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          tileColor: isSelected ? AppColor.primaryColor.withOpacity(0.1) : null,
          leading: ClipOval(
            child: Image.asset(
              getCurrencyFlagAsset(wallet.currency ?? ''),
              width: 32,
              height: 32,
            ),
          ),
          title: Text(wallet.currency ?? ''),
          // subtitle: Text(wallet.walletCode ?? ''),
          trailing: isSelected
              ? const Icon(Icons.check_circle, color: AppColor.primaryColor)
              : null,
          onTap: () => Navigator.pop(context, index),
        );
      },
    );
  }

  double _getTextWidth(BuildContext context, num amount, String currency) {
    final text = formatCurrency(
      amount: amount.toDouble(),
      currencyCode: currency,
      isTransferAmount: currency.toUpperCase() != 'IDR',
    );

    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    return textPainter.size.width;
  }
}

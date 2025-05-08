import 'package:anantla_pay/src/core/helpers/formatters/string_format.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/presentation/account/controllers/get_balance/fetch_balance_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/controllers/get_all_wallet/fetch_all_wallet_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/controllers/transfer_data_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/entities/wallet_model.dart';
import 'package:anantla_pay/src/presentation/transfer/pages/sending_to_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class RecipientFilterSection extends ConsumerStatefulWidget {
  const RecipientFilterSection({super.key});

  @override
  ConsumerState<RecipientFilterSection> createState() =>
      _RecipientFilterSectionState();
}

class _RecipientFilterSectionState
    extends ConsumerState<RecipientFilterSection> {
  String selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    final allWallets = ref.watch(fetchAllWalletProvider);
    final myWallets = ref.watch(fetchBalanceProvider);
    final searchQuery = ref.watch(searchQueryProvider).toLowerCase();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Filter Buttons
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            FilterChipButton(
              label: 'All',
              isSelected: selectedFilter == 'All',
              onTap: () => setState(() => selectedFilter = 'All'),
            ),
            FilterChipButton(
              label: 'My accounts',
              isSelected: selectedFilter == 'My accounts',
              onTap: () => setState(() => selectedFilter = 'My accounts'),
            ),
          ],
        ),
        const Gap(20),

        // Wallet List with Search Filtering
        selectedFilter == 'All'
            ? allWallets.when(
                data: (wallets) {
                  final filteredWallets = wallets
                      .whereType<WalletModel>()
                      .where((wallet) =>
                          (wallet.username?.toLowerCase() ?? '')
                              .contains(searchQuery) ||
                          (wallet.walletId?.toString().toLowerCase() ?? '')
                              .contains(searchQuery) ||
                          (wallet.currency?.toLowerCase() ?? '')
                              .contains(searchQuery))
                      .toList();

                  return Column(
                    children: filteredWallets
                        .map((wallet) => WalletListItem(
                              onTap: () {
                                final notifier = ref.read(
                                    transferDataNotifierProvider.notifier);

                                notifier.setCurrencies(
                                    toCurrency: wallet.currency ?? '');
                                notifier.setToName(wallet.username ?? '');
                                notifier.setToPhone(wallet.phone ?? '');
                                notifier.setToWalletId(wallet.walletId);
                                context.pushNamed(RouteName.transferAmount);
                              },
                              flagAssetPath: wallet.currency ?? '',
                              title: wallet.username ?? '',
                              subtitle: wallet.currency ?? '',
                            ))
                        .toList(),
                  );
                },
                loading: () => const CircularProgressIndicator(),
                error: (e, _) => Text('Error: $e'),
              )
            : myWallets.when(
                data: (wallets) {
                  final filteredWallets = wallets!
                      .where((wallet) =>
                          (wallet.walletId?.toString().toLowerCase() ?? '')
                              .contains(searchQuery) ||
                          (wallet.currency?.toLowerCase() ?? '')
                              .contains(searchQuery))
                      .toList();

                  return Column(
                    children: filteredWallets
                        .map((wallet) => WalletListItem(
                              onTap: () {
                                print('wallet id: ${wallet.currency}');
                                final notifier = ref.read(
                                    transferDataNotifierProvider.notifier);

                                notifier.setToName("You");

                                notifier.setCurrencies(
                                    toCurrency: wallet.currency ?? '');
                                notifier.setToWalletId(wallet.walletId);
                                context.pushNamed(RouteName.transferAmount);
                              },
                              flagAssetPath: wallet.currency ?? '',
                              title: wallet.currency ?? '',
                              // subtitle: wallet.walletCode ?? '',
                            ))
                        .toList(),
                  );
                },
                loading: () => const CircularProgressIndicator(),
                error: (e, _) => Text('Error: $e'),
              ),
      ],
    );
  }
}

class WalletListItem extends StatelessWidget {
  final String title;
  String? subtitle;
  final String flagAssetPath;
  final VoidCallback onTap;

  WalletListItem({
    super.key,
    required this.title,
    this.subtitle,
    required this.flagAssetPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xFFF0F0F2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            ClipOval(
              child: Image.asset(
                getCurrencyFlagAsset(flagAssetPath),
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
            const Gap(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const Gap(4),
                    Text(
                      subtitle!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: Colors.black54,
            )
          ],
        ),
      ),
    );
  }
}

class FilterChipButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterChipButton({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: isSelected ? Colors.black : Colors.black26),
        backgroundColor: isSelected ? Colors.black12 : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 14, color: Colors.black),
      ),
    );
  }
}

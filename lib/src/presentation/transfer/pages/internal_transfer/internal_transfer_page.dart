import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/presentation/transfer/controllers/get_all_wallet/fetch_all_wallet_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/controllers/transfer_data_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/entities/wallet_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:gap/gap.dart';

class InternalTransferPage extends ConsumerStatefulWidget {
  const InternalTransferPage({super.key});

  @override
  ConsumerState<InternalTransferPage> createState() =>
      _InternalTransferPageState();
}

class _InternalTransferPageState extends ConsumerState<InternalTransferPage> {
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final listWallet = ref.watch(fetchAllWalletProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Internal Transfer',
        centertitle: true,
        showBackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// **🔍 Search Bar**
            TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
              decoration: InputDecoration(
                hintText: "Search by username...",
                hintStyle: TextStyle(color: Colors.grey.shade500),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.transparent,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.blue, width: 1.5),
                ),
              ),
            ),
            const Gap(10),

            /// **Wallet List**
            Expanded(
              child: listWallet.when(
                loading: () => const Center(
                    child: CircularProgressIndicator(
                        color: AppColor.primaryColor)),
                error: (error, stack) => Center(child: Text("Error: $error")),
                data: (wallets) {
                  final filteredWallets = wallets
                      .where((wallet) =>
                          wallet!.username!.toLowerCase().contains(searchQuery))
                      .toList();

                  if (filteredWallets.isEmpty) {
                    return const Center(
                        child: Text("No wallets found",
                            style: TextStyle(color: Colors.grey)));
                  }

                  return ListView.builder(
                    itemCount: filteredWallets.length,
                    itemBuilder: (context, index) {
                      final wallet = filteredWallets[index];
                      return _buildCustomWalletCard(wallet!);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// **🎨 Custom Wallet Card UI**
  Widget _buildCustomWalletCard(WalletModel wallet) {
    return GestureDetector(
      onTap: () {
        ref
            .read(transferDataNotifierProvider.notifier)
            .setToWalletId(wallet.walletId!);
        context.pushNamed(RouteName.pay);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColor.primaryWhite,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            /// **🟢 Profile Icon**
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.person, color: Colors.black, size: 28),
            ),
            const Gap(12),

            /// **👤 Username & Country Code**
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    wallet.username ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const Gap(2),
                  Text(
                    "${wallet.countryCode} • ${wallet.currency}",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            /// **➡️ Right Arrow Icon**
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

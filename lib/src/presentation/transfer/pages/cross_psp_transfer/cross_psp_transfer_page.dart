import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/presentation/transfer/controllers/get_all_wallet/fetch_all_wallet_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/controllers/transfer_data_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/entities/wallet_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class CrossPspTransferPage extends ConsumerWidget {
  const CrossPspTransferPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transferData = ref.watch(transferDataNotifierProvider);
    final allWallets = ref.watch(fetchAllWalletProvider);
    final selectedWalletId = transferData.toWalletId;
    final selectedToCurrency = transferData.toCurrency;

    /// **Saat memilih wallet, simpan `toWalletId` & `toCurrency`**
    void onSelectWallet(WalletModel wallet) {
      ref.read(transferDataNotifierProvider.notifier)
        ..setToWalletId(wallet.walletId!)
        ..setCurrencies(toCurrency: wallet.currency);
    }

    return WillPopScope(
      onWillPop: () async {
        // ✅ Reset data saat kembali
        ref.read(transferDataNotifierProvider.notifier)
          ..setToWalletId(null)
          ..setCurrencies(toCurrency: null);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: 'Cross PSP Transfer',
          centertitle: true,
          showBackButton: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Select Wallet & Currency",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryBlack,
                ),
              ),
              const Gap(16),

              /// **Wallet Selection Dropdown**
              allWallets.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) =>
                    Center(child: Text('Error: ${error.toString()}')),
                data: (wallets) => _buildWalletDropdown(
                  title: "Select Wallet",
                  selectedWalletId: selectedWalletId,
                  wallets: wallets,
                  onChanged: onSelectWallet,
                ),
              ),

              const Gap(20),

              /// **Display Selected To Currency**
              _buildSelectedCurrency(selectedToCurrency),

              const Spacer(),

              /// **Continue Button**
              Align(
                alignment: Alignment.centerLeft,
                child: Button.filled(
                  onPressed: () {
                    if (selectedWalletId == null ||
                        selectedToCurrency == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please select a wallet!"),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }
                    context.pushNamed(RouteName.pay);
                  },
                  label: 'Continue to Pay',
                  width: double.infinity,
                  height: 50,
                  color: AppColor.primaryBlack,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// **Wallet Dropdown**
  Widget _buildWalletDropdown({
    required String title,
    required int? selectedWalletId,
    required List<WalletModel?> wallets,
    required Function(WalletModel) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black54,
          ),
        ),
        const Gap(6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              value: selectedWalletId,
              isExpanded: true,
              hint: const Text("Select Wallet"),
              items: wallets.map((wallet) {
                return DropdownMenuItem<int>(
                  value: wallet!.walletId,
                  child: Row(
                    children: [
                      const Icon(Icons.account_balance_wallet_rounded,
                          color: Colors.black54),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          wallet.username ?? "Unknown",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        wallet.currency ?? "",
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  final selectedWallet =
                      wallets.firstWhere((w) => w!.walletId == value)!;
                  onChanged(selectedWallet);
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  /// **Display Selected To Currency**
  Widget _buildSelectedCurrency(String? selectedToCurrency) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "To Currency",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black54,
          ),
        ),
        const Gap(6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const Icon(Icons.attach_money, color: Colors.black54),
              const SizedBox(width: 12),
              Text(
                selectedToCurrency ?? "Select a wallet first",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

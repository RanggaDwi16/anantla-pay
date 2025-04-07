import 'package:anantla_pay/src/presentation/transfer/controllers/get_all_wallet/fetch_all_wallet_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/controllers/transfer_data_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/entities/wallet_model.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

class WalletDropdown extends ConsumerWidget {
  final WalletModel? selectedWallet;
  final Function(WalletModel?) onChanged;

  const WalletDropdown({
    super.key,
    required this.selectedWallet,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listWallet = ref.watch(fetchAllWalletProvider);
    final transferData = ref.watch(transferDataNotifierProvider);

    return listWallet.when(
      data: (data) {
        final fromCurrency = transferData.fromCurrency;

        // ✅ Filter wallet berdasarkan currency yang sama
        final filteredItems = data.whereType<WalletModel>().where((wallet) {
          final fromCurrency = transferData.fromCurrency;
          final transferType = transferData.transferType;

          if (fromCurrency == null) return true;

          if (transferType == TransferType.internal) {
            return wallet.currency == fromCurrency;
          } else {
            return wallet.currency != fromCurrency;
          }
        }).toList();

        return DropdownSearch<WalletModel>(
          selectedItem: selectedWallet,
          items: (String filter, _) async {
            return filteredItems
                .where((wallet) =>
                    wallet.username
                        ?.toLowerCase()
                        .contains(filter.toLowerCase()) ??
                    false)
                .toList();
          },
          filterFn: (wallet, filter) =>
              wallet.username?.toLowerCase().contains(filter.toLowerCase()) ??
              false,
          itemAsString: (wallet) => wallet.username ?? '-',
          onChanged: onChanged,
          popupProps: PopupProps.menu(
            searchDelay: Duration.zero,
            showSearchBox: true,
            itemBuilder: (context, wallet, isDisabled, isSelected) =>
                _walletItem(wallet),
          ),
          dropdownBuilder: (context, selectedItem) => selectedItem == null
              ? const Text("Select Wallet")
              : _walletItem(selectedItem),
          suffixProps: DropdownSuffixProps(
            dropdownButtonProps: DropdownButtonProps(
              iconClosed: Icon(
                Icons.arrow_forward_ios,
                color: AppColor.primaryBlack,
                size: 16,
              ),
              iconOpened: Icon(
                Icons.arrow_forward_ios,
                color: AppColor.primaryBlack,
                size: 16,
              ),
            ),
          ),
          decoratorProps: DropDownDecoratorProps(
            decoration: InputDecoration(
              isDense: true,
              contentPadding: selectedWallet != null
                  ? EdgeInsets.symmetric(vertical: 14)
                  : EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              filled: true,
              fillColor: const Color(0xFFF7F8FA),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(14),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(14),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
          compareFn: (a, b) => a.walletId == b.walletId,
        );
      },
      loading: () => _shimmerPlaceholder(),
      error: (e, _) => Text("Failed to load wallets: $e"),
    );
  }

  Widget _walletItem(WalletModel wallet) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.white),
          ),
          const Gap(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(wallet.username ?? '',
                  style: const TextStyle(fontWeight: FontWeight.w600)),
              const Gap(2),
              Text("${wallet.countryCode} • ${wallet.currency}",
                  style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _shimmerPlaceholder() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}

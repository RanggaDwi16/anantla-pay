import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/helpers/formatters/string_format.dart';
import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:anantla_pay/src/presentation/account/controllers/get_balance/fetch_balance_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/top_up/patch_top_up_provider.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/top_up_params.dart';
import 'package:anantla_pay/src/presentation/add_money/controllers/top_up_data_provider.dart';
import 'package:anantla_pay/src/presentation/add_money/widgets/add_money/add_money_card.dart';
import 'package:anantla_pay/src/presentation/home/widgets/section/balance_summary_section.dart';
import 'package:anantla_pay/src/presentation/pay/controllers/amunt_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddMoneyPage extends HookConsumerWidget {
  const AddMoneyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletData = ref.watch(fetchBalanceProvider);
    final selectedWalletIndex = ref.watch(selectedWalletProvider);
    final amount = useTextEditingController();
    final isCoverFeeChecked = useState(false); // Added state for checkbox

    List<int> getPresetAmounts(String currencyCode) {
      switch (currencyCode.toUpperCase()) {
        case 'USD':
        case 'INR':
          return [5, 10, 20];
        case 'SGD':
          return [100, 300, 500];
        case 'IDR':
        default:
          return [25000, 50000, 100000];
      }
    }

    return Scaffold(
      backgroundColor: AppColor.secondaryBackground,
      appBar: CustomAppBar(
        backgroundColor: AppColor.secondaryBackground,
        title: 'Add Money',
        centertitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: GestureDetector(
            onTap: () => context.pop(),
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: AppColor.primaryWhite,
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
      body: walletData.when(
        data: (data) {
          final wallets = data;
          final selectedWallet = wallets![selectedWalletIndex];
          final chipAmounts =
              getPresetAmounts(selectedWallet.currency ?? 'IDR');

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              children: [
                AddMoneyCard(
                  onTap: () async {
                    final selectedIndex = await showModalBottomSheet<int>(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(24)),
                      ),
                      builder: (_) => _WalletSelector(
                          wallets: wallets, selectedIndex: selectedWalletIndex),
                    );

                    if (selectedIndex != null) {
                      ref.read(selectedWalletProvider.notifier).state =
                          selectedIndex;
                      amount.text = formatCurrency(
                        amount: 0,
                        currencyCode:
                            wallets[selectedWalletIndex].currency ?? 'USD',
                      );
                    }
                  },
                  currency: selectedWallet.currency!,
                  // description: selectedWallet.walletCode!,
                  flagAssetPath: getCurrencyFlagAsset(
                    selectedWallet.currency!,
                  ),
                ),
                const Gap(32),
                SizedBox(
                  width: context.deviceWidth,
                  child: TextField(
                    controller: amount,
                    onChanged: (value) {
                      String cleanValue =
                          value.replaceAll(RegExp(r'[^0-9]'), '');
                      final doubleAmount = double.tryParse(cleanValue) ?? 0;
                      final currency = selectedWallet.currency ?? 'USD';

                      final newText = formatCurrency(
                          amount: doubleAmount, currencyCode: currency);
                      amount.value = TextEditingValue(
                        text: newText,
                        selection:
                            TextSelection.collapsed(offset: newText.length),
                      );
                    },
                    decoration: InputDecoration(
                      hintText: formatCurrency(
                          amount: 0,
                          currencyCode: selectedWallet.currency ?? 'USD'),
                      hintStyle: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primaryBlack.withOpacity(0.5),
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryBlack,
                    ),
                  ),
                ),
                const Gap(16),

                Wrap(
                  spacing: 20,
                  children: chipAmounts.map((value) {
                    return ChoiceChip(
                      label: Text(formatCurrency(
                          amount: value.toDouble(),
                          currencyCode: selectedWallet.currency ?? 'IDR')),
                      selected: false,
                      backgroundColor: AppColor.itemGray,
                      labelStyle: const TextStyle(color: AppColor.primaryBlack),
                      onSelected: (_) {
                        final formatted = formatCurrency(
                          amount: value.toDouble(),
                          currencyCode: selectedWallet.currency ?? 'IDR',
                        );
                        amount.text = formatted;
                      },
                    );
                  }).toList(),
                ),

                const Gap(16),
                // Checkbox for coverFee selection
                Row(
                  children: [
                    Checkbox(
                      value: isCoverFeeChecked.value,
                      onChanged: (bool? value) {
                        isCoverFeeChecked.value = value!;
                      },
                      activeColor: AppColor.primaryColor,
                    ),
                    const Text('Include cover fee'),
                  ],
                ),
                const Spacer(),
                Button.filled(
                  onPressed: () {
                    ref.read(topUpDataNotifierProvider.notifier).setTopUpAmount(
                        int.parse(
                            amount.text.replaceAll(RegExp(r'[^0-9]'), '')));
                    ref
                        .read(topUpDataNotifierProvider.notifier)
                        .setFromWalletId(selectedWallet.walletId!);
                    ref
                        .read(topUpDataNotifierProvider.notifier)
                        .setFromAmount(selectedWallet.balance!);
                    ref
                        .read(topUpDataNotifierProvider.notifier)
                        .setFromCurrency(selectedWallet.currency!);
                    ref
                        .read(topUpDataNotifierProvider.notifier)
                        .setToCurrency(selectedWallet.currency!);

                    ref.read(patchTopUpProvider.notifier).getFees(
                          params: VirtualAccountParams(
                              walletId: selectedWallet.walletId!,
                              amount: int.parse(amount.text
                                  .replaceAll(RegExp(r'[^0-9]'), '')),
                              currency: selectedWallet.currency!,
                              coverFee: isCoverFeeChecked.value),
                          onError: (message) {
                            context.showCustomSnackBar(message, isError: true);
                            print('message error: $message');
                          },
                          onSuccess: (data) {
                            ref
                                .read(topUpDataNotifierProvider.notifier)
                                .setVirtualAccountData(
                                  partnerFee:
                                      double.parse(data.partnerFee ?? '0'),
                                  platformFee:
                                      double.parse(data.platformFee ?? '0'),
                                  totalAmount:
                                      double.parse(data.totalWithFee ?? '0'),
                                );
                            context.pushNamed(RouteName.topUpOption);
                          },
                        );
                  },
                  label: 'Continue',
                  disabled: amount.text.isEmpty || amount.text == '0',
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text("Error: $err")),
      ),
    );
  }

  Widget _amountChip({
    required num value,
    required String currencyCode,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: AppColor.primaryWhite,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Text(
        formatCurrency(amount: value.toDouble(), currencyCode: currencyCode),
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColor.primaryBlack,
        ),
      ),
    );
  }
}

class _WalletSelector extends StatelessWidget {
  final List<dynamic> wallets;
  final int selectedIndex;

  const _WalletSelector({
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
}

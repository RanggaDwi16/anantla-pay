import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/helpers/formatters/currency_format.dart';
import 'package:anantla_pay/src/core/helpers/formatters/string_format.dart';
import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:anantla_pay/src/presentation/account/controllers/get_balance/fetch_balance_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/get_transaction/fetch_transaction_provider.dart';
import 'package:anantla_pay/src/presentation/main/controllers/selected_index_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/controllers/cross_psp_transfer/post_cross_psp_transfer_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/controllers/get_all_wallet/fetch_all_wallet_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/controllers/transfer_data_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/entities/transfer_params.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/entities/wallet_model.dart';
import 'package:anantla_pay/src/presentation/transfer/widgets/dropdown_search_wallet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CrossPspTransferPage extends HookConsumerWidget {
  const CrossPspTransferPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transferData = ref.watch(transferDataNotifierProvider);
    final amountController = useTextEditingController();
    final noteController = useTextEditingController();
    final crossPspTransfer = ref.watch(postCrossPspTransferProvider);
    final isSendEnabled = useState(false);

    final selectedWallet = useState<WalletModel?>(null);
    final selectedToCurrency = transferData.fromCurrency;

    useEffect(() {
      void validate() {
        final isValidWallet = selectedWallet.value != null;
        final rawAmount =
            amountController.text.replaceAll(RegExp(r'[^0-9]'), '');
        final isValidAmount =
            rawAmount.isNotEmpty && int.tryParse(rawAmount)! > 0;
        isSendEnabled.value = isValidWallet && isValidAmount;
      }

      amountController.addListener(validate);
      return () => amountController.removeListener(validate);
    }, [amountController, selectedWallet]);

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
          title: 'Send Now',
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
                  color: AppColor.itemGray, // abu-abu terang sesuai gambar
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ListView(
            children: [
              WalletDropdown(
                selectedWallet: selectedWallet.value,
                onChanged: (wallet) {
                  selectedWallet.value = wallet;
                },
              ),
              const Gap(20),
              _buildAmountCurrencyInput(
                controller: amountController,
                currency: selectedToCurrency,
              ),
              const Gap(20),
              Text("Add Notes",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      )),
              const Gap(10),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F8FA),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: TextField(
                  controller: noteController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    hintText: "Write your message here...",
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
          child: Row(
            children: [
              Expanded(
                child: Button.outlined(
                  label: 'Cancel',
                  onPressed: () => context.pop(),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Button.filled(
                    label: crossPspTransfer.isLoading ? "Loading..." : "Send",
                    color: crossPspTransfer.isLoading
                        ? Colors.grey
                        : AppColor.primaryColor,
                    disabled: !isSendEnabled.value,
                    onPressed: () {
                      print(selectedWallet.value!.walletId);
                      ref
                          .read(postCrossPspTransferProvider.notifier)
                          .postCrossPspTransfer(
                            params: CrossPspParams(
                              amount: int.parse(
                                amountController.text.replaceAll(
                                  RegExp(r'[^0-9]'),
                                  '',
                                ),
                              ),
                              fromWalletId: transferData.fromWalletId!,
                              toWalletId: selectedWallet.value!.walletId,
                              fromCurrency: transferData.fromCurrency,
                              toCurrency: selectedToCurrency,
                              note: noteController.text,
                            ),
                            onError: (message) {
                              context.customErrorDialog(message);
                            },
                            onSuccess: (message) {
                              ref.invalidate(fetchBalanceProvider);
                              ref.invalidate(fetchTransactionProvider);
                              ref
                                  .read(transferDataNotifierProvider.notifier)
                                  .reset();
                              context.showSuccessDialog(
                                title: 'Cross PSP Transfer Successful',
                                message:
                                    'Your cross PSP transfer has been completed!',
                                onConfirm: () {
                                  context.goNamed(RouteName.main);
                                  ref
                                      .read(selectedIndexProvider.notifier)
                                      .state = 1;
                                },
                              );
                            },
                          );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAmountCurrencyInput({
    required TextEditingController controller,
    required String? currency,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FA),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "I want to send",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
                const Gap(4),
                TextField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    final raw = value.replaceAll(RegExp(r'[^0-9]'), '');
                    final selectedCurrency = currency ?? 'IDR';

                    if (raw.isEmpty) return;

                    final formatted = formatByCurrency(raw, selectedCurrency);

                    controller.value = TextEditingValue(
                      text: formatted,
                      selection:
                          TextSelection.collapsed(offset: formatted.length),
                    );
                  },
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    hintText: getCurrencyHint(currency ?? 'IDR'),
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Gap(16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Row(
              children: [
                if (currency != null)
                  Image.asset(
                    getCurrencyFlagAsset(currency), // Fungsi untuk path gambar
                    width: 20,
                    height: 20,
                  ),
                const SizedBox(width: 6),
                Text(
                  currency ?? '-',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

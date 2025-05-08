import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/helpers/formatters/currency_format.dart';
import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:anantla_pay/src/presentation/account/controllers/get_balance/fetch_balance_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/get_transaction/fetch_transaction_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/top_up/top_up_data_provider.dart';
import 'package:anantla_pay/src/presentation/main/controllers/selected_index_provider.dart';
import 'package:anantla_pay/src/presentation/pay/controllers/amunt_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/controllers/internal_transfer/post_internal_transfer_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/controllers/transfer_data_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/entities/transfer_params.dart';
import 'package:anantla_pay/src/presentation/transfer/widgets/dropdown_search_wallet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/entities/wallet_model.dart';

class InternalTransferPage extends HookConsumerWidget {
  const InternalTransferPage({super.key});

  String _formatToRupiah(String value) {
    String cleaned = value.replaceAll(RegExp(r'[^0-9]'), '');
    if (cleaned.isEmpty) return '';
    final parsed = int.tryParse(cleaned) ?? 0;
    final formatter =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return formatter.format(parsed);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amountController = useTextEditingController();
    final noteController = useTextEditingController();
    final selectedWallet = useState<WalletModel?>(null);
    final isSendEnabled = useState(false);
    final transferData = ref.watch(transferDataNotifierProvider);
    final internalTransfer = ref.watch(postInternalTransferProvider);

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

    return Scaffold(
      backgroundColor: AppColor.secondaryBackground,
      appBar: CustomAppBar(
        backgroundColor: AppColor.secondaryBackground,
        title: 'Send Now',
        centertitle: true,
        showBackButton: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: GestureDetector(
            onTap: () => context.pop(),
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
            /// Wallet Dropdown
            WalletDropdown(
              selectedWallet: selectedWallet.value,
              onChanged: (wallet) {
                selectedWallet.value = wallet;
              },
            ),

            const Gap(24),

            Text(
              "Amount to Send",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const Gap(10),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF7F8FA),
                borderRadius: BorderRadius.circular(14),
              ),
              child: TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  final raw = value.replaceAll(RegExp(r'[^0-9]'), '');
                  if (raw.isEmpty) return;

                  final currency = transferData.fromCurrency ?? 'IDR';
                  final formatted = formatByCurrency(raw, currency);

                  amountController.value = TextEditingValue(
                    text: formatted,
                    selection:
                        TextSelection.collapsed(offset: formatted.length),
                  );
                },
                decoration: InputDecoration(
                  hintText: getCurrencyHint(transferData.fromCurrency ?? 'IDR'),
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const Gap(24),

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
                label: internalTransfer.isLoading ? "Loading..." : "Send",
                color: internalTransfer.isLoading
                    ? Colors.grey
                    : AppColor.primaryColor,
                disabled: !isSendEnabled.value,
                onPressed: () {
                  // TODO: Handle transfer
                  ref
                      .read(postInternalTransferProvider.notifier)
                      .postInternalTranfer(
                        params: InternalTransferParams(
                          amount: int.tryParse(amountController.text
                              .replaceAll(RegExp(r'[^0-9]'), '')),
                          fromWalletId: transferData.fromWalletId!,
                          toWalletId: selectedWallet.value!.walletId,
                          note: noteController.text,
                        ),
                        onError: (message) {
                          context.customErrorDialog(message);
                        },
                        onSuccess: (message) {
                          final fromWalletId = transferData.fromWalletId!;
                          _showOtpDialog(
                              context,
                              ref,
                              fromWalletId,
                              int.tryParse(amountController.text
                                  .replaceAll(RegExp(r'[^0-9]'), ''))!,
                              noteController.text,
                              selectedWallet.value!.walletId!,
                              transferData.fromCurrency ?? 'IDR');
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

  void _showOtpDialog(BuildContext context, WidgetRef ref, int fromWalletId,
      int amount, String note, int toWalletId, String currency) {
    final otpController = TextEditingController();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        // ✅ Store the dialog context
        return AlertDialog(
          title: const Text("Enter OTP"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: otpController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "OTP Code",
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (dialogContext.mounted) Navigator.pop(dialogContext);
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                final enteredOtp = otpController.text.trim();
                print("Entered OTP: $enteredOtp");
                if (enteredOtp.isNotEmpty) {
                  ref
                      .read(postInternalTransferProvider.notifier)
                      .postInternalTranfer(
                          params: InternalTransferParams(
                            amount: amount,
                            note: note,
                            toWalletId: toWalletId,
                            otpCode: enteredOtp,
                            fromWalletId: fromWalletId,
                          ),
                          onError: (message) {
                            context.customErrorDialog(message);
                          },
                          onSuccess: (message) {
                            ref.invalidate(fetchBalanceProvider);
                            ref.invalidate(fetchTransactionProvider);
                            context.showSuccessDialog(
                                title: "Success",
                                message: message,
                                onConfirm: () {
                                  ref.read(amountProvider.notifier).state = "0";
                                  ref
                                      .read(topUpDataNotifierProvider.notifier)
                                      .reset();
                                  context.goNamed(RouteName.main);
                                  ref
                                      .read(selectedIndexProvider.notifier)
                                      .state = 1;
                                });
                          });
                } else {
                  context.showCustomSnackBar("Please enter the OTP!",
                      isError: true);
                }
              },
              child: const Text("Verify"),
            ),
          ],
        );
      },
    );
  }
}

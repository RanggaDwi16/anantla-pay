import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/constant/path.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:anantla_pay/src/presentation/account/controllers/get_balance/fetch_balance_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/get_transaction/fetch_transaction_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/top_up/patch_top_up_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/top_up/top_up_data_provider.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/top_up_params.dart';
import 'package:anantla_pay/src/presentation/main/controllers/selected_index_provider.dart';
import 'package:anantla_pay/src/presentation/pay/controllers/amunt_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/controllers/cross_psp_transfer/post_cross_psp_transfer_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/controllers/internal_transfer/post_internal_transfer_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/controllers/transfer_data_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/entities/transfer_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReviewPage extends HookConsumerWidget {
  const ReviewPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topUp = ref.watch(patchTopUpProvider);
    final internalTransfer = ref.watch(postInternalTransferProvider);
    final crossPspTransfer = ref.watch(postCrossPspTransferProvider);
    final messageController = useTextEditingController();
    // ✅ Detect if it's a Top-Up or Transfer
    final topUpData = ref.watch(topUpDataNotifierProvider);
    final transferData = ref.watch(transferDataNotifierProvider);
    print(
        'Before sending: fromCurrency = ${transferData.fromCurrency}, toCurrency = ${transferData.toCurrency}');

    final transferDataLatest = ref.read(transferDataNotifierProvider);

    // final transferDataLatest = ref.read(transferDataNotifierProvider);

    final isTopUp = topUpData.walletId != null;
    final isInternalTransfer =
        transferData.transferType == TransferType.internal;
    final isCrossPspTransfer =
        transferData.transferType == TransferType.crossPSP;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Message'),
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: messageController,
                        maxLines: 12,
                        style: const TextStyle(fontSize: 18),
                        decoration: const InputDecoration(
                          hintText: "Type your message...",
                          border: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(20),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          ImagePath.avatar1,
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Gap(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Luc",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Row(
                            children: [
                              Image.asset(ImagePath.usa, width: 16, height: 16),
                              const Gap(5),
                              const Text("lucio20",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Gap(20),

                  /// **Dynamic Submit Button for Top-Up & Transfer**
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Button.filled(
                      onPressed: () {
                        if (isTopUp) {
                          // ✅ **Top-Up Logic**
                          ref.read(patchTopUpProvider.notifier).patchTouUp(
                                topupParams: TopupParams(
                                  walletId: topUpData.walletId!,
                                  amount: topUpData.amount!,
                                  currency: topUpData.currency!,
                                  referenceId: messageController.text,
                                ),
                                onError: (message) {
                                  context.customErrorDialog(message);
                                },
                                onSuccess: (message) {
                                  ref.invalidate(fetchBalanceProvider);
                                  ref.invalidate(fetchTransactionProvider);
                                  ref.read(amountProvider.notifier).state = '';
                                  ref
                                      .read(topUpDataNotifierProvider.notifier)
                                      .reset();
                                  context.showSuccessDialog(
                                    title: 'Top-Up Successful',
                                    message: 'Your top-up has been completed!',
                                    onConfirm: () {
                                      context.goNamed(RouteName.main);
                                      ref
                                          .read(selectedIndexProvider.notifier)
                                          .state = 1;
                                    },
                                  );
                                },
                              );
                        } else if (isInternalTransfer) {
                          // ✅ **Internal Transfer Logic**
                          ref
                              .read(postInternalTransferProvider.notifier)
                              .postInternalTranfer(
                                params: InternalTransferParams(
                                  amount: transferData.amount!,
                                  fromWalletId: transferData.fromWalletId!,
                                  toWalletId: transferData.toWalletId!,
                                  note: messageController.text,
                                ),
                                onError: (message) {
                                  context.customErrorDialog(message);
                                },
                                onSuccess: (message) {
                                  ref.invalidate(fetchBalanceProvider);
                                  ref.invalidate(fetchTransactionProvider);
                                  ref.read(amountProvider.notifier).state = '';
                                  ref
                                      .read(
                                          transferDataNotifierProvider.notifier)
                                      .reset();
                                  context.showSuccessDialog(
                                    title: 'Internal Transfer Successful',
                                    message:
                                        'Your transfer has been completed!',
                                    onConfirm: () {
                                      context.goNamed(RouteName.main);
                                      ref
                                          .read(selectedIndexProvider.notifier)
                                          .state = 1;
                                    },
                                  );
                                },
                              );
                        } else if (isCrossPspTransfer) {
                          // ✅ **Cross PSP Transfer Logic**
                          ref
                              .read(postCrossPspTransferProvider.notifier)
                              .postCrossPspTransfer(
                                params: CrossPspParams(
                                  amount: transferData.amount!,
                                  fromWalletId: transferData.fromWalletId!,
                                  toWalletId: transferData.toWalletId!,
                                  fromCurrency: transferData.fromCurrency,
                                  toCurrency: transferData.toCurrency,
                                  note: messageController.text,
                                ),
                                onError: (message) {
                                  context.customErrorDialog(message);
                                },
                                onSuccess: (message) {
                                  ref.invalidate(fetchBalanceProvider);
                                  ref.invalidate(fetchTransactionProvider);
                                  ref.read(amountProvider.notifier).state = '';
                                  ref
                                      .read(
                                          transferDataNotifierProvider.notifier)
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
                        }
                      },
                      label: topUp.isLoading ||
                              internalTransfer.isLoading ||
                              crossPspTransfer.isLoading
                          ? 'Processing...'
                          : 'Transfer',
                      isPay: true,
                      width: 250,
                      height: 50,
                      color: topUp.isLoading ||
                              internalTransfer.isLoading ||
                              crossPspTransfer.isLoading
                          ? Colors.grey
                          : AppColor.primaryBlack,
                    ),
                  ),
                  const Gap(20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

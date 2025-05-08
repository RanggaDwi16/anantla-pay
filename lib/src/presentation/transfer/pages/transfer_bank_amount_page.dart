import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/presentation/transfer/controllers/transfer_data_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/widgets/choose_bank/bank_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/helpers/widgets/custom_text_field.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

// State Providers
final youWillSendProvider = StateProvider<String>((ref) => '');
final recipientWillGetProvider = StateProvider<String>((ref) => '');

class TransferBankAmountPage extends ConsumerStatefulWidget {
  const TransferBankAmountPage({super.key});

  @override
  ConsumerState<TransferBankAmountPage> createState() =>
      _TransferBankAmountPageState();
}

class _TransferBankAmountPageState
    extends ConsumerState<TransferBankAmountPage> {
  final sendController = TextEditingController();
  final getController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Mirip useEffect: Update otomatis recipient saat input berubah
    sendController.addListener(() {
      final value = sendController.text;
      ref.read(youWillSendProvider.notifier).state = value;

      // Update recipient (bisa ganti formula rate jika ada)
      ref.read(recipientWillGetProvider.notifier).state = value;
      getController.text = value;
    });
  }

  @override
  void dispose() {
    sendController.dispose();
    getController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final youWillSend = ref.watch(youWillSendProvider);
    final isDisabled = youWillSend.trim().isEmpty;
    final transferData = ref.watch(transferDataNotifierProvider);

    return Scaffold(
      backgroundColor: AppColor.secondaryBackground,
      appBar: CustomAppBar(
        backgroundColor: AppColor.secondaryBackground,
        title: 'Enter Amount',
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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter the amount you want to transfer',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: AppColor.primaryBlack,
                  ),
            ),
            const Gap(32),
            CustomTextField(
              controller: sendController,
              hintText: 'Money Amount',
              labelText: 'You Will Send',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            // CustomTextField(
            //   controller: getController,
            //   hintText: 'Enter Amount',
            //   labelText: 'Recipient will get',
            //   keyboardType: TextInputType.number,
            //   isDisabled: true,
            // ),
            BankCard(
              onTap: () {},
              title: '${transferData.bankName}',
              description: '${transferData.bankCode}',
              assetPath: Assets.icons.bankOutline.path,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Button.filled(
          onPressed: () {
            ref
                .read(transferDataNotifierProvider.notifier)
                .setAmountTransferBank(
                  int.parse(youWillSend.replaceAll(RegExp(r'[^0-9]'), '')),
                );
            context.pushNamed(RouteName.transferBankReason);
          },
          label: 'Continue',
          disabled: isDisabled,
        ),
      ),
    );
  }
}

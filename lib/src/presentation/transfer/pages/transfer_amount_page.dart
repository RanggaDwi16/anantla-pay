import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/helpers/formatters/string_format.dart';
import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:anantla_pay/src/presentation/transfer/controllers/get_exhange_rate/fetch_exhange_rate_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/controllers/transfer_data_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/widgets/amount/fees_breakdown_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

final convertedAmountProvider = StateProvider<String>((ref) => '');

class TransferAmountPage extends HookConsumerWidget {
  const TransferAmountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transferData = ref.watch(transferDataNotifierProvider);
    final amount = useTextEditingController();
    final fees = useTextEditingController(text: '0.00');
    final inputText = amount.text;
    final baseFontSize = 70.0;
    final minFontSize = 18.0;

    double dynamicFontSize = baseFontSize;
    if (inputText.length > 1) {
      dynamicFontSize = baseFontSize -
          ((inputText.length) * 4).clamp(0, baseFontSize - minFontSize);
    }

    final convertedAmount = ref.watch(convertedAmountProvider);
    return WillPopScope(
      onWillPop: () async {
        ref.read(convertedAmountProvider.notifier).state = '';
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColor.secondaryBackground,
        appBar: CustomAppBar(
          backgroundColor: AppColor.secondaryBackground,
          showBackButton: true,
          // actions: [
          //   Padding(
          //     padding: const EdgeInsets.only(right: 16),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Container(
          //           padding: const EdgeInsets.symmetric(
          //               horizontal: 14, vertical: 10),
          //           decoration: BoxDecoration(
          //             color: AppColor.primaryWhite,
          //             borderRadius: BorderRadius.circular(30),
          //           ),
          //           child: Row(
          //             children: [
          //               const Icon(Icons.lock_outline,
          //                   size: 16, color: Colors.grey),
          //               const SizedBox(width: 8),
          //               const Text(
          //                 '1 USD = 16,845.00 IDR',
          //                 style: TextStyle(
          //                   fontWeight: FontWeight.w500,
          //                   fontSize: 13,
          //                 ),
          //               )
          //             ],
          //
          //         ),
          //       ],
          //     ),
          //   ),
          // ],
          leading: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: GestureDetector(
              onTap: () {
                ref.read(convertedAmountProvider.notifier).state = '';
                context.pop();
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: AppColor.primaryWhite, // abu-abu terang sesuai gambar
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
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 16),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'You Send',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(height: 12),
                                    Container(
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
                                              getCurrencyFlagAsset(
                                                  transferData.fromCurrency),
                                              width: 24,
                                              height: 24,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Text(transferData.fromCurrency ?? ''),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    width: context.deviceWidth * 0.6,
                                    child: Stack(
                                      children: [
                                        TextField(
                                          controller: amount,
                                          onChanged: (value) async {
                                            final fromCurrency =
                                                transferData.fromCurrency ?? '';
                                            final toCurrency =
                                                transferData.toCurrency ?? '';

                                            if (value.isEmpty) {
                                              ref
                                                  .read(convertedAmountProvider
                                                      .notifier)
                                                  .state = '0';
                                              return;
                                            }

                                            if (fromCurrency == toCurrency) {
                                              ref
                                                  .read(convertedAmountProvider
                                                      .notifier)
                                                  .state = value;
                                            } else {
                                              await ref
                                                  .read(fetchExhangeRateProvider
                                                      .notifier)
                                                  .fetchExchangeRate(
                                                    fromCurrency: fromCurrency,
                                                    toCurrency: toCurrency,
                                                    amount:
                                                        value, // tidak diubah, biarkan tetap dalam format seperti "Rp45.584"
                                                  );

                                              final asyncExchange = ref.read(
                                                  fetchExhangeRateProvider);

                                              if (asyncExchange is AsyncData) {
                                                ref
                                                    .read(
                                                        convertedAmountProvider
                                                            .notifier)
                                                    .state = asyncExchange
                                                        .value ??
                                                    '';
                                              } else {
                                                ref
                                                    .read(
                                                        convertedAmountProvider
                                                            .notifier)
                                                    .state = '...';
                                              }
                                            }
                                          },
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.end,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 0),
                                            // hintText: formatCurrency(
                                            //     amount: 0,
                                            //     currencyCode:
                                            //         transferData.fromCurrency ??
                                            //             'IDR',
                                            //     isTransferAmount: true),
                                            // hintStyle: TextStyle(
                                            //   fontSize: dynamicFontSize,
                                            //   fontWeight: FontWeight.w700,
                                            //   color: AppColor.textGray,
                                            // ),
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                            isCollapsed: true,
                                          ),
                                          style: TextStyle(
                                            fontSize: dynamicFontSize,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        IgnorePointer(
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            height: dynamicFontSize +
                                                10, // ensure enough height to center vertically
                                            child: Text(
                                              formatCurrency(
                                                amount: double.tryParse(
                                                      amount.text
                                                          .replaceAll(',', '')
                                                          .replaceAll('.', ''),
                                                    ) ??
                                                    0,
                                                currencyCode:
                                                    transferData.fromCurrency ??
                                                        '',
                                                isTransferAmount: false,
                                              ),
                                              style: TextStyle(
                                                fontSize: dynamicFontSize,
                                                fontWeight: FontWeight.w700,
                                                color: AppColor.primaryColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            ),

                            const SizedBox(height: 32),

                            // Rangga Gets section
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${transferData.toName} gets',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(height: 12),
                                    Container(
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
                                              getCurrencyFlagAsset(
                                                  transferData.toCurrency),
                                              width: 24,
                                              height: 24,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            transferData.toCurrency ?? '',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: context.deviceWidth * 0.45,
                                  child: Text(
                                    formatCurrency(
                                      amount: double.tryParse(convertedAmount
                                              .replaceAll(',', '')) ??
                                          0,
                                      currencyCode:
                                          transferData.toCurrency ?? '',
                                      isTransferAmount:
                                          transferData.fromCurrency !=
                                              transferData.toCurrency,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w700,
                                      color: AppColor.primaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Gap(40),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColor.primaryWhite,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: context.deviceWidth * 0.05,
                              vertical: context.deviceHeight * 0.03,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // PAYING WITH
                                Row(
                                  children: [
                                    ClipOval(
                                      child: Image.asset(
                                        getCurrencyFlagAsset(
                                            transferData.fromCurrency),
                                        width: 48,
                                        height: 48,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Paying with',
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            '${transferData.fromCurrency} balance',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(height: 2),
                                          Text(
                                            '${formatCurrency(
                                              amount:
                                                  transferData.fromBalance ?? 0,
                                              currencyCode:
                                                  transferData.fromCurrency ??
                                                      '',
                                              isTransferAmount: transferData
                                                      .fromCurrency!
                                                      .toUpperCase() !=
                                                  'IDR',
                                            )} available',
                                            style: const TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                                const Divider(),
                                Gap(10),

                                // ARRIVES
                                Row(
                                  children: [
                                    Container(
                                      width: 48,
                                      height: 48,
                                      decoration: BoxDecoration(
                                        color: AppColor
                                            .secondaryBackground, // warna abu-abu muda
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppColor
                                              .primaryBlack, // warna garis luar
                                          width: 1,
                                        ),
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                          Assets.icons.flash.path,
                                          width: 24,
                                          height: 24,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            'Arrives',
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            'Today - in seconds',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Gap(10),

                                const Divider(),

                                // TOTAL FEES
                                const Gap(10),
                                GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      builder: (_) => Container(
                                        height: context.deviceHeight * 0.45,
                                        decoration: const BoxDecoration(
                                          color: AppColor.primaryWhite,
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(24)),
                                        ),
                                        child:
                                            const FeesBreakdownSheet(), // child as you defined
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 48,
                                          height: 48,
                                          decoration: BoxDecoration(
                                            color: AppColor
                                                .secondaryBackground, // warna abu-abu muda
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: AppColor
                                                  .primaryBlack, // warna garis luar
                                              width: 1,
                                            ),
                                          ),
                                          child: Center(
                                            child: Image.asset(
                                              Assets.icons.receipt.path,
                                              width: 24,
                                              height: 24,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Total fees',
                                                style: TextStyle(fontSize: 14),
                                              ),
                                              SizedBox(height: 4),
                                              Text(
                                                'Included in ${transferData.toCurrency} amount',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              formatCurrency(
                                                amount: double.tryParse(
                                                        fees.text) ??
                                                    0,
                                                currencyCode:
                                                    transferData.toCurrency ??
                                                        '',
                                                isTransferAmount: true,
                                              ),
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14,
                                              ),
                                            ),
                                            SizedBox(width: 6),
                                            Icon(Icons.arrow_forward_ios,
                                                size: 14),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: Container(
          color: AppColor.primaryWhite,
          padding: const EdgeInsets.all(16),
          child: Button.filled(
            onPressed: () {
              final fromBalance = transferData.fromBalance ?? 0;
              final enteredAmount = double.tryParse(amount.text) ?? 0;

              if (enteredAmount > fromBalance) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        'Insufficient balance. Please enter a lower amount.'),
                    backgroundColor: Colors.red,
                  ),
                );
                return;
              }
              ref
                  .read(transferDataNotifierProvider.notifier)
                  .setFromAmount(double.parse(amount.text).toInt());
              ref.read(transferDataNotifierProvider.notifier).setToAmount(
                  double.parse(convertedAmount.replaceAll(',', '')));
              ref
                  .read(transferDataNotifierProvider.notifier)
                  .setFees(fees.text);

              context.pushNamed(RouteName.transferReason);
            },
            disabled: amount.text.isEmpty,
            label: 'Continue',
          ),
        ),
      ),
    );
  }
}

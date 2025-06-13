import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/helpers/formatters/string_format.dart';
import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/provider/token_manager_provider.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:anantla_pay/src/presentation/home/controllers/get_balance/fetch_balance_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/get_transaction/fetch_transaction_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/top_up/patch_top_up_provider.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/top_up_params.dart';
import 'package:anantla_pay/src/presentation/add_money/controllers/top_up_data_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/widgets/review_detail/info_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:local_auth/local_auth.dart';

final checkboxAgreedProvider = StateProvider<bool>((ref) => false);

class TopUpReviewDetailPage extends ConsumerWidget {
  const TopUpReviewDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topUpData = ref.watch(topUpDataNotifierProvider);
    final LocalAuthentication auth = LocalAuthentication();

    Future<void> actionTopUpVa() async {
      context.showProcessDialog(); // Tampilkan dialog loading

      ref.read(patchTopUpProvider.notifier).topUpVirtualAccount(
            params: VirtualAccountParams(
              walletId: topUpData.fromWalletId,
              totalAmount: TotalAmount(
                amount: topUpData.topUpAmount!.toString(),
                currency: topUpData.fromCurrency,
              ),
              bankCode: topUpData.bankCode,
              platformFee: topUpData.platformFee?.toInt(),
              partnerFee: topUpData.partnerFee?.toInt(),
              amount: topUpData.topUpAmount?.toInt(),
              virtualAccountName: topUpData.virtualAccountName,
              virtualAccountEmail: topUpData.virtualAccountEmail,
              virtualAccountPhone: topUpData.virtualAccountPhone,
            ),
            onError: (message) {
              Navigator.of(context, rootNavigator: true)
                  .pop(); // Tutup dialog proses
              context
                  .customErrorDialog('Something went wrong, please try again');
            },
            onSuccess: (trxId) async {
              print('trxId: $trxId');
              print('bankCode: ${topUpData.bankCode}');

              ref.read(patchTopUpProvider.notifier).verifyOtpVirtualAccount(
                    params: VirtualAccountParams(
                      trxId: trxId,
                      bankCode: topUpData.bankCode,
                    ),
                    onError: (message) {
                      Navigator.of(context, rootNavigator: true)
                          .pop(); // Tutup dialog proses
                      context.customErrorDialog(message);
                    },
                    onSuccess: (message) {
                      Navigator.of(context, rootNavigator: true)
                          .pop(); // Tutup dialog proses
                      context.pushNamed(RouteName.topUpSuccess);
                      ref.invalidate(fetchBalanceProvider);
                      ref.invalidate(fetchTransactionProvider);
                    },
                  );
            },
          );
    }

    Future<void> authenticateAndProceed() async {
      final tokenManager = await ref.read(tokenManagerProvider.future);
      final bool isFingerprintEnabled =
          await tokenManager.isFingerprintEnabled();

      if (isFingerprintEnabled) {
        final canCheckBiometrics = await auth.canCheckBiometrics;
        final isDeviceSupported = await auth.isDeviceSupported();

        if (canCheckBiometrics && isDeviceSupported) {
          try {
            final didAuthenticate = await auth.authenticate(
              localizedReason: 'Scan your fingerprint or Face ID to proceed',
              options: const AuthenticationOptions(
                biometricOnly: false,
                stickyAuth: true,
              ),
            );

            if (didAuthenticate) {
              // Proceed with the action (top-up) after successful authentication
              await actionTopUpVa();
            } else {
              // If authentication fails, show a dialog or exit
              context.customErrorDialog('Authentication failed');
            }
          } catch (e) {
            // If there's an error during authentication, exit
            context.customErrorDialog('Fingerprint authentication error');
          }
        } else {
          // If device does not support fingerprint, proceed directly
          await actionTopUpVa();
        }
      } else {
        // If fingerprint is not enabled, proceed directly
        await actionTopUpVa();
      }
    }

    return Scaffold(
      backgroundColor: AppColor.secondaryBackground,
      appBar: CustomAppBar(
        backgroundColor: AppColor.secondaryBackground,
        showBackButton: false,
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
                color: AppColor.itemGray,
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Review Detail',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              Gap(12),
              Text(
                'An amount of ${formatCurrency(amount: topUpData.topUpAmount!.toDouble(), currencyCode: topUpData.fromCurrency ?? '')} is estimated to reach your account in seconds',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColor.textGray,
                    ),
              ),
              Gap(16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColor.primaryWhite,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    // Flag
                    ClipOval(
                      child: Image.asset(
                        getCurrencyFlagAsset(
                          topUpData.fromCurrency,
                        ),
                        width: 36,
                        height: 36,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),

                    // Texts
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${topUpData.fromCurrency}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            formatCurrency(
                                amount: topUpData.fromAmount!.toDouble() ?? 0,
                                currencyCode: topUpData.fromCurrency ?? ''),
                            style: TextStyle(
                              fontSize: 13,
                              color: AppColor.textGray,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Gap(16),
              Text(
                'Payment Method',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const Gap(12),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColor.primaryWhite,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    // Flag
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: AppColor.secondaryBackground,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(8), // mengecilkan icon
                      child: Center(
                        child: Image.asset(
                          Assets.icons.bankOutline.path,
                          width: 20,
                          height: 20,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),

                    // Texts
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${topUpData.bankName}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              // Gap(32),
              // Text(
              //   'Target Wallet',
              //   style: Theme.of(context).textTheme.titleMedium?.copyWith(
              //         fontSize: 20,
              //         fontWeight: FontWeight.w500,
              //       ),
              // ),
              // const Gap(12),
              // Container(
              //   padding: const EdgeInsets.all(16),
              //   decoration: BoxDecoration(
              //     color: AppColor.primaryWhite,
              //     borderRadius: BorderRadius.circular(16),
              //   ),
              //   child: Row(
              //     children: [
              //       // Flag
              //       ClipOval(
              //         child: Image.asset(
              //           getCurrencyFlagAsset(
              //             topUpData.toCurrency,
              //           ),
              //           width: 36,
              //           height: 36,
              //           fit: BoxFit.cover,
              //         ),
              //       ),
              //       const SizedBox(width: 12),

              //       // Texts
              //       Expanded(
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               '${topUpData.toCurrency}',
              //               style: Theme.of(context)
              //                   .textTheme
              //                   .bodyMedium
              //                   ?.copyWith(
              //                     fontWeight: FontWeight.w600,
              //                   ),
              //             ),
              //             const SizedBox(height: 4),
              //             Text(
              //               '${topUpData.toAmount} ${topUpData.toCurrency}',
              //               style: TextStyle(
              //                 fontSize: 13,
              //                 color: AppColor.textGray,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Gap(32),
              Text(
                'Your Transfer',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const Gap(12),
              InfoField(
                label: 'You top up exactly ',
                value: formatCurrency(
                    amount: topUpData.topUpAmount!.toDouble() ?? 0,
                    currencyCode: topUpData.fromCurrency ?? ''),
              ),
              Divider(),
              const Gap(16),
              InfoField(
                label: 'Platform Fee (included)',
                value: formatCurrency(
                    amount: topUpData.platformFee ?? 0,
                    currencyCode: topUpData.fromCurrency ?? ''),
              ),
              Divider(),
              const Gap(16),
              InfoField(
                label: 'Partner Fee (included)',
                value: formatCurrency(
                    amount: topUpData.partnerFee ?? 0,
                    currencyCode: topUpData.fromCurrency ?? ''),
              ),
              Divider(),
              const Gap(16),
              InfoField(
                label: 'Total amount we`ll convert',
                value: formatCurrency(
                    amount: topUpData.topUpAmount!.toDouble() ?? 0,
                    currencyCode: topUpData.fromCurrency ?? ''),
              ),
              // Divider(),
              // const Gap(16),
              // const InfoField(
              //   label: 'Guaranteed exchange rate',
              //   value: '1 USD= 86.4764 INR',
              // ),
              Divider(),
              Gap(16),
              InfoField(
                label: 'You will receive',
                value: formatCurrency(
                    amount: (topUpData.topUpAmount ?? 0) -
                        (topUpData.partnerFee ?? 0) -
                        (topUpData.platformFee ?? 0),
                    currencyCode: topUpData.fromCurrency ?? ''),
              ),
              Gap(32),
              RichText(
                text: TextSpan(
                  text: "I accept the ",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                        color: AppColor.primaryBlack,
                      ),
                  children: [
                    TextSpan(
                      text: "Terms of Use",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 14,
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Handle Terms of Use click
                          print("Terms of Use clicked");
                        },
                    ),
                    TextSpan(
                      text: " and ",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 14,
                            color: AppColor.primaryBlack,
                          ),
                    ),
                    TextSpan(
                      text: "Privacy Policy",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 14,
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Handle Terms of Use click
                          print("Terms of Use clicked");
                        },
                    ),
                  ],
                ),
              ),
              const Gap(32),
              Button.filled(
                onPressed: () async {
                  await authenticateAndProceed();
                  // context.showProcessDialog();
                  // Future.delayed(const Duration(seconds: 1), () {
                  //   context.pop(); // Close the dialog

                  //   context.pushNamed(RouteName.verifyOtpTopUp);
                  // });
                  // ref.read(patchTopUpProvider.notifier).topUpVirtualAccount(
                  //     params: VirtualAccountParams(
                  //       walletId: topUpData.fromWalletId,
                  //       totalAmount: TotalAmount(
                  //         value: topUpData.topUpAmount.toString(),
                  //         currency: topUpData.fromCurrency,
                  //       ),
                  //       bankCode: topUpData.bankCode,
                  //       platformFee: topUpData.platformFee,
                  //       partnerFee: topUpData.partnerFee,
                  //       virtualAccountName: topUpData.virtualAccountName,
                  //       virtualAccountEmail: topUpData.virtualAccountEmail,
                  //       virtualAccountPhone: topUpData.virtualAccountPhone,
                  //     ),
                  //     onError: (message) {
                  //       context.customErrorDialog(message);
                  //     },
                  //     onSuccess: (trxId) {
                  //       print('trxId: $trxId');
                  //       print('bankCode: ${topUpData.bankCode}');
                  //       ref
                  //           .read(patchTopUpProvider.notifier)
                  //           .verifyOtpVirtualAccount(
                  //               params: VirtualAccountParams(
                  //                 trxId: trxId,
                  //                 bankCode: topUpData.bankCode,
                  //               ),
                  //               onError: (message) {
                  //                 context.customErrorDialog(message);
                  //               },
                  //               onSuccess: (message) {
                  //                 context.pushNamed(RouteName.topUpSuccess);
                  //               });
                  //     });
                },
                label: 'Continue',
              )
            ],
          ),
        ),
      ),
    );
  }
}

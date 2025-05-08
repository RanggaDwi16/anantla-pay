import 'package:anantla_pay/src/core/helpers/formatters/string_format.dart';
import 'package:anantla_pay/src/core/provider/token_manager_provider.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:anantla_pay/src/presentation/account/controllers/get_transaction/fetch_transaction_provider.dart';
import 'package:anantla_pay/src/presentation/home/controllers/get_balance/fetch_balance_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/controllers/cross_psp_transfer/post_cross_psp_transfer_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/controllers/internal_transfer/post_internal_transfer_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/controllers/transfer_data_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/entities/transfer_params.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/presentation/transfer/widgets/review_detail/info_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:local_auth/local_auth.dart';

final checkboxAgreedProvider = StateProvider<bool>((ref) => false);

class ReviewDetailTransferPage extends ConsumerWidget {
  const ReviewDetailTransferPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isChecked = ref.watch(checkboxAgreedProvider);
    final transferData = ref.watch(transferDataNotifierProvider);

    final LocalAuthentication auth = LocalAuthentication();
    Future<void> actionInternalTransfer() async {
      context.showProcessDialog(); // tampilkan dialog proses

      ref.read(postInternalTransferProvider.notifier).postInternalTranfer(
            params: InternalTransferParams(
              amount: transferData.toAmount ?? 0,
              fromWalletId: transferData.fromWalletId!,
              toWalletId: transferData.toWalletId,
              note: transferData.reason,
            ),
            onError: (message) {
              Navigator.of(context, rootNavigator: true).pop(); // tutup dialog
              context.customErrorDialog(message);
            },
            onSuccess: (message) {
              Navigator.of(context, rootNavigator: true).pop(); // tutup dialog
              ref.invalidate(fetchBalanceProvider);
              ref.invalidate(fetchTransactionProvider);
              context.pushNamed(RouteName.successTransfer);
            },
          );
    }

    Future<void> actionCrossPSPTransfer() async {
      context.showProcessDialog(); // tampilkan dialog proses

      ref.read(postCrossPspTransferProvider.notifier).postCrossPspTransfer(
            params: CrossPspParams(
              amount: transferData.fromAmount ?? 0,
              fromWalletId: transferData.fromWalletId!,
              toWalletId: transferData.toWalletId,
              fromCurrency: transferData.fromCurrency,
              toCurrency: transferData.toCurrency,
              note: transferData.reason,
            ),
            onError: (message) {
              Navigator.of(context, rootNavigator: true).pop(); // tutup dialog

              context.customErrorDialog(
                message,
              );
            },
            onSuccess: (message) {
              Navigator.of(context, rootNavigator: true).pop(); // tutup dialog
              ref.invalidate(fetchBalanceProvider);

              context.pushNamed(RouteName.successTransfer);
            },
          );
    }

    Future<void> authenticateAndTransfer() async {
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
              if (transferData.fromCurrency == transferData.toCurrency) {
                await actionInternalTransfer();
              } else {
                await actionCrossPSPTransfer();
              }
            } else {
              context.customErrorDialog('Authentication failed');
            }
          } catch (e) {
            context.customErrorDialog('Fingerprint authentication error');
          }
        } else {
          if (transferData.fromCurrency == transferData.toCurrency) {
            await actionInternalTransfer();
          } else {
            await actionCrossPSPTransfer();
          }
        }
      } else {
        if (transferData.fromCurrency == transferData.toCurrency) {
          await actionInternalTransfer();
        } else {
          await actionCrossPSPTransfer();
        }
      }
    }

    return Scaffold(
      backgroundColor: AppColor.secondaryBackground,
      appBar: CustomAppBar(
        backgroundColor: AppColor.secondaryBackground,
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
                'An amount of ${formatCurrency(amount: transferData.toAmount ?? 0, currencyCode: transferData.toCurrency ?? '')} is estimated to reach your account in seconds',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColor.textGray,
                    ),
              ),

              Gap(32),
              Text(
                'Payment Method',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 16,
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
                    ClipOval(
                      child: Image.asset(
                        getCurrencyFlagAsset(
                          transferData.fromCurrency,
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
                            '${transferData.fromCurrency} balance',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${formatCurrency(amount: transferData.fromBalance ?? 0, currencyCode: transferData.fromCurrency ?? '')} available',
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
              Gap(32),
              Text(
                '${transferData.fromCurrency} bank details for ${transferData.toName}',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const Gap(12),
              InfoField(
                label: 'Account holder name',
                value: '${transferData.toName}',
              ),
              Divider(),
              const Gap(16),
              InfoField(
                label: 'Phone Number (Optional)',
                value: transferData.toPhone ?? '-',
              ),
              Divider(),
              // const Gap(16),
              // const InfoField(
              //   label: 'Bank name',
              //   value: 'Bank Central Asia',
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
                label: 'You send exactly ',
                value: formatCurrency(
                    amount: transferData.fromCurrency != transferData.toCurrency
                        ? transferData.fromAmount ?? 0
                        : transferData.toAmount ?? 0,
                    currencyCode: transferData.toCurrency ?? '',
                    isTransferAmount: false),
              ),
              Divider(),
              const Gap(16),
              InfoField(
                label: 'TTAL Fees (included)',
                value: formatCurrency(
                    amount: transferData.fees?.isEmpty == true
                        ? 0.0
                        : int.tryParse(transferData.fees ?? '') ?? 0,
                    currencyCode: transferData.toCurrency ?? ''),
              ),
              Divider(),
              const Gap(16),
              InfoField(
                label: 'Total amount we`ll send',
                value: formatCurrency(
                    amount: transferData.toAmount ?? 0,
                    currencyCode: transferData.toCurrency ?? '',
                    isTransferAmount:
                        transferData.fromCurrency != transferData.toCurrency),
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
                label: '${transferData.toName} gets',
                value: formatCurrency(
                    amount: transferData.toAmount ?? 0,
                    currencyCode: transferData.toCurrency ?? '',
                    isTransferAmount:
                        transferData.fromCurrency != transferData.toCurrency),
              ),
              Gap(32),
              // Note
              Text(
                'Note:',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const Gap(8),
              Text(
                '${transferData.reason}',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColor.primaryBlack,
                    ),
              ),
              const Gap(16),
              const Divider(),
              const Gap(16),

// Additional info
              Text(
                'We\'ll learn from this refrensce and provide suggestions for future transfers',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 13,
                      color: AppColor.textGray,
                    ),
              ),
              const Gap(12),
              Text(
                '(rangga@gmail) will be informed via email',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 13,
                      color: AppColor.textGray,
                    ),
              ),
              const Gap(12),
              // Text(
              //   'Lorem ipsum dolor sit amet consectetur. Purus varius pulvinar nunc ac sem. Commodo amet ultricies consectetur massa elementum senectus sollicitudin.',
              //   style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              //         fontSize: 13,
              //         color: AppColor.textGray,
              //       ),
              // ),
              // const Gap(12),
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
                  await authenticateAndTransfer();
                },
                label: 'Confirm and Send',
              ),
// Checkbox Terms
            ],
          ),
        ),
      ),
    );
  }
}

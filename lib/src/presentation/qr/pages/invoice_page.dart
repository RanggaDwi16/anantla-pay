import 'package:anantla_pay/src/core/provider/token_manager_provider.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:anantla_pay/src/presentation/add_money/widgets/add_money/add_money_card.dart';
import 'package:anantla_pay/src/presentation/home/controllers/get_balance/fetch_balance_provider.dart';
import 'package:anantla_pay/src/presentation/qr/controllers/qr_data/qr_data_provider.dart';
import 'package:anantla_pay/src/presentation/qr/controllers/qr_decode/post_qr_decode_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/helpers/formatters/currency_format.dart';
import 'package:anantla_pay/src/core/helpers/formatters/string_format.dart';
import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/presentation/qr/domain/entities/qr_model.dart';
import 'package:anantla_pay/src/presentation/qr/widgets/item_choose_payment.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:local_auth/local_auth.dart';

class InvoicePage extends HookConsumerWidget {
  final QrModel? qrModel;

  const InvoicePage({
    super.key,
    this.qrModel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletData = ref.watch(fetchBalanceProvider);
    final selectedWalletIndex = useState(0);
    final selectedWallet = useState<dynamic>(null);

    final qrData = ref.watch(qrDataProvider);
    final amount = useTextEditingController(
      text: qrData?.amount != null &&
              int.tryParse(qrData!.amount!) != null &&
              int.parse(qrData.amount!) > 0
          ? formatCurrency(
              amount: double.parse(qrData.amount ?? ''),
              currencyCode: qrData.currency ?? 'IDR')
          : '',
    );

    return Scaffold(
      backgroundColor: AppColor.secondaryBackground,
      appBar: CustomAppBar(
        backgroundColor: AppColor.secondaryBackground,
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundColor: AppColor.primaryColor,
                  radius: 40,
                  child: Image.asset(
                    Assets.icons.check.path,
                    width: 40,
                    height: 40,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Gap(14),
              Center(
                child: Text(
                  'Scan Successful',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              // if (qrData?.amount != null &&
              //     int.tryParse(qrData!.amount!) != null &&
              //     int.parse(qrData.amount!) > 0)
              //   _buildRow(
              //     'Total to Pay',
              //     formatByCurrency(qrData.amount!, qrData.currency ?? 'IDR'),
              //     context,
              //   ),
              SizedBox(
                width: context.deviceWidth,
                child: TextField(
                  controller: amount,
                  enabled: qrData?.amount == null ||
                      int.tryParse(qrData!.amount!) == null ||
                      int.parse(qrData.amount!) <= 0,
                  readOnly: qrData?.amount != null &&
                      int.tryParse(qrData!.amount!) != null &&
                      int.parse(qrData.amount!) > 0,
                  onChanged: (value) {
                    if (qrData?.amount != null &&
                        int.tryParse(qrData!.amount!) != null &&
                        int.parse(qrData.amount!) > 0) return;

                    String cleanValue = value.replaceAll(RegExp(r'[^0-9]'), '');
                    final doubleAmount = double.tryParse(cleanValue) ?? 0;
                    final currency = selectedWallet.value?.currency ?? 'USD';

                    final newText = formatCurrency(
                      amount: doubleAmount,
                      currencyCode: currency,
                    );
                    amount.value = TextEditingValue(
                      text: newText,
                      selection:
                          TextSelection.collapsed(offset: newText.length),
                    );
                  },
                  decoration: InputDecoration(
                    hintText: formatCurrency(
                      amount: 0,
                      currencyCode: selectedWallet.value?.currency ?? 'USD',
                    ),
                    hintStyle: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryBlack.withOpacity(0.5),
                    ),
                    border: InputBorder.none,
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
              Text(
                'Choose Payment Method',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              Gap(10),
              walletData.when(
                data: (data) {
                  final wallets = data ?? [];

                  if (wallets.isEmpty) {
                    return const Center(
                        child: Text(
                            "No wallets available. Create wallets first."));
                  }

                  final selectedWallet = wallets[selectedWalletIndex.value];
                  return Column(
                    children: [
                      AddMoneyCard(
                        onTap: () async {
                          final selectedIndex = await showModalBottomSheet<int>(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(24)),
                            ),
                            builder: (_) => _WalletSelector(
                              wallets: wallets,
                              selectedIndex: selectedWalletIndex.value,
                            ),
                          );

                          if (selectedIndex != null) {
                            selectedWalletIndex.value = selectedIndex;
                            amount.text = formatCurrency(
                              amount: 0,
                              currencyCode:
                                  wallets[selectedWalletIndex.value].currency ??
                                      'USD',
                            );
                          }
                        },
                        currency: selectedWallet.currency!,
                        // description: selectedWallet.walletCode!,
                        flagAssetPath: getCurrencyFlagAsset(
                          selectedWallet.currency!,
                        ),
                      ),
                    ],
                  );
                },
                loading: () => const CircularProgressIndicator(),
                error: (e, _) => Text('Error: $e'),
              ),
              // buildItemChoosePayment(
              //   context,
              //   title: 'Wallet',
              //   subtitle: 'Instantly pay using your favorite digital wallet',
              //   iconPath: Assets.icons.card.path,
              //   onTap: () {},
              // ),
              // buildItemChoosePayment(
              //   context,
              //   title: 'Direct Debit',
              //   subtitle: 'Automatically pay straight from your bank account',
              //   iconPath: Assets.icons.debit.path,
              //   onTap: () {},
              // ),
              // buildItemChoosePayment(
              //   context,
              //   title: 'Credit Card',
              //   subtitle: 'Pay securely using your credit card anytime',
              //   iconPath: Assets.icons.cardOutline.path,
              //   onTap: () {},
              // ),
              // buildItemChoosePayment(
              //   context,
              //   title: 'Others',
              //   subtitle: 'Choose other methods that suit your needs',
              //   iconPath: Assets.icons.card.path,
              //   onTap: () {},
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 16,
        ),
        child: Button.filled(
          label: 'Pay',
          onPressed: () async {
            print('Test');
            final tokenManager = await ref.read(tokenManagerProvider.future);
            final isFingerprintEnabled =
                await tokenManager.isFingerprintEnabled();
            print('isFingerprintEnabled: $isFingerprintEnabled');

            // Cek apakah fingerprint aktif
            if (isFingerprintEnabled) {
              final auth = LocalAuthentication();
              final canCheckBiometrics = await auth.canCheckBiometrics;
              final isDeviceSupported = await auth.isDeviceSupported();

              if (canCheckBiometrics && isDeviceSupported) {
                try {
                  final didAuthenticate = await auth.authenticate(
                    localizedReason:
                        'Scan fingerprint atau Face ID untuk masuk',
                    options: const AuthenticationOptions(
                      biometricOnly: true,
                      stickyAuth: true,
                    ),
                  );

                  if (!didAuthenticate) {
                    context.customErrorDialog('Failed');
                  }
                } catch (e) {}
                context.customErrorDialog('Failed');
              } else {
                // Kalau device tidak support, skip (bisa langsung masuk)
                return;
              }
            }

            context.showProcessDialog();
            Future.delayed(const Duration(seconds: 1), () {
              context.pop(); // Close the dialog
              context.pushNamed(RouteName.successScanTransaction);
            });
          },
        ),
      ),
    );
  }

  Widget _buildRow(String label, String? value, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$label:',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColor.textGray,
                ),
          ),
          Text(
            value ?? '-',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
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
          subtitle: Text(wallet.walletCode ?? ''),
          trailing: isSelected
              ? const Icon(Icons.check_circle, color: AppColor.primaryColor)
              : null,
          onTap: () => Navigator.pop(context, index),
        );
      },
    );
  }
}

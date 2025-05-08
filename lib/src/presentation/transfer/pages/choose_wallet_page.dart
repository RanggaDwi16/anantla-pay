import 'package:anantla_pay/src/core/helpers/formatters/string_format.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/presentation/home/controllers/get_balance/fetch_balance_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/controllers/transfer_data_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/helpers/widgets/custom_search_field.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:anantla_pay/src/presentation/transfer/widgets/choose_wallet/mini_wallet_card.dart';
import 'package:anantla_pay/src/presentation/transfer/widgets/choose_wallet/wallet_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ChooseWalletPage extends ConsumerWidget {
  const ChooseWalletPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wallets = ref.watch(fetchBalanceProvider);
    return Scaffold(
      backgroundColor: AppColor.secondaryBackground,
      appBar: CustomAppBar(
        backgroundColor: AppColor.secondaryBackground,
        title: 'Choose Wallet',
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSearchField(
                  hintText: 'Search for a Wallet',
                  onChanged: (value) {},
                  color: AppColor.primaryWhite,
                ),
                Gap(40),
                Text(
                  'Your recent wallets',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const Gap(20),
                wallets.when(
                  data: (data) {
                    final wallet = data![0];
                    return WalletCard(
                      onTap: () {
                        final toCurrency =
                            ref.read(transferDataNotifierProvider).toCurrency;

                        ref
                            .read(transferDataNotifierProvider.notifier)
                            .setCurrencies(
                              fromCurrency: wallet.currency ?? '',
                            );
                        ref
                            .read(transferDataNotifierProvider.notifier)
                            .setFromBalance(wallet.balance!.toInt() ?? 0);

                        final fromCurrency = wallet.currency ?? '';

                        if (fromCurrency == toCurrency) {
                          context.pushNamed(RouteName.transferAmount);
                        } else {
                          context.pushNamed(RouteName.transferAmount);
                        }
                      },

                      currency: wallet.currency ?? '',
                      description: maskWalletCode(wallet.walletCode ?? ''),
                      flagAssetPath: getCurrencyFlagAsset(wallet
                          .currency), // atau Assets.flags.us.path jika pakai gen
                    );
                  },
                  error: (error, stackTrace) {
                    return Center(
                      child: Text(
                        'Error: $error',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColor.primaryBlack,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    );
                  },
                  loading: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ],
            ),
          ),
          const Gap(40),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.primaryWhite,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.deviceWidth * 0.05,
                  vertical: context.deviceHeight * 0.03,
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'All Wallet:',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                      const Gap(20),
                      wallets.when(
                        data: (data) {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: data!.length,
                            itemBuilder: (context, index) {
                              final wallet = data[index];

                              return MiniWalletCard(
                                onTap: () {
                                  final toCurrency = ref
                                      .read(transferDataNotifierProvider)
                                      .toCurrency;

                                  ref
                                      .read(
                                          transferDataNotifierProvider.notifier)
                                      .setCurrencies(
                                        fromCurrency: wallet.currency ?? '',
                                      );

                                  ref
                                      .read(
                                          transferDataNotifierProvider.notifier)
                                      .setFromBalance(
                                          wallet.balance!.toInt() ?? 0);
                                  final fromCurrency = wallet.currency ?? '';

                                  if (fromCurrency == toCurrency) {
                                    context.pushNamed(RouteName.transferAmount);
                                  } else {
                                    context.pushNamed(RouteName.transferAmount);
                                  }
                                },
                                currency: wallet.currency ?? '',
                                description: wallet.walletCode ?? '',
                                flagAssetPath: getCurrencyFlagAsset(
                                  wallet.currency ?? '',
                                ),
                              );
                            },
                          );
                        },
                        error: (error, stackTrace) {
                          return Center(
                            child: Text(
                              'Error: $error',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: AppColor.primaryBlack,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                          );
                        },
                        loading: () {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

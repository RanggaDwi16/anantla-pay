import 'package:anantla_pay/src/core/helpers/formatters/string_format.dart';
import 'package:anantla_pay/src/presentation/account/controllers/get_balance/fetch_balance_provider.dart';
import 'package:anantla_pay/src/presentation/add_money/controllers/top_up_data_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/presentation/add_money/widgets/pick_wallet/pick_wallet_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TopUpPickWalletPage extends ConsumerWidget {
  const TopUpPickWalletPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wallet = ref.watch(fetchBalanceProvider);
    return Scaffold(
        backgroundColor: AppColor.secondaryBackground,
        appBar: CustomAppBar(
          backgroundColor: AppColor.secondaryBackground,
          title: 'Pick a Wallet to Add',
          centertitle: true,
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
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              wallet.when(
                  data: (data) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: data!.length,
                        itemBuilder: (context, index) {
                          final wallet = data[index];
                          return PickWalletCard(
                            onTap: () {
                              ref
                                  .read(topUpDataNotifierProvider.notifier)
                                  .setToWalletId(wallet.walletId ?? 0);
                              ref
                                  .read(topUpDataNotifierProvider.notifier)
                                  .setToCurrency(wallet.currency ?? '');
                              ref
                                  .read(topUpDataNotifierProvider.notifier)
                                  .setToAmount(wallet.balance ?? 0);
                              context.pushNamed(RouteName.topUpReviewDetail);
                            },
                            currency: wallet.currency ?? '',
                            description: wallet.walletCode ?? '',
                            flagAssetPath:
                                getCurrencyFlagAsset(wallet.currency ?? ''),
                          );
                        },
                      ),
                    );
                  },
                  error: (error, stackTrace) => Center(
                        child: Text(
                          'Error: $error',
                        ),
                      ),
                  loading: () => const Center(
                        child: CircularProgressIndicator(),
                      )),
            ],
          ),
        ));
  }
}

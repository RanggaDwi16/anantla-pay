import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/presentation/add_money/controllers/top_up_data_provider.dart';
import 'package:anantla_pay/src/presentation/add_money/widgets/item_topup_option.dart';
import 'package:anantla_pay/src/presentation/transfer/controllers/transfer_data_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class TopUpOptionPage extends ConsumerWidget {
  const TopUpOptionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletId = ref.watch(topUpDataNotifierProvider).fromWalletId;

    return Scaffold(
      backgroundColor: AppColor.secondaryBackground,
      appBar: CustomAppBar(
        backgroundColor: AppColor.secondaryBackground,
        title: 'Choose Top Up Method',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // buildTopUpOption(
            //   context,
            //   title: 'Add to My Wallet',
            //   subtitle: 'Add money to your own wallet now',
            //   iconPath: Assets.icons.wallet.path,
            //   onTap: () {
            //     context.pushNamed(RouteName.pickWallet);
            //   },
            // ),
            // buildTopUpOption(
            //   context,
            //   title: 'Add to Other Wallet',
            //   subtitle: "Add money to a friend's wallet easily",
            //   iconPath: Assets.icons.wallet.path,
            //   onTap: () {},
            // ),
            buildTopUpOption(
              context,
              title: 'Virtual Account Top Up',
              subtitle:
                  'Manually transfer the money from a Bank account to your wallet.',
              iconPath: Assets.icons.bankOutline.path,
              onTap: () {
                context.pushNamed(RouteName.topUpChooseBank);
              },
            ),
          ],
        ),
      ),
    );
  }
}

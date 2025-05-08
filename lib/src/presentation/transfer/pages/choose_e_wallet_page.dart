import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/helpers/widgets/custom_search_field.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:anantla_pay/src/presentation/transfer/data/e-wallet.dart';
import 'package:anantla_pay/src/presentation/transfer/widgets/choose_e_wallet/e_wallet_card.dart';
import 'package:anantla_pay/src/presentation/transfer/widgets/choose_e_wallet/mini_e_wallet_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ChooseEWalletPage extends ConsumerWidget {
  const ChooseEWalletPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColor.secondaryBackground,
      appBar: CustomAppBar(
        backgroundColor: AppColor.secondaryBackground,
        title: 'Choose E-Wallet',
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
          // 🔼 Section atas: search + recent
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSearchField(
                  hintText: 'Search for a E-Wallet',
                  onChanged: (value) {},
                  color: AppColor.primaryWhite,
                ),
                const Gap(40),
                Text(
                  'Last E-Wallet You Used',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const Gap(20),
                EWalletCard(
                  onTap: () {},
                  wallet: eWallets[3]['name']!,
                  description: eWallets[3]['description']!,
                  assetPath: eWallets[3]['asset']!,
                ),
                const Gap(20),
              ],
            ),
          ),

          // 🔽 Scrollable All Wallet container
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Transfer to Other Wallets',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    const Gap(20),
                    Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: eWallets.length,
                        itemBuilder: (context, index) {
                          final wallet = eWallets[index];
                          return MiniEWalletCard(
                            onTap: () {},
                            currency: wallet['name']!,
                            description: wallet['description']!,
                            assetPath: wallet['asset']!,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

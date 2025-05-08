import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/presentation/account/controllers/top_up/top_up_data_provider.dart';
import 'package:anantla_pay/src/presentation/home/controllers/get_user/fetch_user_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/controllers/transfer_data_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/widgets/item_transfer_option.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';

class TransferPage extends ConsumerWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async {
        // context.goNamed(RouteName.home);
        ref.read(transferDataNotifierProvider.notifier).reset();
        ref.read(topUpDataNotifierProvider.notifier).reset();
        return true;
      },
      child: Scaffold(
        backgroundColor: AppColor.secondaryBackground,
        appBar: CustomAppBar(
          backgroundColor: AppColor.secondaryBackground,
          title: 'Transfer',
          centertitle: true,
          leading: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: GestureDetector(
              onTap: () {
                ref.read(transferDataNotifierProvider.notifier).reset();
                ref.read(topUpDataNotifierProvider.notifier).reset();
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
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// **Transfer Between Wallets**
              buildTransferOption(
                context,
                title: "Transfer Between Wallets",
                subtitle: "Send money instantly to any Anantla Pay user",
                iconPath: Assets.icons.wallet.path,
                onTap: () {
                  ref
                      .read(transferDataNotifierProvider.notifier)
                      .setTransferType(TransferType.internal);

                  context.pushNamed(RouteName.internalTransfer);
                  // context.pushNamed(RouteName.chooseWallet);
                },
              ),

              /// **Transfer Cross PSP**
              buildTransferOption(context,
                  title: "Transfer Other Wallet",
                  subtitle: "Send money to GoPay, OVO, Dana, LinkAja",
                  iconPath: Assets.icons.wallet.path, onTap: () {
                // context.pushNamed(RouteName.chooseEWallet);
                ref
                    .read(transferDataNotifierProvider.notifier)
                    .setTransferType(TransferType.crossPSP);
                context.push(RouteName.crossPspTransfer);
              }),
              buildTransferOption(context,
                  title: "Transfer to Bank Account",
                  subtitle: "Move your money safely to any bank account",
                  iconPath: Assets.icons.bankOutline.path, onTap: () {
                // context.pushNamed(RouteName.chooseWallet);
                final user = ref.read(fetchUserProvider).value;
                ref.read(transferDataNotifierProvider.notifier).setTransferType(
                      TransferType.crossPSP,
                    );
                ref
                    .read(transferDataNotifierProvider.notifier)
                    .setVirtualAccountPhone(user?.phone ?? "");
                ref
                    .read(transferDataNotifierProvider.notifier)
                    .setVirtualAccountName(user?.username ?? "");
                ref
                    .read(transferDataNotifierProvider.notifier)
                    .setVirtualAccountEmail(user?.email ?? "");
                context.pushNamed(RouteName.chooseBank);
                // context.pushNamed(RouteName.crossPspTransfer);
              }),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/presentation/account/controllers/top_up/top_up_data_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/controllers/transfer_data_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/widgets/item_transfer_option.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
        appBar: CustomAppBar(
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
                  color: AppColor.itemGray, // abu-abu terang sesuai gambar
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
                subtitle: "Send money to another Anantla Pay user",
                iconPath: Assets.icons.wallet.path,
                onTap: () {
                  ref
                      .read(transferDataNotifierProvider.notifier)
                      .setTransferType(TransferType.internal);

                  context.pushNamed(RouteName.internalTransfer);
                },
              ),

              /// **Transfer Cross PSP**
              buildTransferOption(context,
                  title: "Transfer Cross PSP",
                  subtitle: "Send money to a bank or digital wallet",
                  iconPath: Assets.icons.transfer.path, onTap: () {
                ref
                    .read(transferDataNotifierProvider.notifier)
                    .setTransferType(TransferType.crossPSP);
                context.push(RouteName.crossPspTransfer);
              }),
            ],
          ),
        ),
      ),
    );
  }
}

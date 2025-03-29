import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/presentation/account/controllers/top_up/top_up_data_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/controllers/transfer_data_provider.dart';
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
        appBar: AppBar(
          title: const Text('Transfer'),
          centerTitle: true,
          backgroundColor: AppColor.primaryWhite,
          elevation: 0.5,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(10),
              const Text(
                "Select Transfer Method",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryBlack,
                ),
              ),
              const Gap(20),
      
              /// **Transfer Between Wallets**
              _buildTransferOption(
                context,
                title: "Transfer Between Wallets",
                subtitle: "Send money to another Anantla Pay user",
                icon: Icons.account_balance_wallet_rounded,
                onTap: () {
                  ref
                      .read(transferDataNotifierProvider.notifier)
                      .setTransferType(TransferType.internal);
                  
                  context.pushNamed(RouteName.internalTransfer);
                },
              ),
      
              /// **Transfer Cross PSP**
              _buildTransferOption(context,
                  title: "Transfer Cross PSP",
                  subtitle: "Send money to a bank or digital wallet",
                  icon: Icons.swap_horiz_rounded, onTap: () {
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

  Widget _buildTransferOption(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 28,
                color: AppColor.primaryBlack,
              ),
            ),
            const Gap(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Gap(4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

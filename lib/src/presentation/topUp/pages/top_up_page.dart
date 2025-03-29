import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:anantla_pay/src/presentation/account/controllers/get_token_virtual_account/fetch_token_virtual_account_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/top_up/top_up_data_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/controllers/transfer_data_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class TopUpPage extends ConsumerWidget {
  const TopUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletId = ref.watch(topUpDataNotifierProvider).walletId;

    print('TopUpPage - Stored Wallet ID: $walletId'); // Debugging log
    // print('TopUpPage walletId: $walletId');
    final methods = [
      // {
      //   'title': 'PayNow',
      //   'subtitle':
      //       'Pay instantly with PayNow to our Unique Entity Number (UEN).',
      //   'icon': Icons.account_balance_outlined,
      // },
      {
        'title': 'Virtual Account Top Up',
        'subtitle':
            'Manually transfer the money from a Bank account to your wallet.',
        'icon': Icons.account_balance_outlined,
      },
    ];

    return WillPopScope(
      onWillPop: () async {
        // context.goNamed(RouteName.home);
        ref.read(transferDataNotifierProvider.notifier).reset();
        ref.read(topUpDataNotifierProvider.notifier).reset();
        return true;
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'How Do You Want To Top Up?',
          centertitle: true,
          showBackButton: false,
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(20),
          itemCount: methods.length,
          separatorBuilder: (_, __) => const Gap(12),
          itemBuilder: (context, index) {
            final method = methods[index];

            return InkWell(
              onTap: () {
                // ✅ Handle navigation berdasarkan index
                switch (index) {
                  // case 0:
                  //   // Navigasi ke PayNowPage
                  //   // context.pushNamed(RouteName.pay);
                  //   context.showCustomSnackBar('Coming Soon');
                  //   break;
                  case 0:
                    // Navigasi ke ManualBankTransferPage
                    ref
                        .read(fetchTokenVirtualAccountProvider.notifier)
                        .fetchTokenVirtualAccount(onSuccess: () {
                      print('Token Virtual Account Success ');
                      context.pushNamed(RouteName.payload);
                    }, onError: () {
                      context.showCustomSnackBar(
                          'Failed to get Virtual Account Token');
                    });
                    break;
                }
              },
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
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
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        method['icon'] as IconData,
                        size: 24,
                        color: AppColor.primaryBlack,
                      ),
                    ),
                    const Gap(12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            method['title'] as String,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          const Gap(4),
                          Text(
                            method['subtitle'] as String,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 13,
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
          },
        ),
      ),
    );
  }
}

// ignore_for_file: unused_import

import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/main/controllers/auth/authentication_provider.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:anantla_pay/src/presentation/account/controllers/activate_wallet/post_activate_wallet_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/create_wallet/post_wallet_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/e-kyc/post_ekyc_verification_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/get_all_country/fetch_all_country_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/get_balance/fetch_balance_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/get_transaction/fetch_transaction_provider.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/create_wallet_params.dart';
import 'package:anantla_pay/src/presentation/account/widgets/history_transaction_item.dart';
import 'package:anantla_pay/src/presentation/account/widgets/wallet_empty_state.dart';
import 'package:anantla_pay/src/presentation/main/controllers/user_id_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/constant/path.dart';
import 'package:anantla_pay/src/presentation/account/widgets/pending_transaction_widget.dart';
import 'package:anantla_pay/src/presentation/account/widgets/sections/balance_section.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class AccountPage extends ConsumerWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balance = ref.watch(fetchBalanceProvider);
    final transaction = ref.watch(fetchTransactionProvider);

    Future<void> onRefresh(WidgetRef ref) async {
      ref.invalidate(fetchBalanceProvider);
      ref.invalidate(fetchTransactionProvider);
    }

    return Scaffold(
      appBar: CustomAppBar(
        showBackButton: false,
        title: 'Account',
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              width: 50,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  ImagePath.avatar1,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                ref.read(authenticationProvider.notifier).logout(onSuccess: () {
                  context.showSuccessDialog(
                    title: 'Logout',
                    message: 'Logout Success',
                    onConfirm: () {
                      context.pushReplacementNamed(RouteName.login);
                    },
                  );
                }, onError: () {
                  print('Error Logout');
                });
              },
              child: Icon(
                Icons.logout,
                color: AppColor.textGray,
              ),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => onRefresh(ref),
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  balance.when(
                      data: (data) => BalanceSection(),
                      loading: () => Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: Container(
                              height: 170,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                      error: (error, stack) {
                        // return WalletEmptyState();
                        return Text(
                          'Error: $error',
                          style: const TextStyle(
                            color: AppColor.textGray,
                            fontSize: 14,
                          ),
                        );
                      }),
                  const Gap(24),
                  Text(
                    "Pending",
                    style: TextStyle(
                      color: AppColor.textGray,
                      fontSize: 14,
                    ),
                  ),
                  const Gap(10),
                  buildPendingTransaction(),
                  const Gap(24),
                  transaction.when(
                    data: (data) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "History",
                            style: TextStyle(
                              color: AppColor.textGray,
                              fontSize: 14,
                            ),
                          ),
                          const Gap(10),
                          data.isEmpty
                              ? const Center(
                                  child: Text(
                                    "No Transaction Found",
                                    style: TextStyle(
                                      color: AppColor.textGray,
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              : Column(
                                  children: List.generate(
                                    data.length,
                                    (index) => HistoryTransactionItem(
                                        data: data[index]),
                                  ),
                                )
                        ],
                      );
                    },
                    loading: () => Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        height: 170,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    error: (error, stack) => Text('Error: $error'),
                  ),
                  const SizedBox(height: 100), // extra bottom padding for nav
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

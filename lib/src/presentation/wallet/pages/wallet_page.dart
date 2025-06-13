import 'package:anantla_pay/src/core/helpers/formatters/string_format.dart';
import 'package:anantla_pay/src/presentation/account/controllers/get_transaction/fetch_transaction_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/onboard_iron/post_onboard_iron_provider.dart';
import 'package:anantla_pay/src/presentation/home/controllers/get_user/fetch_user_provider.dart';
import 'package:anantla_pay/src/presentation/home/widgets/all_transaction/all_transaction_content.dart';
import 'package:anantla_pay/src/presentation/home/widgets/all_transaction/transaction_item_widget.dart';
import 'package:anantla_pay/src/presentation/wallet/data/transaction_data.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/constant/path.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:anantla_pay/src/presentation/home/widgets/icon_circle_widget.dart';
import 'package:anantla_pay/src/presentation/wallet/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class WalletPage extends ConsumerWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(fetchUserProvider);
    final transactions = ref.watch(fetchTransactionProvider);

    return Scaffold(
      backgroundColor: AppColor.secondaryBackground,
      appBar: CustomAppBar(
        showBackButton: false,
        backgroundColor: AppColor.secondaryBackground,
        customTitleWidget: Row(
          children: [
            user.value?.profilePicture != null
                ? CircleAvatar(
                    backgroundImage: NetworkImage(
                      user.value!.profilePicture!,
                    ),
                    backgroundColor: AppColor.primaryWhite,
                    radius: 22,
                  )
                : CircleAvatar(
                    backgroundImage: AssetImage(
                      Assets.images.a1.path,
                    ),
                    radius: 22,
                  ),
            const Gap(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, ${user.value?.username ?? "...."}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColor.primaryBlack,
                          fontWeight: FontWeight.w600,
                        ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconCircle(
            imagePath: Assets.icons.setting.path,
            onTap: () => context.pushNamed(RouteName.setting),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          WalletCardList(),
          const Gap(16),

          /// Onboard Testing Iron
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Button.filled(
              onPressed: () {
                ref.read(postOnboardIronProvider.notifier).postOnboardIron(
                      userId: user.value?.userId ?? 0,
                      onSuccess: (message) {
                        context.showSuccessDialog(
                          title: 'Success',
                          message: 'Successfully onboarded to Transfy',
                          onConfirm: () {},
                        );
                      },
                      onError: (message) {
                        context.showCustomSnackBar(message, isError: true);
                      },
                    );
              },
              label: "Onboard Transfy",
            ),
          ),

          const SizedBox(height: 24),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.primaryWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Last transactions:',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: AppColor.primaryBlack,
                                  ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              context.pushNamed(RouteName.allTransaction),
                          child: Text(
                            'See All',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: AppColor.primaryColor,
                                ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(12),

                    /// Scrollable items only
                    transactions.when(
                      data: (data) {
                        if (data.isEmpty) {
                          return const Center(
                            child: Text(
                              'No transactions found',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColor.primaryBlack,
                              ),
                            ),
                          );
                        }
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: data.length > 5 ? 5 : data.length,
                          itemBuilder: (context, index) {
                            final transaction = data[index];
                            return TransactionItem(
                              name: formatTransactionType(
                                  transaction.transWalletType),
                              date: transaction.transactionDate
                                      ?.toIso8601String() ??
                                  '',
                              amount: transaction.amount.toString(),
                              currency: transaction.currencyTo ?? '',
                              statusLabel: transaction.transactionType ?? '',
                              iconPath: transaction.transactionType ?? '',
                            );
                          },
                        );
                      },
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      error: (error, stack) {
                        return Center(
                          child: Text(
                            'Error: $error',
                            style: const TextStyle(
                              fontSize: 16,
                              color: AppColor.primaryBlack,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// **Widget untuk Tampilan Kartu Virtual**
}

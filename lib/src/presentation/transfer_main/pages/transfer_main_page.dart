import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/helpers/formatters/string_format.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/presentation/account/controllers/get_transaction/fetch_transaction_provider.dart';
import 'package:anantla_pay/src/presentation/home/controllers/get_user/fetch_user_provider.dart';
import 'package:anantla_pay/src/presentation/home/widgets/all_transaction/transaction_item_widget.dart';
import 'package:anantla_pay/src/presentation/home/widgets/icon_circle_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class TransferMainPage extends ConsumerWidget {
  const TransferMainPage({super.key});

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
            imagePath: Assets.icons.notification.path,
            onTap: () {
              context.pushNamed(RouteName.notification);
            },
          ),
          SizedBox(width: 8),
          IconCircle(
            imagePath: Assets.icons.setting.path,
            onTap: () => context.pushNamed(RouteName.setting),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(16),
          //   child: Container(
          //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.circular(16),
          //     ),
          //     child: Row(
          //       children: [
          //         // Income
          //         Expanded(
          //           child: GestureDetector(
          //             onTap: () {
          //               context.pushNamed(RouteName.receive);
          //             },
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Icon(Icons.arrow_upward,
          //                     color: AppColor.primaryColor2, size: 18),
          //                 const SizedBox(width: 10),
          //                 Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     Text(
          //                       'Received',
          //                       style: Theme.of(context)
          //                           .textTheme
          //                           .labelLarge!
          //                           .copyWith(
          //                             fontSize: 12,
          //                             color: AppColor.textGray,
          //                             fontWeight: FontWeight.w400,
          //                           ),
          //                     ),
          //                     const SizedBox(height: 4),
          //                     Text(
          //                       '\$ 20,000',
          //                       style: Theme.of(context)
          //                           .textTheme
          //                           .headlineSmall!
          //                           .copyWith(
          //                             fontSize: 16,
          //                             fontWeight: FontWeight.w500,
          //                           ),
          //                     ),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),

          //         // Divider
          //         Container(
          //           width: 1,
          //           height: 40,
          //           color: Colors.grey.shade300,
          //         ),

          //         // Outcome
          //         Expanded(
          //           child: GestureDetector(
          //             onTap: () {
          //               context.pushNamed(RouteName.spent);
          //             },
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Icon(Icons.arrow_downward,
          //                     color: AppColor.errorRed, size: 18),
          //                 const SizedBox(width: 10),
          //                 Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     Text(
          //                       'Spent',
          //                       style: Theme.of(context)
          //                           .textTheme
          //                           .labelLarge!
          //                           .copyWith(
          //                             fontSize: 12,
          //                             color: AppColor.textGray,
          //                             fontWeight: FontWeight.w400,
          //                           ),
          //                     ),
          //                     const SizedBox(height: 4),
          //                     Text(
          //                       '\$ 17,000',
          //                       style: Theme.of(context)
          //                           .textTheme
          //                           .headlineSmall!
          //                           .copyWith(
          //                             fontSize: 16,
          //                             fontWeight: FontWeight.w500,
          //                           ),
          //                     ),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          Gap(16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    context.pushNamed(RouteName.comingSoon);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFE6F5F0),
                            ),
                            child: Image.asset(
                              Assets.icons.arrowRight.path,
                              width: 20,
                              height: 20,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pay Someone',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.primaryBlack,
                                      ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Send money to wallet, e-wallet,\nor bank.',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: AppColor.textGray,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.arrow_forward_ios_rounded,
                              size: 16, color: Colors.black),
                        ],
                      ),
                    ),
                  ),
                ),
                const Divider(height: 1),
                GestureDetector(
                  onTap: () {
                    context.pushNamed(RouteName.comingSoon);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFFFF0F0),
                            ),
                            child: Image.asset(
                              Assets.icons.arrowLeft.path,
                              width: 20,
                              height: 20,
                              color: AppColor.errorRed,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Request Money',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.primaryBlack,
                                      ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Ask money via wallet, e-wallet,\nor bank.',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: AppColor.textGray,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.arrow_forward_ios_rounded,
                              size: 16, color: Colors.black),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Gap(32),
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
                              name: transaction.transWalletType ?? '',
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
}

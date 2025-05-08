import 'package:anantla_pay/src/presentation/account/controllers/get_transaction/fetch_transaction_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/presentation/home/widgets/all_transaction/transaction_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:go_router/go_router.dart';

class LastTransactionSection extends ConsumerWidget {
  const LastTransactionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(fetchTransactionProvider);
    return Column(
      children: [
        // Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Last transactions:',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: AppColor.primaryBlack,
                  ),
            ),
            GestureDetector(
              onTap: () => context.pushNamed(RouteName.allTransaction),
              child: Text(
                'See All',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColor.primaryColor,
                    ),
              ),
            ),
          ],
        ),
        const Gap(12),

        // List of items
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
                  date: transaction.transactionDate?.toIso8601String() ?? '',
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
    );
  }

  Color _parseColor(String? hexColor) {
    if (hexColor == null || hexColor.isEmpty) return Colors.grey;
    final hex = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hex', radix: 16));
  }
}

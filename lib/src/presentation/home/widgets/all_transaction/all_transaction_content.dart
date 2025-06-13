import 'package:anantla_pay/src/core/helpers/formatters/string_format.dart';
import 'package:anantla_pay/src/presentation/account/controllers/get_transaction/fetch_transaction_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/presentation/home/widgets/all_transaction/transaction_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AllTransactionContent extends ConsumerWidget {
  const AllTransactionContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(fetchTransactionProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.primaryWhite,
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: transactions.when(
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
            return ListView.separated(
              padding: const EdgeInsets.only(bottom: 16),
              itemCount: data.length,
              separatorBuilder: (_, __) => const Gap(8),
              itemBuilder: (context, index) {
                final transaction = data[index];
                return TransactionItem(
                  name: formatTransactionType(transaction.transWalletType),
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
      ),
    );
  }
}

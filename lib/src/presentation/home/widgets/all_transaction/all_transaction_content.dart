import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/presentation/home/widgets/all_transaction/transaction_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AllTransactionContent extends StatelessWidget {
  const AllTransactionContent({super.key});

  @override
  Widget build(BuildContext context) {
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'March 14',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColor.primaryBlack,
                      fontSize: 16,
                    ),
              ),
              const Gap(12),
              TransactionItem(
                name: 'To your INR balance',
                date: '2024-04-06T15:05:00',
                amount: '170000',
                currency: 'INR',
                iconPath: Assets.icons.addmoney.path,
                statusColor: AppColor.textGray,
                statusLabel: 'Added',
              ),
              TransactionItem(
                name: 'Alya Nirmala',
                date: '2024-04-06T15:05:00',
                amount: '160000',
                currency: 'INR',
                iconPath: Assets.icons.addmoney.path,
                statusColor: AppColor.textGray,
                statusLabel: 'Sent',
              ),
              TransactionItem(
                name: 'Dimas Aryo',
                date: '2024-04-06T15:05:00',
                amount: '170000',
                currency: 'INR',
                iconPath: Assets.icons.addmoney.path,
                statusLabel: 'Declined',
                statusColor: AppColor.textGray,
              ),
              Gap(24),
              Text(
                'March 15',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColor.primaryBlack,
                      fontSize: 16,
                    ),
              ),
              Gap(12),
              TransactionItem(
                name: 'Top Up Dana',
                date: '2024-04-06T15:05:00',
                amount: '170000',
                currency: 'INR',
                iconPath: Assets.icons.addmoney.path,
                statusLabel: 'Added',
                statusColor: AppColor.textGray,
              ),
              TransactionItem(
                name: 'Tari Safira',
                date: '2024-04-06T15:05:00',
                amount: '100000',
                currency: 'INR',
                iconPath: Assets.icons.addmoney.path,
                statusLabel: 'Refund',
                statusColor: AppColor.textGray,
              ),
              TransactionItem(
                name: 'Top Up Dana',
                date: '2024-04-06T15:05:00',
                amount: '170000',
                currency: 'INR',
                iconPath: Assets.icons.addmoney.path,
                statusLabel: 'Added',
                statusColor: AppColor.textGray,
              ),
              TransactionItem(
                name: 'Tari Safira',
                date: '2024-04-06T15:05:00',
                amount: '100000',
                currency: 'INR',
                iconPath: Assets.icons.addmoney.path,
                statusLabel: 'Refund',
                statusColor: AppColor.textGray,
              ),
              TransactionItem(
                name: 'Top Up Dana',
                date: '2024-04-06T15:05:00',
                amount: '170000',
                currency: 'INR',
                iconPath: Assets.icons.addmoney.path,
                statusLabel: 'Added',
                statusColor: AppColor.textGray,
              ),
              TransactionItem(
                name: 'Tari Safira',
                date: '2024-04-06T15:05:00',
                amount: '100000',
                currency: 'INR',
                iconPath: Assets.icons.addmoney.path,
                statusLabel: 'Refund',
                statusColor: AppColor.textGray,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

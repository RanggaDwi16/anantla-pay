import 'package:flutter/material.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:gap/gap.dart';

class DetailsAddTab extends StatelessWidget {
  const DetailsAddTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Transaction details',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppColor.primaryBlack,
                ),
          ),
          const Gap(20),
          _detailItem(
            context,
            title: 'When',
            value: 'Declined – Apr 6, 2024, 3:05 PM',
          ),
          const Gap(16),
          _detailItem(
            context,
            title: 'No Transaction',
            value: '#2042107195',
          ),
          const Gap(16),
          _detailItem(
            context,
            title: 'Wise’s fees',
            value: '0 USD',
          ),
          const Divider(height: 32),
          _detailItem(
            context,
            title: 'Amount Added',
            value: '300,000 IDR',
            isBold: true,
          ),
        ],
      ),
    );
  }

  Widget _detailItem(
    BuildContext context, {
    required String title,
    required String value,
    bool isBold = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColor.textGray,
              ),
        ),
        Flexible(
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
                  color: AppColor.primaryBlack,
                ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}

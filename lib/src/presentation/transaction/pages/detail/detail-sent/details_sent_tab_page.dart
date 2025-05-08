import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

class DetailsSentTab extends StatelessWidget {
  const DetailsSentTab({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle labelStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: AppColor.textGray,
        );
    TextStyle valueStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontWeight: FontWeight.w600,
        );

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Section 1: Transaction details
          Text(
            'Transaction details',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
          ),
          const SizedBox(height: 16),
          _infoRow('When', 'Declined – Apr 6, 2024, 3:05 PM', labelStyle,
              valueStyle),
          _infoRow('No Transaction', '#2042107195', labelStyle, valueStyle),
          _infoRow('Wise’s fees', '1,15 USD', labelStyle, valueStyle),
          _infoRow('We converted', '5,07 USD', labelStyle, valueStyle),
          _infoRow('Exchange rate', '0 USD', labelStyle, valueStyle),
          const Divider(height: 32),
          _infoRow(
              'Nico Yudhanto received', '60,000 IDR', labelStyle, valueStyle),

          const SizedBox(height: 32),

          /// Section 2: Account details
          Text(
            'Nico Yudhanto’s account details',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
          ),
          const SizedBox(height: 16),
          _infoRow(
              'Account holder name', 'Nico Yudhanto', labelStyle, valueStyle),
          _infoRow('No Transaction', '707070', labelStyle, valueStyle),
          _infoRow('Account number (IDR accounts only)', '707070', labelStyle,
              valueStyle),
          _infoRow(
              'Email (Optional)', 'Nico@gmail.com', labelStyle, valueStyle),
          _infoRow(
              'Bank name', 'BCA Bank Central Asia', labelStyle, valueStyle),
        ],
      ),
    );
  }

  Widget _infoRow(
    String label,
    String value,
    TextStyle labelStyle,
    TextStyle valueStyle,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Label
          Expanded(
            flex: 1,
            child: Text(
              label,
              style: labelStyle,
            ),
          ),

          /// Spacer
          const SizedBox(width: 12),

          /// Value
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                value,
                style: valueStyle,
                textAlign: TextAlign.right,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

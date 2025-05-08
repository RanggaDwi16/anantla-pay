import 'package:anantla_pay/src/core/helpers/formatters/transaction_format.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/helpers/formatters/string_format.dart';
import 'package:go_router/go_router.dart';

class TransactionItem extends StatelessWidget {
  final String name;
  final String date;
  final String amount;
  final String currency;
  // final String converted;
  final String? iconPath;
  final String statusLabel;
  final Color? statusColor;

  const TransactionItem({
    super.key,
    required this.name,
    required this.date,
    required this.amount,
    required this.currency,
    // required this.converted,
    this.iconPath,
    required this.statusLabel,
    this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        statusLabel == 'Added'
            ? context.pushNamed(RouteName.detailAdd)
            : statusLabel == 'Declined'
                ? context.pushNamed(RouteName.detailCancel)
                : statusLabel == 'Refund'
                    ? context.pushNamed(RouteName.detailRefund)
                    : context.pushNamed(RouteName.detailSent);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: const BoxDecoration(
          color: AppColor.primaryWhite,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 0.6,
            ),
          ),
        ),
        child: Row(
          children: [
            // Avatar + Icon
            Stack(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage(Assets.images.a3.path),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Image.asset(
                      getTransactionIcon(iconPath ?? ''),
                      width: 12,
                      height: 12,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(width: 12),

            // Name, status, date
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  const Gap(4),
                  Text(
                    '${convertTransactionTypeToStatusLabel(statusLabel)} • ${formatEnglishDate(date)}',
                    style: TextStyle(
                      fontSize: 12,
                      color: statusColor,
                    ),
                  ),
                ],
              ),
            ),

            // Amounts
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  _buildAmountText(),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: _getAmountColor(),
                    decoration: statusLabel.toLowerCase() == 'declined'
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                const Gap(4),
                // Text(
                //   converted,
                //   style: const TextStyle(
                //     fontSize: 12,
                //     color: Colors.grey,
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _buildAmountText() {
    final formatted = formatCurrency(
      amount: double.tryParse(amount) ?? 0,
      currencyCode: currency,
      isTransferAmount: currency != 'IDR',
    );
    if (statusLabel.toLowerCase() == 'added' ||
        statusLabel.toLowerCase() == 'refund') {
      return '+$formatted';
    } else {
      return '$formatted ';
    }
  }

  Color _getAmountColor() {
    if (statusLabel.toLowerCase() == 'declined') {
      return Colors.black;
    } else if (statusLabel.toLowerCase() == 'added' ||
        statusLabel.toLowerCase() == 'refund') {
      return Colors.green;
    } else {
      return Colors.black;
    }
  }
}

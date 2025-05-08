import 'package:anantla_pay/src/presentation/home/widgets/section/do_more_with_aoel_section.dart';
import 'package:anantla_pay/src/presentation/home/widgets/section/exchange_rate_notification_tile.dart';
import 'package:anantla_pay/src/presentation/home/widgets/section/help_and_privacy_section.dart';
import 'package:anantla_pay/src/presentation/home/widgets/section/my_pockets_section.dart';
import 'package:anantla_pay/src/presentation/home/widgets/section/refer_a_friend_section.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/presentation/home/widgets/section/last_transaction_section.dart';
import 'package:anantla_pay/src/presentation/home/widgets/section/conversion_currency_section.dart';

class HomeSummarySection extends StatelessWidget {
  final List<Map<String, String>> transactions;

  const HomeSummarySection({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.primaryWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            LastTransactionSection(),
            const Gap(24),
            const ConversionCurrencySection(),

            const Gap(24),
            const ExchangeRateNotificationTile(),
            // Tambahkan widget lain di bawah sini nanti
            const Gap(24),
            // ExampleWidget(),
            const ReferAFriendSection(),
            const Gap(24),
            const MyPocketsSection(),
            const Gap(24),
            HelpAndPrivacySection(),
            const Gap(24),
            const DoMoreWithAoelSection(),
          ],
        ),
      ),
    );
  }
}

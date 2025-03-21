import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/constant/path.dart';
import 'package:anantla_pay/src/presentation/account/widgets/pending_transaction_widget.dart';
import 'package:anantla_pay/src/presentation/account/widgets/sections/balance_section.dart';
import 'package:anantla_pay/src/presentation/account/widgets/sections/history_section.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
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
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(40),

            /// Saldo utama
            BalanceSection(),
            Gap(40),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pending",
                      style: TextStyle(
                        color: AppColor.textGray,
                        fontSize: 14,
                      ),
                    ),
                    Gap(10),
                    buildPendingTransaction(),
                    Gap(40),
                    const HistorySection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

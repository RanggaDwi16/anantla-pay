import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BalanceSection extends StatelessWidget {
  const BalanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '\$',
                  style: TextStyle(
                    color: AppColor.primaryBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: '5,000.00',
                  style: TextStyle(
                    color: AppColor.primaryBlack,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ' MXN',
                  style: TextStyle(
                    color: AppColor.primaryBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 5),

        /// Saldo dalam USDC
        Center(
          child: Text(
            '285.71 USDC',
            style: TextStyle(
              color: AppColor.textGray,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Button.filled(
              width: 150,
              onPressed: () {
                context.showCustomSnackBar(
                    'Feature is on development. Stay tuned!');
              },
              label: 'Deposit',
              color: AppColor.primaryBlack,
              textColor: Colors.white,
              borderRadius: 12,
            ),
            Gap(10),
            Button.filled(
              width: 150,
              onPressed: () {},
              label: 'Withdraw',
              color: AppColor.primaryBlack,
              borderColor: Colors.white,
              borderRadius: 12,
            ),
          ],
        ),
      ],
    );
  }
}

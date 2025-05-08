import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddMoneyCard extends StatelessWidget {
  final String currency;
  final Function() onTap;
  // final String description;
  final String flagAssetPath;

  const AddMoneyCard({
    super.key,
    required this.onTap,
    required this.currency,
    // required this.description,
    required this.flagAssetPath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColor.primaryWhite,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            // Flag Circle
            ClipOval(
              child: Image.asset(
                flagAssetPath,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
            const Gap(16),

            // Currency info
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currency,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                // const Gap(4),
                // Text(
                //   description,
                //   style: const TextStyle(
                //     fontSize: 13,
                //     color: Colors.black54,
                //   ),
                // ),
              ],
            ),
            Spacer(),
            Image.asset(
              Assets.icons.arrowDown.path,
              width: 24,
              height: 24,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}

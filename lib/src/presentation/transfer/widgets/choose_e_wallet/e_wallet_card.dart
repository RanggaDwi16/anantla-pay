import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EWalletCard extends StatelessWidget {
  final String wallet;
  final Function() onTap;
  final String description;
  final String assetPath;
  const EWalletCard({
    super.key,
    required this.onTap,
    required this.wallet,
    required this.description,
    required this.assetPath,
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
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: AppColor.secondaryBackground,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(8), // mengecilkan icon
              child: Center(
                child: Image.asset(
                  assetPath,
                  width: 20,
                  height: 20,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const Gap(16),

            // Currency info
            Expanded(
              // ✅ gunakan Expanded
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    wallet,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis, // aman
                    maxLines: 1,
                  ),
                  const Gap(4),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                    overflow: TextOverflow.ellipsis, // aman
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

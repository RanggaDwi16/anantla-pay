import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MiniEWalletCard extends StatelessWidget {
  final Function()? onTap;
  final String currency;
  final String description;
  final String assetPath;
  const MiniEWalletCard({
    super.key,
    required this.onTap,
    required this.currency,
    required this.description,
    required this.assetPath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey, width: 0.3),
          ),
        ),
        child: Row(
          children: [
            // Flag
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
                  width: 30,
                  height: 30,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const Gap(16),

            // Texts
            // Currency info
            Expanded(
              // ✅ gunakan Expanded
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currency,
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

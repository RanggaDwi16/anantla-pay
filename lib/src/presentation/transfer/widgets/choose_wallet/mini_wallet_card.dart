import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MiniWalletCard extends StatelessWidget {
  final Function()? onTap;
  final String currency;
  final String description;
  final String flagAssetPath;

  const MiniWalletCard({
    this.onTap,
    super.key,
    required this.currency,
    required this.description,
    required this.flagAssetPath,
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
            ClipOval(
              child: Image.asset(
                flagAssetPath,
                width: 45,
                height: 45,
                fit: BoxFit.cover,
              ),
            ),
            const Gap(16),

            // Texts
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currency,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

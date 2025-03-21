// ignore_for_file: unused_import

import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NavItem extends StatelessWidget {
  final String icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const double iconSize = 24.0; // Ukuran tetap untuk ikon
    const double labelFontSize = 12.0; // Ukuran tetap untuk teks

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0), // Padding seragam
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              IconData(
                int.parse(icon),
                fontFamily: 'MaterialIcons',
              ),
              size: iconSize,
              color: isActive ? AppColor.primaryColor : Colors.grey,
            ),
            const Gap(4),
            Text(
              label,
              style: TextStyle(
                fontSize: labelFontSize, // Ukuran font tetap
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                color: isActive ? AppColor.primaryColor : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NavItem extends StatelessWidget {
  final String icon; // asset path string
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
    const double iconSize = 24.0;
    const double labelFontSize = 12.0;

    final iconWidget = Image.asset(
      icon,
      width: iconSize,
      height: iconSize,
      color: isActive ? Colors.white : Colors.grey,
    );

    final labelWidget = Text(
      label,
      style: TextStyle(
        fontSize: labelFontSize,
        fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
        color: isActive ? Colors.white : Colors.grey,
      ),
    );

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: isActive
            ? const EdgeInsets.symmetric(horizontal: 16, vertical: 8)
            : const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isActive ? AppColor.primaryBlack : Colors.transparent,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children:
              isActive ? [iconWidget, const Gap(8), labelWidget] : [iconWidget],
        ),
      ),
    );
  }
}

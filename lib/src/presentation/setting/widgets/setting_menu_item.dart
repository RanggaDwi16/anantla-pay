// 📁 Buat file baru: `setting_menu_item.dart`

import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:flutter/material.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:gap/gap.dart';

class SettingMenuItem extends StatelessWidget {
  final String title;
  final String icon;
  final String? trailingText;
  final VoidCallback? onTap;

  const SettingMenuItem({
    super.key,
    required this.title,
    required this.icon,
    this.trailingText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: context.deviceHeight * 0.08,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: AppColor.primaryWhite,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Gap(8),
            Image.asset(
              icon,
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
            Gap(20),
            Expanded(
              child: Text(
                title,
                style: title == 'Logout'
                    ? Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xFFD24141),
                        )
                    : Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: AppColor.primaryBlack,
                        ),
              ),
            ),
            if (trailingText != null) ...[
              Text(
                trailingText!,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColor.primaryBlack,
                    ),
              ),
              const Gap(8),
            ],
            const Icon(Icons.chevron_right, size: 20),
          ],
        ),
      ),
    );
  }
}

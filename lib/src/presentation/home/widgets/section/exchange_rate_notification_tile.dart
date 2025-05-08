import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:go_router/go_router.dart';

class ExchangeRateNotificationTile extends StatelessWidget {
  final VoidCallback? onTap;

  const ExchangeRateNotificationTile({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        context.pushNamed(RouteName.comingSoon);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        decoration: BoxDecoration(
          color: AppColor.secondaryBackground,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Image.asset(
              Assets.icons.notificationOnOutline.path,
              width: 25,
              height: 25,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                'Get exchange rate updates',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
            Icon(Icons.chevron_right, size: 20, color: AppColor.primaryColor),
          ],
        ),
      ),
    );
  }
}

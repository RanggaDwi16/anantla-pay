import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:go_router/go_router.dart';

class ReferAFriendSection extends StatelessWidget {
  const ReferAFriendSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(RouteName.comingSoon);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColor.secondaryBackground,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar refer
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                Assets.icons.refer.path,
                width: double.infinity,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
            const Gap(16),

            // Title
            Text(
              'Refer a friend',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: AppColor.primaryBlack,
                  ),
            ),

            const Gap(4),

            // Subtitle
            Text(
              'Tell your friend or family and get rewards',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColor.textGray,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

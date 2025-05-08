import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:go_router/go_router.dart';

class DoMoreWithAoelSection extends StatelessWidget {
  const DoMoreWithAoelSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final itemWidth = (constraints.maxWidth - 12) / 2;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Do more with Cashless',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: AppColor.primaryBlack,
                  ),
            ),
            const Gap(16),

            // Cards in full width
            Row(
              children: [
                _buildCard(
                  width: itemWidth,
                  image: Assets.icons.calendar.path,
                  title: 'Schedule your\ntransfer',
                  onTap: () {
                    context.pushNamed(RouteName.comingSoon);
                  },
                ),
                const SizedBox(width: 12),
                _buildCard(
                  width: itemWidth,
                  image: Assets.icons.setupDebit.path,
                  title: 'Easily Set up\nDirect Debits',
                  onTap: () {
                    context.pushNamed(RouteName.comingSoon);
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildCard({
    required double width,
    required String image,
    required String title,
    required VoidCallback onTap,
  }) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: width,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title di atas
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Gap(14),

                Center(
                  child: Image.asset(
                    image,
                    height: 100,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Ikon close (pojok kanan atas)
        Positioned(
          top: 16,
          right: 8,
          child: Icon(
            Icons.close,
            color: AppColor.textGray,
            size: 18,
          ),
        ),
      ],
    );
  }
}

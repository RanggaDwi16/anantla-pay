import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/presentation/home/controllers/get_user/fetch_user_provider.dart';
import 'package:go_router/go_router.dart';

class UserInfoHeader extends ConsumerWidget {
  const UserInfoHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(fetchUserProvider);

    if (user.value == null) {
      return const SizedBox(); // Bisa diganti shimmer kalau mau
    }

    final userData = user.value!;
    return Container(
      decoration: BoxDecoration(
        color: AppColor.secondaryBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // Avatar
          CircleAvatar(
            radius: 24,
            backgroundImage: userData.profilePicture != null
                ? NetworkImage(userData.profilePicture!)
                : AssetImage(
                        Assets.images.a1.path) // Ganti dengan placeholder image
                    as ImageProvider,
            backgroundColor: AppColor.primaryWhite,
          ),
          const Gap(24),

          // Name & Email
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userData.username ?? '',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColor.primaryBlack,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                ),
                Text(
                  userData.email ?? '',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppColor.textGray,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                ),
              ],
            ),
          ),

          // QR Icon
          GestureDetector(
            onTap: () {
              context.pushNamed(RouteName.comingSoon);
            },
            child: Image.asset(
              Assets.icons.qrCode.path,
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
    );
  }
}

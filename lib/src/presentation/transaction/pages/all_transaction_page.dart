import 'package:anantla_pay/src/presentation/home/widgets/all_transaction/all_transaction_content.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/presentation/home/controllers/get_user/fetch_user_provider.dart';
import 'package:anantla_pay/src/presentation/home/widgets/icon_circle_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AllTransactionPage extends ConsumerWidget {
  const AllTransactionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(fetchUserProvider);

    return Scaffold(
      backgroundColor: AppColor.secondaryBackground,
      appBar: CustomAppBar(
        showBackButton: false,
        backgroundColor: AppColor.secondaryBackground,
        customTitleWidget: Row(
          children: [
            user.value?.profilePicture != null
                ? CircleAvatar(
                    backgroundImage: NetworkImage(
                      user.value!.profilePicture!,
                    ),
                    backgroundColor: AppColor.primaryWhite,
                    radius: 22,
                  )
                : CircleAvatar(
                    backgroundImage: AssetImage(
                      Assets.images.a1.path,
                    ),
                    radius: 22,
                  ),
            const Gap(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, ${user.value?.username ?? "...."}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColor.primaryBlack,
                          fontWeight: FontWeight.w600,
                        ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconCircle(
            imagePath: Assets.icons.notification.path,
            onTap: () {
              context.pushNamed(RouteName.notification);
            },
          ),
          SizedBox(width: 8),
          IconCircle(
            imagePath: Assets.icons.setting.path,
            onTap: () => context.pushNamed(RouteName.setting),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: const AllTransactionContent(),
    );
  }
}

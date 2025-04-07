import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/provider/location_provider.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/presentation/account/controllers/top_up/top_up_data_provider.dart';
import 'package:anantla_pay/src/presentation/home/controllers/get_user/fetch_user_provider.dart';
import 'package:anantla_pay/src/presentation/home/widgets/carousel_widget.dart';
import 'package:anantla_pay/src/presentation/home/widgets/icon_circle_widget.dart';
import 'package:anantla_pay/src/presentation/home/widgets/transaction_item_widget.dart';
import 'package:anantla_pay/src/presentation/main/controllers/user_id_provider.dart';
import 'package:anantla_pay/src/presentation/qr/pages/qris_scanner_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  bool _hasFetchedUser = false;

  Future<void> _onRefresh() async {
    final userId = await ref.read(userIdProvider.future);
    if (userId != null) {
      await ref.read(fetchUserProvider.notifier).fetchUser(
            userId: userId,
            onSuccess: (data) => debugPrint('Refreshed user data'),
            onError: () => debugPrint('Error refreshing user'),
          );
    }
    await ref.read(locationProvider.future);
  }

  @override
  Widget build(BuildContext context) {
    final userIdAsync = ref.watch(userIdProvider);
    final location = ref.watch(locationProvider);
    final user = ref.watch(fetchUserProvider);

    userIdAsync.whenData((userId) {
      if (!_hasFetchedUser && userId != null && user.value == null) {
        _hasFetchedUser = true; // Supaya tidak fetch berkali-kali
        Future.microtask(
          () {
            ref.read(fetchUserProvider.notifier).fetchUser(
                  userId: userId,
                  onSuccess: (data) {
                    debugPrint(
                        'User data fetched successfully ${data.username}');
                    ref
                        .read(topUpDataNotifierProvider.notifier)
                        .setVirtualAccountData(
                          virtualAccountEmail: data.email,
                          virtualAccountName: data.username,
                          virtualAccountPhone: data.phone,
                        );

                    final topUp = ref.read(topUpDataNotifierProvider);
                    print('TopUp data fetched: ${topUp.virtualAccountName}');
                    print('TopUp data fetched: ${topUp.virtualAccountEmail}');
                    print('TopUp data fetched: ${topUp.virtualAccountPhone}');
                  },
                  onError: () => debugPrint('Error fetching user'),
                );
            ref.read(locationProvider.future).then(
                  (location) => debugPrint('Location fetched: $location'),
                );
          },
        );
      }
    });

    return Scaffold(
      appBar: CustomAppBar(
        showBackButton: false,
        backgroundColor: Colors.white,
        customTitleWidget: Row(
          children: [
            user.value?.profilePicture != null
                ? CircleAvatar(
                    backgroundImage: NetworkImage(
                      user.value!.profilePicture!,
                    ),
                    backgroundColor: Colors.grey.shade200,
                    radius: 22,
                  )
                : CircleAvatar(
                    backgroundColor: Colors.grey.shade200,
                    radius: 22,
                  ),
            const Gap(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi there, ${user.value?.username ?? "...."}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColor.primaryBlack,
                          fontWeight: FontWeight.w600,
                        ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: AppColor.primaryColor,
                        size: 16,
                      ),
                      Gap(4),
                      Expanded(
                        child: location.when(
                          data: (location) => Text(
                            location,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: AppColor.textGray,
                                  fontSize: 12,
                                ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          loading: () => const Text(
                            'Loading location...',
                            style: TextStyle(
                              color: AppColor.textGray,
                              fontSize: 12,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          error: (e, _) => Text(
                            'Unknown location',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: AppColor.textGray,
                                  fontSize: 12,
                                ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconCircle(
            imagePath: Assets.icons.search.path,
          ),
          SizedBox(width: 8),
          IconCircle(
            imagePath: Assets.icons.notification.path,
            onTap: () {
              context.pushNamed(RouteName.notification);
            },
          ),
          SizedBox(width: 16),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: EdgeInsets.only(
                top: 16,
                left: context.deviceWidth * 0.05,
                right: context.deviceWidth * 0.05,
                bottom: 100, // 👉 untuk floating navbar
              ),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  const CarouselWidget(),
                  Gap(20),
                  Button.outlined(
                    onPressed: () {
                      context.pushNamed(
                        RouteName.qrcode,
                      );
                    },
                    color: AppColor.primaryColor,
                    textColor: Colors.black,
                    label: 'QR Code',
                  ),
                  Gap(20),
                  Button.outlined(
                    onPressed: () {
                      context.pushNamed(
                        RouteName.qrtab,
                      );
                    },
                    color: AppColor.primaryColor,
                    textColor: Colors.black,
                    label: 'Scan QR Code',
                  ),
                  const Gap(40),
                  Text(
                    "What's up on Blaze?",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColor.textGray,
                        ),
                  ),
                  const Gap(10),
                  ...buildTransactionList(),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

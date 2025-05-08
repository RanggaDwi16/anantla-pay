import 'package:anantla_pay/src/core/provider/location_provider.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/presentation/account/controllers/top_up/top_up_data_provider.dart';
import 'package:anantla_pay/src/presentation/home/controllers/get_user/fetch_user_provider.dart';
import 'package:anantla_pay/src/presentation/home/widgets/home_summary_section.dart';
import 'package:anantla_pay/src/presentation/home/widgets/icon_circle_widget.dart';
import 'package:anantla_pay/src/presentation/home/widgets/section/balance_summary_section.dart';
import 'package:anantla_pay/src/presentation/home/widgets/section/multi_currency_wallet_section.dart';
import 'package:anantla_pay/src/presentation/home/widgets/section/quick_transfer_section.dart';
import 'package:anantla_pay/src/presentation/main/controllers/user_id_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends StatefulHookConsumerWidget {
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

  //useeffect fetchuserid

  @override
  Widget build(BuildContext context) {
    final userIdAsync = ref.watch(userIdProvider);
    // final location = ref.watch(locationProvider);
    final user = ref.watch(fetchUserProvider);
    useEffect(() {
      final userIdAsync = ref.watch(userIdProvider);
      userIdAsync.whenData((userId) {
        if (!_hasFetchedUser && userId != null) {
          _hasFetchedUser = true; // Supaya tidak fetch berkali-kali
          Future.microtask(
            () {
              ref.read(fetchUserProvider.notifier).fetchUser(
                    userId: userId,
                    onSuccess: (data) =>
                        debugPrint('User data fetched successfully'),
                    onError: () => debugPrint('Error fetching user'),
                  );
            },
          );
        }
      });
      return null;
    }, []);

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
            // ref.read(locationProvider.future).then(
            //       (location) => debugPrint('Location fetched: $location'),
            //     );
          },
        );
      }
    });

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
                          fontSize: 16,
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
              // context.pushNamed(RouteName.notification);
              context.pushNamed(RouteName.comingSoon);
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
                bottom: 32,
              ),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  BalanceSummarySection(),
                  const Gap(32),
                  MultiCurrencyWalletSection(),
                  // const Gap(32),
                  // QuickTransferSection(
                  //   users: [
                  //     {'name': 'John Doe', 'currency': 'USD'},
                  //     {'name': 'Rajesh Kumar', 'currency': 'INR'},
                  //     {'name': 'Budi Santoso', 'currency': 'IDR'},
                  //     {'name': 'Jane Smith', 'currency': 'USD'},
                  //     {'name': 'Ananya Sharma', 'currency': 'INR'},
                  //   ],
                  // ),
                ]),
              ),
            ),
            SliverToBoxAdapter(
              child: HomeSummarySection(
                transactions: [
                  {
                    'name': 'Top Up Dana',
                    'date': '2024-04-06T15:05:00',
                    'amount': '170000',
                    'currency': 'INR',
                    'converted': '54.55 USD',
                    'icon': Assets.icons.addmoney.path,
                    'statusLabel': 'Added',
                    'statusColor': '#808080',
                  },
                  {
                    'name': 'Alya Nirmala',
                    'date': '2024-04-06T15:05:00',
                    'amount': '160000',
                    'currency': 'INR',
                    'converted': '54.55 USD',
                    'icon': Assets.icons.send.path,
                    'statusLabel': 'Sent',
                    'statusColor': '#808080',
                  },
                  {
                    'name': 'Tari Safira',
                    'date': '2024-04-06T15:05:00',
                    'amount': '100000',
                    'currency': 'INR',
                    'converted': '54.55 USD',
                    'icon': Assets.icons.send.path,
                    'statusLabel': 'Declined',
                    'statusColor': '#808080',
                  },
                  // ...
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:anantla_pay/src/presentation/home/controllers/get_user/fetch_user_provider.dart';
import 'package:anantla_pay/src/presentation/home/widgets/carousel_widget.dart';
import 'package:anantla_pay/src/presentation/home/widgets/transaction_item_widget.dart';
import 'package:anantla_pay/src/presentation/main/controllers/user_id_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/constant/path.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
            onSuccess: () => debugPrint('Refreshed user data'),
            onError: () => debugPrint('Error refreshing user'),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final userIdAsync = ref.watch(userIdProvider);
    final user = ref.watch(fetchUserProvider);

    userIdAsync.whenData((userId) {
      if (!_hasFetchedUser && userId != null && user.value == null) {
        _hasFetchedUser = true; // Supaya tidak fetch berkali-kali
        Future.microtask(() {
          ref.read(fetchUserProvider.notifier).fetchUser(
                userId: userId,
                onSuccess: () => debugPrint('Fetched after login'),
                onError: () => debugPrint('Error fetching user'),
              );
        });
      }
    });

    return Scaffold(
      appBar: CustomAppBar(
        showBackButton: false,
        title: user.value?.username != null
            ? 'Hello, ${user.value?.username}'
            : 'Hello',
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              width: 50,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(ImagePath.avatar1, fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.deviceWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const CarouselWidget(),
              const Gap(40),
              Text(
                "What's up on Blaze?",
                style: TextStyle(color: AppColor.textGray, fontSize: 14),
              ),
              const Gap(10),
              Expanded(
                child: SingleChildScrollView(child: buildTransactionList()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:anantla_pay/src/presentation/qr/controllers/qr_dynamic_cpm/fetch_qr_dynamic_cpm_provider.dart';
import 'package:anantla_pay/src/presentation/qr/controllers/qr_static_cpm/fetch_qr_static_cpm_provider.dart';
import 'package:anantla_pay/src/presentation/recipient/pages/recipient_page.dart';
import 'package:anantla_pay/src/presentation/transfer_main/pages/transfer_main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/presentation/account/pages/account_page.dart';
import 'package:anantla_pay/src/presentation/wallet/pages/wallet_page.dart';
import 'package:anantla_pay/src/presentation/home/pages/home_page.dart';
import 'package:anantla_pay/src/presentation/main/controllers/selected_index_provider.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int selectedIndex = ref.watch(selectedIndexProvider);
    final List<Widget> pages = [
      const HomePage(),
      const WalletPage(),
      const AccountPage(),
      const TransferMainPage(),
      const RecipientPage() // Transfer (can be replaced)
    ];

    void onTap(int index) {
      ref.read(selectedIndexProvider.notifier).state = index;
    }

    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          // Bottom NavBar
          SizedBox(
            height: context.deviceHeight * 0.1,
            child: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: onTap,
                type: BottomNavigationBarType.fixed,
                backgroundColor: AppColor.primaryWhite,
                selectedItemColor: AppColor.primaryColor,
                unselectedItemColor: Colors.grey,
                selectedLabelStyle:
                    Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold, // OK ✅
                          // ❌ JANGAN tambahkan .copyWith(color: ...)
                        ),
                unselectedLabelStyle:
                    Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                items: [
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      Assets.icons.navbar.home.path,
                      width: 24,
                      height: 24,
                      color: selectedIndex == 0
                          ? AppColor.primaryColor
                          : AppColor.textGray,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      Assets.icons.navbar.card.path,
                      width: 24,
                      height: 24,
                      color: selectedIndex == 1
                          ? AppColor.primaryColor
                          : AppColor.textGray,
                    ),
                    label: 'Wallet',
                  ),
                  const BottomNavigationBarItem(
                    icon: SizedBox(width: 24, height: 20), // placeholder
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      Assets.icons.navbar.transfer.path,
                      width: 24,
                      height: 24,
                      color: selectedIndex == 3
                          ? AppColor.primaryColor
                          : AppColor.textGray,
                    ),
                    label: 'Transfer',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      Assets.icons.navbar.walletAdd.path,
                      width: 24,
                      height: 24,
                      color: selectedIndex == 4
                          ? AppColor.primaryColor
                          : AppColor.textGray,
                    ),
                    label: 'Recipient',
                  ),
                ],
              ),
            ),
          ),

          // Floating QR Button
          Positioned(
            top: -20, // mengangkat ke atas
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  // ref
                  //     .read(fetchQrDynamicCpmProvider.notifier)
                  //     .fetchQrDynamicCpm(
                  //       amount: 75000,
                  //       note: 'note',
                  //       onSuccess: () {},
                  //       onError: () {},
                  //     );
                  context.pushNamed(RouteName.qrisScanner);
                },
                child: Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Image.asset(
                      Assets.icons.scan.path,
                      width: 28,
                      height: 28,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

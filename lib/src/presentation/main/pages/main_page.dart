import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:anantla_pay/src/presentation/account/pages/account_page.dart';
import 'package:anantla_pay/src/presentation/card/pages/card_page.dart';
import 'package:anantla_pay/src/presentation/home/pages/home_page.dart';
import 'package:anantla_pay/src/presentation/main/controllers/selected_index_provider.dart';
import 'package:anantla_pay/src/presentation/main/widgets/nav_item_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);

    final List<Widget> selectedPage = <Widget>[
      const HomePage(),
      CardPage(),
      CardPage(),
      const AccountPage(),
    ];

    void onItemTapped(int index) {
      ref.read(selectedIndexProvider.notifier).state = index;
    }

    return Scaffold(
      extendBody: true,
      body: selectedPage[selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              color: AppColor.primaryWhite,
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavItem(
                  icon: Assets.icons.navbar.home.path,
                  label: 'Home',
                  isActive: selectedIndex == 0,
                  onTap: () => onItemTapped(0),
                ),
                NavItem(
                  icon: Assets.icons.navbar.card.path,
                  label: 'Card',
                  isActive: selectedIndex == 1,
                  onTap: () => onItemTapped(1),
                ),
                NavItem(
                  icon: Assets.icons.navbar.transfer.path,
                  label: 'Transfer',
                  isActive: selectedIndex == 2,
                  onTap: () => onItemTapped(2),
                ),
                NavItem(
                  icon: Assets.icons.navbar.person.path,
                  label: 'Account',
                  isActive: selectedIndex == 3,
                  onTap: () => onItemTapped(3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

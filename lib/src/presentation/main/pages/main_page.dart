import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:anantla_pay/src/presentation/account/pages/account_page.dart';
import 'package:anantla_pay/src/presentation/home/pages/home_page.dart';
import 'package:anantla_pay/src/presentation/main/controllers/selected_index_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class MainPage extends ConsumerWidget {
  // final int userId;
  const MainPage({
    super.key,
    // required this.userId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);

    final List<Widget> selectedPage = <Widget>[
      HomePage(),
      // PayPage(),
      // CardPage(),
      AccountPage(),
    ];

    void onItemTapped(int index) {
      ref.read(selectedIndexProvider.notifier).update((state) => index);
    }

    return Scaffold(
      body: selectedPage[selectedIndex],
      bottomNavigationBar: SizedBox(
        height: context.deviceHeight * 0.1,
        child: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: onItemTapped,
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColor.primaryWhite,
            //  selectedIndex == 1
            //     ? AppColor.primaryColor
            //     : AppColor.primaryWhite,
            selectedItemColor: AppColor.primaryBlack,
            unselectedItemColor: Colors.grey.shade700,
            selectedLabelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined, size: 24),
                label: 'Home',
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.payments_outlined, size: 24),
              //   label: 'Transfer',
              // ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.credit_card, size: 24),
              //   label: 'Card',
              // ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu, size: 24),
                label: 'Account',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

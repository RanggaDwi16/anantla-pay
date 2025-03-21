import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:anantla_pay/src/presentation/account/pages/account_page.dart';
import 'package:anantla_pay/src/presentation/card/pages/card_page.dart';
import 'package:anantla_pay/src/presentation/home/pages/home_page.dart';
import 'package:anantla_pay/src/presentation/main/controllers/selected_index_provider.dart';
import 'package:anantla_pay/src/presentation/pay/pages/pay_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int selectedIndex = ref.watch(selectedIndexProvider);
    final List<Widget> selectedPage = <Widget>[
      HomePage(),
      PayPage(),
      CardPage(),
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
            backgroundColor: selectedIndex == 1
                ? AppColor.primaryColor
                : AppColor.primaryWhite,
            selectedItemColor:
                AppColor.primaryBlack, // Warna hitam untuk yang dipilih
            unselectedItemColor:
                Colors.grey.shade700, // Abu-abu tua untuk yang tidak dipilih
            selectedLabelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  size: 24,
                  color: selectedIndex == 0
                      ? AppColor.primaryBlack
                      : Colors.grey.shade700,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.payments_outlined,
                  size: 24,
                  color: selectedIndex == 1
                      ? AppColor.primaryBlack
                      : Colors.grey.shade700,
                ),
                label: 'Pay',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.credit_card,
                  size: 24,
                  color: selectedIndex == 2
                      ? AppColor.primaryBlack
                      : Colors.grey.shade700,
                ),
                label: 'Card',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.menu,
                  size: 24,
                  color: selectedIndex == 3
                      ? AppColor.primaryBlack
                      : Colors.grey.shade700,
                ),
                label: 'Account',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

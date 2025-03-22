import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:anantla_pay/src/presentation/pay/controllers/amunt_provider.dart';
import 'package:anantla_pay/src/presentation/pay/controllers/select_currency_provider.dart';
import 'package:anantla_pay/src/presentation/pay/data/currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class PayPage extends ConsumerWidget {
  const PayPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCurrency = ref.watch(selectedCurrencyProvider);
    final symbol = currencySymbols[selectedCurrency] ?? '';
    final amount = ref.watch(amountProvider);

    void onNumberPress(String number) {
      final current = ref.read(amountProvider.notifier).state;
      String updated = "";

      if (number == "<") {
        updated =
            current.length > 1 ? current.substring(0, current.length - 1) : "0";
      } else if (current == "0") {
        updated = number;
      } else {
        updated = current + number;
      }

      // ✅ Validasi maksimal 10 juta (10000000)
      final value = int.tryParse(updated.replaceAll(RegExp(r'\D'), '')) ?? 0;
      if (value > 10000000) {
        context.showCustomSnackBar("The maximum amount is Rp10,000,000",
            isError: true);
        return;
      }

      ref.read(amountProvider.notifier).state = updated;
    }

    final formattedAmount =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0)
            .format(int.tryParse(amount) ?? 0);

    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: CustomAppBar(
        title: 'Payments',
        backgroundColor: AppColor.primaryColor,
      ),
      body: Column(
        children: [
          const Spacer(),

          /// **Bagian untuk menampilkan angka (DIBUAT RESPONSIF)**
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 60, // **Atur tinggi agar tidak terlalu besar**
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    formattedAmount,
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis, // **Hindari Overflow**
                    maxLines: 1,
                  ),
                ),
              ),
            ),
          ),

          const Gap(10),

          /// **Tombol Pilih Mata Uang**
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                builder: (context) {
                  return FractionallySizedBox(
                    heightFactor: 0.5,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Container(
                          width: 80,
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text("Select currency",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        Expanded(
                          child: ListView.builder(
                            itemCount: currencies.length,
                            itemBuilder: (context, index) {
                              final currency = currencies[index];
                              final isSelected =
                                  selectedCurrency == currency['code'];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 5),
                                child: GestureDetector(
                                  onTap: () {
                                    ref
                                        .read(selectedCurrencyProvider.notifier)
                                        .state = currency['code'];
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? AppColor.primaryColor
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 12),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: currency['color'],
                                          child: Icon(currency['icon'],
                                              color: Colors.white),
                                        ),
                                        const SizedBox(width: 12),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(currency['code'],
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(currency['name'],
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey)),
                                          ],
                                        ),
                                        const Spacer(),
                                        if (isSelected)
                                          const Icon(Icons.check,
                                              color: Colors.black),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColor.secondaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(selectedCurrency,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  const Icon(Icons.arrow_drop_down, color: Colors.black),
                ],
              ),
            ),
          ),

          const Spacer(),

          /// **Grid Numpad**
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Align(
              alignment: Alignment.center,
              child: GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                children: [
                  ...[
                    "1",
                    "2",
                    "3",
                    "4",
                    "5",
                    "6",
                    "7",
                    "8",
                    "9",
                    " ",
                    "0",
                    "<"
                  ].map((num) => _buildNumpadButton(num, onNumberPress)),
                ],
              ),
            ),
          ),

          const Spacer(),

          /// **Tombol Pay**
          Align(
            alignment: Alignment.centerLeft,
            child: Button.filled(
              onPressed: () {
                context.pushNamed(RouteName.review);
              },
              label: 'Pay',
              isPay: true,
              width: 250,
              height: 50,
              color: AppColor.primaryBlack,
            ),
          ),

          const Gap(20),
        ],
      ),
    );
  }

  Widget _buildNumpadButton(String number, void Function(String) onPress) {
    return GestureDetector(
      onTap: () => onPress(number),
      child: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Text(
          number,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

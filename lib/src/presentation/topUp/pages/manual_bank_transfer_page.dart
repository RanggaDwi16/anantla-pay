import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ManualBankTransferPage extends StatefulWidget {
  const ManualBankTransferPage({super.key});

  @override
  State<ManualBankTransferPage> createState() => _ManualBankTransferPageState();
}

class _ManualBankTransferPageState extends State<ManualBankTransferPage> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> bankAccounts = [
    {
      'bank': 'Permata',
      'lastDigits': '3340',
      'fee': 'Admin fee Rp1.000',
      'selectable': true,
    },
    {
      'bank': 'BCA',
      'lastDigits': '7007',
      'fee': "Credit cards can't be used for top-up",
      'selectable': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Select Bank Account',
        centertitle: true,
        showBackButton: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: bankAccounts.length,
        separatorBuilder: (_, __) => const Gap(12),
        itemBuilder: (context, index) {
          final bank = bankAccounts[index];
          final isSelected = selectedIndex == index;

          return InkWell(
            onTap: bank['selectable']
                ? () {
                    setState(() {
                      selectedIndex = index;
                    });
                  }
                : null,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              decoration: BoxDecoration(
                color: bank['selectable']
                    ? Colors.grey.shade100
                    : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color:
                      isSelected ? AppColor.primaryColor : Colors.transparent,
                  width: 2,
                ),
              ),
              child: Row(
                children: [
                  Radio<int>(
                    value: index,
                    groupValue: selectedIndex,
                    onChanged: bank['selectable']
                        ? (val) {
                            setState(() {
                              selectedIndex = val!;
                            });
                          }
                        : null,
                    activeColor: AppColor.primaryColor,
                  ),
                  const Gap(8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${bank['bank']} **** ${bank['lastDigits']}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        const Gap(4),
                        Text(
                          bank['fee'],
                          style: TextStyle(
                            fontSize: 13,
                            color: bank['selectable']
                                ? Colors.black54
                                : Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.chevron_right,
                      color: bank['selectable']
                          ? Colors.grey.shade600
                          : Colors.grey.shade400),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/presentation/account/controllers/get_all_bank/fetch_all_bank.dart';
import 'package:anantla_pay/src/presentation/account/controllers/top_up/top_up_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PayloadPage extends ConsumerWidget {
  const PayloadPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allBank = ref.watch(fetchAllBankProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Choose Bank',
        centertitle: true,
        showBackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: allBank.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text("Error: $error")),
          data: (banks) {
            if (banks!.isEmpty) {
              return const Center(child: Text("No banks available"));
            }
            return ListView.builder(
              itemCount: banks.length,
              itemBuilder: (context, index) {
                final bank = banks[index];

                return GestureDetector(
                  onTap: () {
                    ref
                        .read(topUpDataNotifierProvider.notifier)
                        .setVirtualAccountData(bankCode: bank.bankCode);
                    print('Bank Code: ${bank.bankCode}');
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(
                    //     content: Text("Selected: ${bank.bankCode}"),
                    //     duration: const Duration(seconds: 1),
                    //   ),
                    // );
                    context.pushNamed(RouteName.pay);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 2,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.account_balance_rounded,
                            color: AppColor.primaryBlack, size: 30),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            bank.bankName ?? 'Unknown Bank',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const Icon(Icons.chevron_right, color: Colors.grey),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

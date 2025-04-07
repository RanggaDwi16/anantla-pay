import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:anantla_pay/src/presentation/account/controllers/get_balance/fetch_balance_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/get_transaction/fetch_transaction_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/top_up/patch_top_up_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/top_up/top_up_data_provider.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/top_up_params.dart';
import 'package:anantla_pay/src/presentation/home/controllers/get_user/fetch_user_provider.dart';
import 'package:anantla_pay/src/presentation/main/controllers/selected_index_provider.dart';
import 'package:anantla_pay/src/presentation/pay/controllers/amunt_provider.dart';
import 'package:anantla_pay/src/presentation/pay/controllers/select_currency_provider.dart';
import 'package:anantla_pay/src/presentation/pay/data/currency.dart';
import 'package:anantla_pay/src/presentation/transfer/controllers/transfer_data_provider.dart';
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
    final amount = ref.watch(amountProvider);

    /// **Detect whether it's a Top-Up or Transfer**
    final topUpData = ref.watch(topUpDataNotifierProvider);
    final isVirtualAccount = topUpData.topUpType == TopUpType.virtualAccount;
    final transferData = ref.watch(transferDataNotifierProvider);

    final isTopUp = topUpData.walletId != null;
    final isTransfer = transferData.fromWalletId != null;

    final user = ref.watch(fetchUserProvider).value;

    final topUpNotifier = ref.read(topUpDataNotifierProvider.notifier);

    if (user != null && topUpData.virtualAccountName == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        topUpNotifier.setVirtualAccountData(
          virtualAccountName: user.username,
          virtualAccountEmail: user.email,
          virtualAccountPhone: user.phone,
        );
      });
    }

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

    return WillPopScope(
      onWillPop: () async {
        ref.read(amountProvider.notifier).state = "0";
        return true;
      },
      child: Scaffold(
        backgroundColor: isTopUp
            ? (isVirtualAccount ? AppColor.primaryColor : AppColor.errorRed)
            : AppColor.primaryColor,
        appBar: CustomAppBar(
          title: isTopUp
              ? (isVirtualAccount ? 'Top Up VA' : 'Simulate Top Up')
              : 'Transfer',
          showBackButton: false,
          backgroundColor: isTopUp
              ? (isVirtualAccount ? AppColor.primaryColor : AppColor.errorRed)
              : AppColor.primaryColor,
        ),
        body: Column(
          children: [
            const Spacer(),

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
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16)),
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
                                          .read(
                                              selectedCurrencyProvider.notifier)
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: isTopUp
                      ? (isVirtualAccount
                          ? AppColor.primaryColor
                          : AppColor.errorRed)
                      : AppColor.primaryColor,
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
                  final selectedCurrency = ref.read(selectedCurrencyProvider);
                  final amount = ref.read(amountProvider);

                  if (amount.isEmpty ||
                      int.tryParse(amount) == null ||
                      int.parse(amount) == 0) {
                    context.showCustomSnackBar("Enter a valid amount!",
                        isError: true);
                    return;
                  }

                  print('isTopUp: $isTopUp');
                  print('isTransfer: $isTransfer');

                  final walletId = topUpData.walletId;

                  if (isTopUp) {
                    if (isVirtualAccount) {
                      print('Virtual Account Top Up');
                      ref
                          .read(topUpDataNotifierProvider.notifier)
                          .setVirtualAccountData(
                            currency: selectedCurrency,
                            totalAmount: int.parse(amount),
                          );
                      final user = ref.read(fetchUserProvider).value;
                      // print('User: $user');
                      // print('User name: ${user?.username}');
                      // print('User email: ${user?.email}');
                      // print('User phone: ${user?.phone}');
                      ref
                          .read(topUpDataNotifierProvider.notifier)
                          .setVirtualAccountData(
                            virtualAccountName: user?.username,
                            virtualAccountEmail: user?.email,
                            virtualAccountPhone: user?.phone,
                          );
                      print('Selected Currency: $selectedCurrency');
                      print('Total Amount: ${int.parse(amount)}');
                      print(
                          'Bank Code: ${topUpData.bankCode}'); // Debugging print
                      print('Wallet ID: $walletId'); // Debugging print
                      print('name: ${topUpData.virtualAccountName}');
                      print('email: ${topUpData.virtualAccountEmail}');
                      print('phone: ${topUpData.virtualAccountPhone}');
                      ref.read(patchTopUpProvider.notifier).topUpVirtualAccount(
                          params: VirtualAccountParams(
                            walletId: walletId ?? 0,
                            totalAmount: TotalAmount(
                              value: amount,
                              currency: selectedCurrency,
                            ),
                            bankCode: topUpData.bankCode,
                            virtualAccountName: topUpData.virtualAccountName,
                            virtualAccountEmail: topUpData.virtualAccountEmail,
                            virtualAccountPhone: topUpData.virtualAccountPhone,
                          ),
                          onError: (message) {
                            context.customErrorDialog(message);
                          },
                          onSuccess: (trxId) {
                            print('trxId: $trxId');
                            print('bankCode: ${topUpData.bankCode}');
                            ref
                                .read(patchTopUpProvider.notifier)
                                .verifyOtpVirtualAccount(
                                    params: VirtualAccountParams(
                                      trxId: trxId,
                                      bankCode: topUpData.bankCode,
                                    ),
                                    onError: (message) {
                                      context.customErrorDialog(message);
                                    },
                                    onSuccess: (message) {
                                      context.showSuccessDialog(
                                          title: "Success",
                                          message:
                                              'Top Up Virtual Account Success',
                                          onConfirm: () {
                                            ref.invalidate(
                                                fetchBalanceProvider);
                                            ref.invalidate(
                                                fetchTransactionProvider);
                                            context.goNamed(RouteName.main);
                                            ref
                                                .read(amountProvider.notifier)
                                                .state = "0";
                                            ref
                                                .read(topUpDataNotifierProvider
                                                    .notifier)
                                                .reset();
                                            ref
                                                .read(selectedIndexProvider
                                                    .notifier)
                                                .state = 1;
                                          });
                                    });
                          });
                    } else {
                      ref.read(patchTopUpProvider.notifier).patchTouUp(
                            topupParams: TopupParams(
                              walletId: topUpData.walletId!,
                              amount: int.parse(amount),
                              currency: selectedCurrency,
                            ),
                            onError: (message) {
                              context.customErrorDialog(message);
                            },
                            onSuccess: (message) {
                              _showOtpDialog(context, ref, walletId ?? 0);
                            },
                          );
                    }
                    // ref
                    //     .read(topUpDataNotifierProvider.notifier)
                    //     .setCurrency(selectedCurrency);
                    // ref
                    //     .read(topUpDataNotifierProvider.notifier)
                    //     .setAmount(int.parse(amount));

                    // context.pushNamed(RouteName.review);
                  } else if (isTransfer) {
                    ref
                        .read(transferDataNotifierProvider.notifier)
                        .setAmount(int.parse(amount));

                    context.pushNamed(RouteName.review);
                  }
                },
                label: isTopUp
                    ? (isVirtualAccount ? 'Pay via VA' : 'Simulate Top Up')
                    : 'Transfer',
                isPay: true,
                width: 250,
                height: 50,
                color: AppColor.primaryBlack,
              ),
            ),

            const Gap(20),
          ],
        ),
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

  void _showOtpDialog(BuildContext context, WidgetRef ref, int walletId) {
    final otpController = TextEditingController();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        // ✅ Store the dialog context
        return AlertDialog(
          title: const Text("Enter OTP"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: otpController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "OTP Code",
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (dialogContext.mounted) Navigator.pop(dialogContext);
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                final enteredOtp = otpController.text.trim();
                if (enteredOtp.isNotEmpty) {
                  ref.read(patchTopUpProvider.notifier).verifOtpTopUp(
                      params: VerifyOtpTopupParams(
                        walletId: walletId,
                        otpCode: enteredOtp,
                      ),
                      onError: (message) {
                        context.customErrorDialog(message);
                      },
                      onSuccess: (message) {
                        ref.invalidate(fetchBalanceProvider);
                        ref.invalidate(fetchTransactionProvider);
                        context.showSuccessDialog(
                            title: "Success",
                            message: "Top Up Success",
                            onConfirm: () {
                              context.goNamed(RouteName.main);
                              ref.read(amountProvider.notifier).state = "0";
                              ref
                                  .read(topUpDataNotifierProvider.notifier)
                                  .reset();
                              ref.read(selectedIndexProvider.notifier).state =
                                  1;
                            });
                      });
                } else {
                  context.showCustomSnackBar("Please enter the OTP!",
                      isError: true);
                }
              },
              child: const Text("Verify"),
            ),
          ],
        );
      },
    );
  }
}

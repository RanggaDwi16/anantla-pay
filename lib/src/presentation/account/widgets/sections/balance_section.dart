import 'package:anantla_pay/src/core/helpers/formatters/string_format.dart';
import 'package:anantla_pay/src/core/provider/dio_provider.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/presentation/account/controllers/activate_wallet/post_activate_wallet_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/create_wallet/post_wallet_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/e-kyc/post_ekyc_verification_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/get_all_country/fetch_all_country_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/get_balance/fetch_balance_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/get_transaction/fetch_transaction_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/top_up/top_up_data_provider.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/create_wallet_params.dart';
import 'package:anantla_pay/src/presentation/home/controllers/get_user/fetch_user_provider.dart';
import 'package:anantla_pay/src/presentation/main/controllers/user_id_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/controllers/transfer_data_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class BalanceSection extends ConsumerWidget {
  const BalanceSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balanceList = ref.watch(fetchBalanceProvider); // as List<Balance>

    return balanceList.when(
      loading: () => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          height: 170,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      error: (error, stack) => const Text('Error loading balances'),
      data: (list) {
        if (list == null || list.isEmpty) {
          return const Text("No wallet available");
        }

        return SizedBox(
          height: context.deviceHeight * 0.5,
          child: PageView.builder(
            controller: PageController(
              viewportFraction:
                  1, // agar ada padding kecil kanan kiri, tapi tidak terlihat item lain
            ),
            itemCount: list.length,
            itemBuilder: (context, index) {
              final wallet = list[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: _buildBalanceCard(
                  context,
                  wallet.balance.toString(),
                  wallet.currency ?? 'IDR',
                  wallet.walletId ?? 0,
                  ref,
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildBalanceCard(BuildContext context, String balance,
      String currency, int walletId, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'Virtual Account',
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Gap(10),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.account_balance_wallet_rounded,
                      color: Colors.white, size: 32),
                  const Gap(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Total Balance",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '$currency ${formatRupiah(balance)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Gap(20),
              Row(
                children: [
                  Expanded(
                    child: _actionButton(
                      context,
                      label: "Top Up",
                      onPressed: () {

                        ref
                            .read(topUpDataNotifierProvider.notifier)
                            .setWalletId(walletId);

                        context.pushNamed(RouteName.topUp);
                      },
                    ),
                  ),
                  // const SizedBox(width: 8),
                  // Expanded(
                  //   child: _actionButton(
                  //     context,
                  //     label: "Withdraw",
                  //     onPressed: () => context.pushNamed(
                  //       RouteName.withdraw,
                  //       extra: walletId,
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _actionButton(context, label: "Transfer",
                        onPressed: () {
                      ref
                          .read(transferDataNotifierProvider.notifier)
                          .setFromWalletId(walletId);
                      ref
                          .read(transferDataNotifierProvider.notifier)
                          .setCurrencies(fromCurrency: currency);
                      context.pushNamed(RouteName.transfer);
                    }),
                  ),
                ],
              ),
            ],
          ),
        ),
        Gap(20),
        Button.filled(
          onPressed: () {
            ref.read(topUpDataNotifierProvider.notifier).setWalletId(walletId);
            ref
                .read(topUpDataNotifierProvider.notifier)
                .setTopUpType(TopUpType.normal);
            context.pushNamed(RouteName.pay);
          },
          label: 'Simulate Top Up',
          color: AppColor.primaryBlack,
        ),
        Gap(20),
        Button.filled(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return Consumer(
                  builder: (context, ref, _) {
                    final allCountry = ref.watch(fetchAllCountryProvider);
                    final userId = ref.watch(userIdProvider).value;
                    String? selectedCountryCode;

                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      title: const Text("Create Wallet"),
                      content: allCountry.when(
                        loading: () => const CircularProgressIndicator(),
                        error: (error, _) => Text('Error loading countries'),
                        data: (countries) {
                          return StatefulBuilder(
                            builder: (context, setState) {
                              return SingleChildScrollView(
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      DropdownButtonFormField<String>(
                                        value: selectedCountryCode,
                                        items: countries!
                                            .map(
                                                (c) => DropdownMenuItem<String>(
                                                      value: c.countryCode,
                                                      child: Text(
                                                          c.countryName ??
                                                              c.countryCode ??
                                                              'Unknown'),
                                                    ))
                                            .toList(),
                                        onChanged: (value) {
                                          setState(() =>
                                              selectedCountryCode = value);
                                        },
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'Country Code',
                                        ),
                                      ),
                                    ]),
                              );
                            },
                          );
                        },
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("Cancel"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (selectedCountryCode == null) {
                              context.showCustomSnackBar(
                                  "Please select a country",
                                  isError: true);
                              return;
                            }

                            if (userId != null) {
                              ref.read(postWalletProvider.notifier).postWallet(
                                    params: CreateWalletParams(
                                        userId: userId,
                                        countryCode: selectedCountryCode!),
                                    onSuccess: (message) {
                                      ref.invalidate(fetchBalanceProvider);
                                      ref.invalidate(fetchTransactionProvider);
                                      context.showSuccessDialog(
                                        title: 'Success',
                                        message: 'Successfully created wallet',
                                        onConfirm: () {
                                          ref
                                              .read(postActivateWalletProvider
                                                  .notifier)
                                              .postActivateWallet(
                                                params: ActivateWalletParams(
                                                  walletId: message,
                                                  countryCode:
                                                      selectedCountryCode!,
                                                ),
                                                onSuccess: (message) {
                                                  context.showSuccessDialog(
                                                    title: 'Success',
                                                    message:
                                                        'Successfully activated wallet',
                                                    onConfirm: () {
                                                      ref.invalidate(
                                                          fetchBalanceProvider);
                                                      ref.invalidate(
                                                          fetchTransactionProvider);
                                                      context.pop();
                                                    },
                                                  );
                                                },
                                                onError: (message) {
                                                  context.showCustomSnackBar(
                                                      message,
                                                      isError: true);
                                                },
                                              );
                                        },
                                      );
                                    },
                                    onError: (message) {
                                      context.showCustomSnackBar(message,
                                          isError: true);
                                    },
                                  );
                            } else {
                              context.showCustomSnackBar("User ID not found",
                                  isError: true);
                            }
                          },
                          child: const Text("Create Wallet"),
                        ),
                      ],
                    );
                  },
                );
              },
            );
          },
          label: 'Add Wallet',
          color: AppColor.primaryBlack,
        ),
        Gap(20),
        Button.filled(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return Consumer(
                  builder: (context, ref, _) {
                    final allCountry = ref.watch(fetchAllCountryProvider);
                    final userId = ref.watch(userIdProvider).value;
                    // Tambahan controller
                    final fullnameController = TextEditingController();
                    final birthdateController = TextEditingController();
                    final idNumberController = TextEditingController();
                    DateTime? selectedBirthdate;

                    String? selectedCountryCode;

                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      title: const Text("E-KyC Verification"),
                      content: allCountry.when(
                        loading: () => const CircularProgressIndicator(),
                        error: (error, _) => Text('Error loading countries'),
                        data: (countries) {
                          return StatefulBuilder(
                            builder: (context, setState) {
                              return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextFormField(
                                      controller: fullnameController,
                                      decoration: const InputDecoration(
                                        labelText: 'Full Name',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    TextFormField(
                                      controller: birthdateController,
                                      readOnly: true,
                                      decoration: const InputDecoration(
                                        labelText: 'Birthdate',
                                        border: OutlineInputBorder(),
                                        suffixIcon: Icon(Icons.calendar_today),
                                      ),
                                      onTap: () async {
                                        final picked = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1900),
                                          lastDate: DateTime.now(),
                                        );
                                        if (picked != null) {
                                          selectedBirthdate = picked;
                                          birthdateController.text = picked
                                              .toIso8601String()
                                              .split('T')
                                              .first;
                                        }
                                      },
                                    ),
                                    const SizedBox(height: 16),
                                    DropdownButtonFormField<String>(
                                      value: selectedCountryCode,
                                      items: countries!
                                          .map((c) => DropdownMenuItem<String>(
                                                value: c.countryCode,
                                                child: Text(c.countryName ??
                                                    c.countryCode ??
                                                    'Unknown'),
                                              ))
                                          .toList(),
                                      onChanged: (value) {
                                        setState(
                                            () => selectedCountryCode = value);
                                      },
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Country Code',
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    TextFormField(
                                      controller: idNumberController,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        labelText: 'ID Number',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ]);
                            },
                          );
                        },
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("Cancel"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (selectedCountryCode == null) {
                              context.showCustomSnackBar(
                                  "Please select a country",
                                  isError: true);
                              return;
                            }

                            if (userId != null) {
                              ref
                                  .read(postEkycVerificationProvider.notifier)
                                  .eKycVerification(
                                      params: EKycParams(
                                        userId: userId,
                                        countryCode: selectedCountryCode!,
                                        kycData: KycData(
                                          fullName:
                                              fullnameController.text.trim(),
                                          birthDate: selectedBirthdate,
                                          idNumber:
                                              idNumberController.text.trim(),
                                        ),
                                      ),
                                      onSuccess: (message) {
                                        context.showSuccessDialog(
                                          title: 'Success',
                                          message:
                                              'Successfully E-KyC Verification',
                                          onConfirm: () {
                                            ref.invalidate(
                                                fetchBalanceProvider);
                                            ref.invalidate(
                                                fetchTransactionProvider);
                                            context.pop();
                                          },
                                        );
                                      },
                                      onError: (message) {
                                        context.showCustomSnackBar(message,
                                            isError: true);
                                      });
                            } else {
                              context.showCustomSnackBar("User ID not found",
                                  isError: true);
                            }
                          },
                          child: const Text("E-KYC Verification"),
                        ),
                      ],
                    );
                  },
                );
              },
            );
          },
          label: 'e-KYC',
          color: AppColor.primaryBlack,
        ),
      ],
    );
  }

  Widget _actionButton(BuildContext context,
      {required String label, required VoidCallback onPressed}) {
    return Button.filled(
      onPressed: onPressed,
      label: label,
      color: Colors.white,
      textColor: AppColor.primaryBlack,
      borderRadius: 10,
      height: 40,
    );
  }
}

import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:anantla_pay/src/presentation/account/controllers/activate_wallet/post_activate_wallet_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/create_wallet/post_wallet_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/e-kyc/post_ekyc_verification_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/get_all_country/fetch_all_country_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/get_balance/fetch_balance_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/get_transaction/fetch_transaction_provider.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/create_wallet_params.dart';
import 'package:anantla_pay/src/presentation/main/controllers/user_id_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';


class WalletEmptyState extends ConsumerWidget {
  const WalletEmptyState({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text(
            "No wallet found. Please create a wallet to continue.",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 12),
        Button.filled(
          onPressed: () => _showCreateWalletDialog(context, ref),
          label: 'Add Wallet',
          color: AppColor.primaryBlack,
        ),
        const Gap(20),
        Button.filled(
          onPressed: () => _showEKycDialog(context, ref),
          label: 'e-KYC',
          color: AppColor.primaryBlack,
        ),
      ],
    );
  }

  void _showCreateWalletDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => Consumer(
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
              data: (countries) => StatefulBuilder(
                builder: (context, setState) {
                  return DropdownButtonFormField<String>(
                    value: selectedCountryCode,
                    items: countries!
                        .map((c) => DropdownMenuItem<String>(
                              value: c.countryCode,
                              child: Text(c.countryName ?? c.countryCode ?? 'Unknown'),
                            ))
                        .toList(),
                    onChanged: (value) => setState(() => selectedCountryCode = value),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Country Code',
                    ),
                  );
                },
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  if (selectedCountryCode == null) {
                    context.showCustomSnackBar("Please select a country", isError: true);
                    return;
                  }

                  if (userId != null) {
                    ref.read(postWalletProvider.notifier).postWallet(
                      params: CreateWalletParams(
                        userId: userId,
                        countryCode: selectedCountryCode!,
                      ),
                      onSuccess: (message) {
                        ref.invalidate(fetchBalanceProvider);
                        ref.invalidate(fetchTransactionProvider);
                        context.showSuccessDialog(
                          title: 'Success',
                          message: 'Successfully created wallet',
                          onConfirm: () {
                            ref.read(postActivateWalletProvider.notifier).postActivateWallet(
                                  params: ActivateWalletParams(
                                    walletId: message,
                                    countryCode: selectedCountryCode!,
                                  ),
                                  onSuccess: (_) {},
                                  onError: (_) {},
                                );
                          },
                        );
                      },
                      onError: (message) {
                        context.showCustomSnackBar(message, isError: true);
                      },
                    );
                  } else {
                    context.showCustomSnackBar("User ID not found", isError: true);
                  }
                },
                child: const Text("Create Wallet"),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showEKycDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => Consumer(
        builder: (context, ref, _) {
          final allCountry = ref.watch(fetchAllCountryProvider);
          final userId = ref.watch(userIdProvider).value;
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
              data: (countries) => StatefulBuilder(
                builder: (context, setState) {
                  return SingleChildScrollView(
                    child: Column(
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
                              birthdateController.text = picked.toIso8601String().split('T').first;
                            }
                          },
                        ),
                        const SizedBox(height: 16),
                        DropdownButtonFormField<String>(
                          value: selectedCountryCode,
                          items: countries!
                              .map((c) => DropdownMenuItem<String>(
                                    value: c.countryCode,
                                    child: Text(c.countryName ?? c.countryCode ?? 'Unknown'),
                                  ))
                              .toList(),
                          onChanged: (value) => setState(() => selectedCountryCode = value),
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
                      ],
                    ),
                  );
                },
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  if (selectedCountryCode == null) {
                    context.showCustomSnackBar("Please select a country", isError: true);
                    return;
                  }

                  if (userId != null) {
                    ref.read(postEkycVerificationProvider.notifier).eKycVerification(
                      params: EKycParams(
                        userId: userId,
                        countryCode: selectedCountryCode!,
                        // kycData: KycData(
                        //   fullName: fullnameController.text.trim(),
                        //   birthDate: selectedBirthdate,
                        //   idNumber: idNumberController.text.trim(),
                        // ),
                      ),
                      onSuccess: (message) {
                        context.showSuccessDialog(
                          title: 'Success',
                          message: 'Successfully E-KyC Verification',
                          onConfirm: () {
                            ref.invalidate(fetchBalanceProvider);
                            ref.invalidate(fetchTransactionProvider);
                            context.pop();
                          },
                        );
                      },
                      onError: (message) {
                        context.showCustomSnackBar(message, isError: true);
                      },
                    );
                  } else {
                    context.showCustomSnackBar("User ID not found", isError: true);
                  }
                },
                child: const Text("E-KYC Verification"),
              ),
            ],
          );
        },
      ),
    );
  }
}

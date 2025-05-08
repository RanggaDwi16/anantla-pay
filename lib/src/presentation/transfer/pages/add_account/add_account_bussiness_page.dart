import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/helpers/widgets/custom_search_field.dart';
import 'package:anantla_pay/src/core/helpers/widgets/custom_text_field.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:anantla_pay/src/presentation/transfer/controllers/get_all_bank/fetch_all_bank_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/entities/bank_model.dart';
import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddAccountBussinessPage extends StatefulHookConsumerWidget {
  const AddAccountBussinessPage({super.key});

  @override
  ConsumerState<AddAccountBussinessPage> createState() =>
      _AddAccountBussinessPageState();
}

class _AddAccountBussinessPageState
    extends ConsumerState<AddAccountBussinessPage> {
  String? selectedBank;
  String? selectedWallet;
  final ValueNotifier<String> selectedSegment = ValueNotifier<String>('bank');

  //dummy ewallet data
  final List<String> dummyWallets = [
    'GoPay',
    'OVO',
    'DANA',
    'LinkAja',
    'ShopeePay',
  ];

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final nameController = useTextEditingController();
    final bankNameController = useTextEditingController();
    final accountNumberController = useTextEditingController();
    final walletProviderController = useTextEditingController();
    final walletNumberController = useTextEditingController();
    final allBanks = ref.watch(fetchAllBankProvider);
    return Scaffold(
      backgroundColor: AppColor.secondaryBackground,
      appBar: CustomAppBar(
        backgroundColor: AppColor.secondaryBackground,
        centertitle: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: GestureDetector(
            onTap: () => context.pop(),
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: AppColor.primaryWhite,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  Assets.icons.arrowLeft.path,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter the organisation's account details",
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColor.primaryBlack,
                      fontSize: 24,
                    ),
              ),
              const Gap(14),
              Text(
                'When sending money to Indonesia, we have to\nask the reason for your transfer.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColor.textGray,
                      fontSize: 14,
                    ),
              ),
              const Gap(20),
              CustomTextField(
                controller: emailController,
                labelText: 'Their email (optional)',
              ),
              const Gap(20),
              Text(
                "Recipient's bank details",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColor.primaryBlack,
                      fontSize: 14,
                    ),
              ),
              Divider(color: AppColor.textSecondaryGray),
              const Gap(8),
              SizedBox(
                width: context.deviceWidth,
                child: AdvancedSegment(
                  controller: selectedSegment,
                  segments: const {
                    'bank': 'Local bank account',
                    'wallet': 'E-Wallet',
                  },
                  activeStyle: const TextStyle(
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                  inactiveStyle: const TextStyle(
                    color: AppColor.textGray,
                    fontWeight: FontWeight.w400,
                  ),
                  backgroundColor: AppColor.secondaryBackground,
                  sliderColor: AppColor.primaryWhite,
                  borderRadius: BorderRadius.circular(100),
                  sliderDecoration: BoxDecoration(
                    color: AppColor.primaryWhite,
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(24),
              ValueListenableBuilder(
                valueListenable: selectedSegment,
                builder: (context, value, _) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        controller: nameController,
                        labelText: 'Name of the business / organisation',
                      ),
                      const Gap(16),
                      if (value == 'bank') ...[
                        Text(
                          'Bank name',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Gap(8),
                        allBanks.when(
                          data: (data) {
                            return GestureDetector(
                              onTap: () {
                                // Open bank list as a BottomSheet
                                _showBankSelectionBottomSheet(allBanks.value!);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 16),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF9F9F9),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: AppColor.textSecondaryGray,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      selectedBank ?? 'Please enter bank name',
                                      style: TextStyle(
                                        color: AppColor.primaryBlack,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Image.asset(
                                      Assets.icons.arrowDown.path,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          error: (error, stack) {
                            return const Center(
                              child: Text('Error fetching bank data'),
                            );
                          },
                          loading: () {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),
                        const Gap(16),
                        CustomTextField(
                          controller: accountNumberController,
                          labelText: 'Account number IDR account only!',
                          keyboardType: TextInputType.number,
                        ),
                      ] else ...[
                        Text(
                          'Wallet Provider',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Gap(8),
                        GestureDetector(
                          onTap: () {
                            // Open bank list as a BottomSheet
                            // controller.value == 'wallet';
                            _showEWalletSelectionBottomSheet(dummyWallets);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 16),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF9F9F9),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: AppColor.textSecondaryGray,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  selectedWallet ?? 'E-Wallet Provider',
                                  style: TextStyle(
                                    color: AppColor.primaryBlack,
                                    fontSize: 16,
                                  ),
                                ),
                                Image.asset(
                                  Assets.icons.arrowDown.path,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Gap(16),
                        CustomTextField(
                          controller: walletNumberController,
                          labelText: "Recipient's E-Wallet number",
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.deviceWidth * 0.05,
          vertical: context.deviceHeight * 0.03,
        ),
        child: Button.filled(
            onPressed: () {
              context.pushNamed(RouteName.comingSoon);
            },
            label: 'Confirm'),
      ),
    );
  }

  void _showBankSelectionBottomSheet(List<BankModel> allBanks) {
    TextEditingController searchController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows control of sheet height
      builder: (context) {
        return Container(
          height: context.deviceHeight * 0.9, // 3/4 screen height
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 5,
                  color: AppColor.primaryBlack,
                ),
              ),
              Gap(20),
              CircleAvatar(
                backgroundColor: AppColor.primaryWhite,
                radius: 20,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context); // Close the bottom sheet
                  },
                ),
              ),
              Gap(20),
              Text(
                'Bank Name',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColor.primaryBlack,
                      fontSize: 24,
                    ),
              ),
              const Gap(16),
              CustomSearchField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {});
                },
              ),
              const Gap(16),
              // Display filtered banks or 'No bank selected' message
              Expanded(
                child: Container(
                  child: Builder(
                    builder: (context) {
                      final filteredBanks = allBanks.where((bank) {
                        return bank.bankName!
                            .toLowerCase()
                            .contains(searchController.text.toLowerCase());
                      }).toList();

                      if (filteredBanks.isEmpty) {
                        return const Center(
                          child: Text('No bank selected'),
                        );
                      }

                      return ListView.builder(
                        itemCount: filteredBanks.length,
                        itemBuilder: (context, index) {
                          final bank = filteredBanks[index];
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 8),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedBank = bank.bankName!;
                                });
                                Navigator.pop(
                                    context); // Close the bottom sheet
                              },
                              child: SizedBox(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      bank.bankName ?? 'Please select e-wallet',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    Radio<String>(
                                      value: bank.bankName!,
                                      groupValue: selectedBank,
                                      onChanged: (String? value) {
                                        setState(() {
                                          selectedBank = value;
                                        });
                                        Navigator.pop(
                                            context); // Close the bottom sheet
                                      },
                                      activeColor: AppColor.primaryColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showEWalletSelectionBottomSheet(List<String> dummyWallets) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows control of sheet height
      builder: (context) {
        return Container(
          height: context.deviceHeight * 0.9, // 3/4 screen height
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 5,
                  color: AppColor.primaryBlack,
                ),
              ),
              Gap(20),
              CircleAvatar(
                backgroundColor: AppColor.primaryWhite,
                radius: 20,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context); // Close the bottom sheet
                  },
                ),
              ),
              Gap(20),
              Text(
                'E-Wallet Provider',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColor.primaryBlack,
                      fontSize: 24,
                    ),
              ),
              const Gap(16),
              // Display filtered banks or 'No bank selected' message
              Expanded(
                child: ListView.builder(
                  itemCount: dummyWallets.length,
                  itemBuilder: (context, index) {
                    final wallet = dummyWallets[index];
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 8),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedWallet = wallet;
                          });
                          Navigator.pop(context); // Close the bottom sheet
                        },
                        child: SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                wallet,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Radio<String>(
                                value: wallet,
                                groupValue: selectedWallet,
                                onChanged: (String? value) {
                                  setState(() {
                                    selectedWallet = value;
                                  });
                                  Navigator.pop(
                                      context); // Close the bottom sheet
                                },
                                activeColor: AppColor.primaryColor,
                              ),
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
  }
}

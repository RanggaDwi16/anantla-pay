import 'package:anantla_pay/src/core/helpers/widgets/custom_search_field.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:anantla_pay/src/presentation/home/controllers/get_user/fetch_user_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/controllers/get_all_bank/fetch_all_bank_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/domain/entities/bank_model.dart';
import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/helpers/widgets/custom_text_field.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';

class AddAccountMePage extends StatefulHookConsumerWidget {
  const AddAccountMePage({super.key});

  @override
  ConsumerState<AddAccountMePage> createState() => _AddAccountMePageState();
}

class _AddAccountMePageState extends ConsumerState<AddAccountMePage> {
  String? selectedBank;
  String? selectedWallet;
  final ValueNotifier<String> selectedSegment = ValueNotifier<String>('bank');

  // Dummy bank data
  final List<BankModel> dummyBanks = [
    BankModel(bankName: 'Bank A'),
    BankModel(bankName: 'Bank B'),
    BankModel(bankName: 'Bank C'),
    BankModel(bankName: 'Bank D'),
  ];

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
    final user = ref.watch(fetchUserProvider);
    final emailController =
        useTextEditingController(text: user.value!.email ?? '');
    final nameController =
        useTextEditingController(text: user.value!.username ?? '');
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
                'Enter their account details',
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
              const Gap(24),
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
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                          controller: nameController,
                          labelText: 'Full name of the account holder',
                        ),
                        const Gap(16),
                        if (value == 'bank') ...[
                          // Bank Dropdown
                          Text(
                            'Bank name',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Gap(8),
                          allBanks.when(
                            data: (data) {
                              return GestureDetector(
                                onTap: () {
                                  // Open bank list as a BottomSheet
                                  _showBankSelectionBottomSheet(
                                      allBanks.value!);
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
                                        selectedBank ??
                                            'Please enter bank name',
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
                            error: (error, stackTrace) =>
                                Text('Error: ${error.toString()}'),
                            loading: () => CircularProgressIndicator(),
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
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                            onTap: () {},
                            controller: walletNumberController,
                            labelText: "Recipient's E-Wallet number",
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ],
                    ),
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

import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/helpers/widgets/custom_text_field.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:anantla_pay/src/presentation/account/controllers/activate_wallet/post_activate_wallet_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/create_wallet/post_wallet_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/get_all_country/fetch_all_country_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/get_transaction/fetch_transaction_provider.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/create_wallet_params.dart';
import 'package:anantla_pay/src/presentation/home/controllers/get_balance/fetch_balance_provider.dart';
import 'package:anantla_pay/src/presentation/main/controllers/user_id_provider.dart';
import 'package:anantla_pay/src/presentation/wallet/widgets/country_selector_bottom_sheet.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreateWalletPage extends HookConsumerWidget {
  const CreateWalletPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allCountry = ref.watch(fetchAllCountryProvider);
    final userId = ref.watch(userIdProvider).value;
    final countryCodeController = useTextEditingController();
    final createWallet = ref.watch(postWalletProvider);
    final walletsAsync = ref.watch(fetchBalanceProvider);

    final selectedCountryCode = useState<String?>(null);
    return Scaffold(
        backgroundColor: AppColor.secondaryBackground,
        appBar: CustomAppBar(
          centertitle: true,
          title: 'Create Wallet',
          backgroundColor: AppColor.secondaryBackground,
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
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () async {
                  final walletCountryCodes = walletsAsync.when(
                    data: (wallets) =>
                        wallets
                            ?.map((w) => w.countryCode?.toUpperCase())
                            .toSet() ??
                        {},
                    loading: () => <String>{},
                    error: (_, __) => <String>{},
                  );

                  final filteredCountries = allCountry.value
                          ?.where((c) =>
                              c.countryName?.toLowerCase() != 'unknown' &&
                              !walletCountryCodes
                                  .contains(c.countryCode?.toUpperCase()))
                          .toList() ??
                      [];

                  final selected = await showModalBottomSheet<String>(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(24)),
                    ),
                    builder: (_) => CountrySelectorBottomSheet(
                      countries: filteredCountries,
                      selectedCode: selectedCountryCode.value,
                    ),
                  );

                  if (selected != null) {
                    selectedCountryCode.value = selected;
                    countryCodeController.text = selected;
                  }
                },
                child: AbsorbPointer(
                  child: CustomTextField(
                    controller: countryCodeController,
                    labelText: 'Country Code',
                    isRequired: true,
                    hintText: 'Select Country Code',
                    // isDisabled: true,
                    suffixIcon: const Icon(Icons.keyboard_arrow_down),
                  ),
                ),
              ),
              const Gap(32),
              Button.filled(
                onPressed: () {
                  context.showProcessDialog(); // Show loading dialog
                  ref.read(postWalletProvider.notifier).postWallet(
                        params: CreateWalletParams(
                          userId: userId,
                          countryCode: selectedCountryCode.value,
                        ),
                        onSuccess: (message) {
                          //  ref.invalidate(fetchBalanceProvider);
                          //     ref.invalidate(fetchTransactionProvider);
                          //     context.goNamed(RouteName.main);
                          //null dan clear
                          context.pop(); // Close process dialog
                          selectedCountryCode.value = null;
                          countryCodeController.clear();
                          context.showSuccessDialog(
                            title: 'Success',
                            message: 'Successfully create wallet',
                            onConfirm: () {
                              ref.invalidate(fetchBalanceProvider);
                              ref.invalidate(fetchTransactionProvider);
                              context.goNamed(RouteName.main);
                            },
                          );
                          // ref
                          //     .read(postActivateWalletProvider.notifier)
                          //     .postActivateWallet(
                          //       params: ActivateWalletParams(
                          //         walletId: message,
                          //         countryCode: selectedCountryCode.value,
                          //       ),
                          //       onSuccess: (message) {
                          //         context
                          //             .pop(); // Close process dialog if shown again

                          //       },
                          //       onError: (message) {
                          //         context.pop(); // Close process dialog
                          //         context.showCustomSnackBar(
                          //             'Something went wrong in activate wallet. Please try again',
                          //             isError: true);
                          //       },
                          //     );
                        },
                        onError: (message) {
                          context.pop(); // CLOSE the process dialog
                          context.showCustomSnackBar(
                              'Something went wrong in create wallet. Please try again',
                              isError: true);
                        },
                      );
                },
                label: createWallet.isLoading ? 'Loading...' : 'Create Wallet',
                disabled: countryCodeController.text.isEmpty,
              ),
            ],
          ),
        ));
  }
}

import 'dart:math';

import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:anantla_pay/src/presentation/account/controllers/e-kyc/post_ekyc_verification_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/get_all_country/fetch_all_country_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/get_balance/fetch_balance_provider.dart';
import 'package:anantla_pay/src/presentation/account/controllers/get_transaction/fetch_transaction_provider.dart';
import 'package:anantla_pay/src/presentation/account/domain/entities/create_wallet_params.dart';
import 'package:anantla_pay/src/presentation/main/controllers/user_id_provider.dart';
import 'package:anantla_pay/src/presentation/wallet/widgets/country_selector_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/helpers/widgets/custom_text_field.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EkycVerificationPage extends HookConsumerWidget {
  const EkycVerificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allCountry = ref.watch(fetchAllCountryProvider);
    final userId = ref.watch(userIdProvider).value;
    final ekyc = ref.watch(postEkycVerificationProvider);

    final firstNameController = useTextEditingController();
    final lastNameController = useTextEditingController();
    final birthDateController = useTextEditingController();
    final taxIdController = useTextEditingController();
    final kycTypeController = useTextEditingController(text: 'Manual');
    final addressLine1Controller = useTextEditingController();
    final addressLine2Controller = useTextEditingController();
    final cityController = useTextEditingController();
    final stateController = useTextEditingController();
    final postalCodeController = useTextEditingController();
    final countryCodeController = useTextEditingController();

    final isFormValid = useState(false);
    final selectedCountryCode = useState<String?>(null);

    useEffect(() {
      void validateForm() {
        isFormValid.value = firstNameController.text.trim().isNotEmpty &&
            lastNameController.text.trim().isNotEmpty &&
            birthDateController.text.trim().isNotEmpty &&
            taxIdController.text.trim().isNotEmpty &&
            kycTypeController.text.trim().isNotEmpty &&
            addressLine1Controller.text.trim().isNotEmpty &&
            cityController.text.trim().isNotEmpty &&
            stateController.text.trim().isNotEmpty &&
            postalCodeController.text.trim().isNotEmpty &&
            countryCodeController.text.trim().isNotEmpty;
      }

      final controllers = [
        firstNameController,
        lastNameController,
        birthDateController,
        taxIdController,
        kycTypeController,
        addressLine1Controller,
        cityController,
        stateController,
        postalCodeController,
        countryCodeController,
      ];

      for (final c in controllers) {
        c.addListener(validateForm);
      }

      return () {
        for (final c in controllers) {
          c.removeListener(validateForm);
        }
      };
    }, []);

    return Scaffold(
      backgroundColor: AppColor.secondaryBackground,
      appBar: CustomAppBar(
        centertitle: true,
        title: 'E-KYC Verification',
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
          children: [
            CustomTextField(
              controller: firstNameController,
              labelText: 'First Name',
              isRequired: true,
            ),
            const Gap(16),
            CustomTextField(
              controller: lastNameController,
              labelText: 'Last Name',
              isRequired: true,
            ),
            const Gap(16),
            CustomTextField(
              controller: birthDateController,
              labelText: 'Date of Birth',
              isCalendar: true,
              isRequired: true,
              onTap: () async {
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (selectedDate != null) {
                  birthDateController.text =
                      "${selectedDate.toLocal()}".split(' ')[0];
                }
              },
            ),
            const Gap(16),
            CustomTextField(
              controller: taxIdController,
              labelText: 'Tax ID',
              isRequired: true,
            ),
            const Gap(16),
            CustomTextField(
              controller: kycTypeController,
              labelText: 'KYC Type',
              isDisabled: true,
              isRequired: true,
            ),
            const Gap(16),
            CustomTextField(
              controller: addressLine1Controller,
              labelText: 'Address Line 1',
              isRequired: true,
            ),
            const Gap(16),
            CustomTextField(
              controller: addressLine2Controller,
              labelText: 'Address Line 2',
            ),
            const Gap(16),
            CustomTextField(
              controller: cityController,
              labelText: 'City',
              isRequired: true,
            ),
            const Gap(16),
            CustomTextField(
              controller: stateController,
              labelText: 'State',
              isRequired: true,
            ),
            const Gap(16),
            CustomTextField(
              controller: postalCodeController,
              labelText: 'Postal Code',
              keyboardType: TextInputType.number,
              isRequired: true,
            ),
            const Gap(16),
            GestureDetector(
              onTap: () async {
                final selected = await showModalBottomSheet<String>(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  builder: (_) => CountrySelectorBottomSheet(
                    countries: allCountry.value ?? [],
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
                  // isDisabled: true,
                  suffixIcon: const Icon(Icons.keyboard_arrow_down),
                ),
              ),
            ),
            const Gap(32),
            Button.filled(
              onPressed: () {
                print("Selected Country Code: $selectedCountryCode");
                context.showProcessDialog();

                ref
                    .read(postEkycVerificationProvider.notifier)
                    .eKycVerification(
                        params: EKycParams(
                          userId: userId,
                          countryCode: selectedCountryCode.value,
                          kycData: KycData(
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            dob: DateTime.parse(birthDateController.text),
                            taxId: taxIdController.text,
                            kycType: kycTypeController.text,
                            address: KycAddress(
                              line1: addressLine1Controller.text,
                              line2: addressLine2Controller.text,
                              city: cityController.text,
                              state: stateController.text,
                              postalCode: postalCodeController.text,
                              country: selectedCountryCode.value,
                            ),
                          ),
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
                          context.pop();
                        });
              },
              label: ekyc.isLoading ? 'Loading...' : 'Submit',
              disabled: !isFormValid.value,
            ),
          ],
        ),
      ),
    );
  }
}

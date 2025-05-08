import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/presentation/transfer/controllers/transfer_data_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/widgets/review_detail/info_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

final checkboxAgreedProvider = StateProvider<bool>((ref) => false);

class ReviewDetailTransferBankPage extends ConsumerWidget {
  const ReviewDetailTransferBankPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isChecked = ref.watch(checkboxAgreedProvider);
    final transferData = ref.watch(transferDataNotifierProvider);

    return Scaffold(
      backgroundColor: AppColor.secondaryBackground,
      appBar: CustomAppBar(
        backgroundColor: AppColor.secondaryBackground,
        centertitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: AppColor.primaryWhite, // abu-abu terang sesuai gambar
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Review Detail',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              Gap(12),
              Text(
                'An amount of ${transferData.amountTransferBank} is estimated to reach your account in seconds',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColor.textGray,
                    ),
              ),
              Gap(32),
              Text(
                'Payment Method',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const Gap(12),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColor.primaryWhite,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    // Flag
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: AppColor.secondaryBackground,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(8), // mengecilkan icon
                      child: Center(
                        child: Image.asset(
                          Assets.icons.bankOutline.path,
                          width: 20,
                          height: 20,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),

                    // Texts
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${transferData.bankName}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          const Gap(4),
                          Text(
                            "${transferData.bankCode}",
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Gap(32),
              Text(
                '${transferData.bankName} bank details for ${transferData.virtualAccountName}',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const Gap(12),
              InfoField(
                label: 'Account holder name',
                value: '${transferData.virtualAccountName}',
              ),
              Divider(),
              const Gap(16),
              InfoField(
                label: 'Email (Optional)',
                value: '${transferData.virtualAccountEmail}',
              ),
              Divider(),
              const Gap(16),
              InfoField(
                label: 'Bank name',
                value: '${transferData.bankName}',
              ),
              Gap(32),
              Text(
                'Your Transfer',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const Gap(12),
              const InfoField(
                label: 'You send exactly ',
                value: '1 USD',
              ),
              Divider(),
              const Gap(16),
              const InfoField(
                label: 'TTAL Fees (included)',
                value: '0.64 USD',
              ),
              Divider(),
              const Gap(16),
              const InfoField(
                label: 'Total amount we`ll send',
                value: '1.64 USD',
              ),
              Divider(),
              const Gap(16),
              const InfoField(
                label: 'Guaranteed exchange rate',
                value: '1 USD= 86.4764 INR',
              ),
              Divider(),
              Gap(16),
              const InfoField(
                label: 'Rangga gets',
                value: '86.4764 INR',
              ),
              Gap(32),
              // Note
              Text(
                'Note:',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const Gap(8),
              Text(
                '${transferData.reasonTransferBank}',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColor.primaryBlack,
                    ),
              ),
              const Gap(16),
              const Divider(),
              const Gap(16),

// Additional info
              Text(
                'We\'ll learn from this refrensce and provide suggestions for future transfers',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 13,
                      color: AppColor.textGray,
                    ),
              ),
              const Gap(12),
              Text(
                '(${transferData.virtualAccountEmail}) will be informed via email',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 13,
                      color: AppColor.textGray,
                    ),
              ),
              const Gap(12),
              Text(
                'Lorem ipsum dolor sit amet consectetur. Purus varius pulvinar nunc ac sem. Commodo amet ultricies consectetur massa elementum senectus sollicitudin.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 13,
                      color: AppColor.textGray,
                    ),
              ),
              const Gap(12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        top: 2), // sesuaikan posisi verticalnya
                    width: 20,
                    height: 20,
                    child: Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        ref.read(checkboxAgreedProvider.notifier).state =
                            value ?? false;
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      side: const BorderSide(width: 1.5),
                      activeColor: AppColor.primaryColor,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity:
                          const VisualDensity(horizontal: -4, vertical: -4),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "I accept the Terms of Use and Privacy Policy",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 14,
                          ),
                    ),
                  ),
                ],
              ),

              const Gap(32),
              Button.filled(
                onPressed: () {
                  context.pushNamed(RouteName.verifyOtpTransferBank);
                },
                label: 'Confirm and Send',
                disabled: !isChecked,
              )

// Checkbox Terms
            ],
          ),
        ),
      ),
    );
  }
}

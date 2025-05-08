import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/presentation/transfer/widgets/reason/reason_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class TransferReasonPage extends StatefulWidget {
  const TransferReasonPage({super.key});

  @override
  State<TransferReasonPage> createState() => _TransferReasonPageState();
}

class _TransferReasonPageState extends State<TransferReasonPage> {
  String? selectedReason;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryBackground,
      appBar: CustomAppBar(
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
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Whats the reason for your transfer?',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const Gap(12),
            Text(
              'When sending money to Indonesia, we have to ask the reason for your transfer.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColor.textGray,
                  ),
            ),
            const Gap(20),
            Text(
              'Please select an option that best describes the reason for your transfer',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColor.primaryBlack,
                  ),
            ),
            const Gap(20),

            // Dropdown field
            GestureDetector(
              onTap: () async {
                final result = await showModalBottomSheet<String>(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: AppColor.primaryWhite,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  builder: (context) => const ReasonBottomSheet(),
                );

                if (result != null) {
                  setState(() => selectedReason = result);
                }
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: AppColor.primaryWhite,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColor.borderGray),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedReason ?? 'Select an option',
                      style: TextStyle(
                        color: selectedReason != null
                            ? AppColor.primaryBlack
                            : Colors.grey.shade600,
                        fontSize: 14,
                      ),
                    ),
                    const Icon(Icons.keyboard_arrow_down_rounded, size: 25),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

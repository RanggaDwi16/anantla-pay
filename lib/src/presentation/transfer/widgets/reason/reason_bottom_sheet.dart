import 'package:anantla_pay/src/presentation/transfer/controllers/transfer_data_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/helpers/widgets/custom_search_field.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ReasonBottomSheet extends ConsumerStatefulWidget {
  const ReasonBottomSheet({super.key});

  @override
  ConsumerState<ReasonBottomSheet> createState() => _ReasonBottomSheetState();
}

class _ReasonBottomSheetState extends ConsumerState<ReasonBottomSheet> {
  String? selectedReason;
  String searchQuery = '';
  String otherReasonText = '';

  final List<String> reasons = [
    'Personal expenses',
    'Sending money home to family',
    'Sending money to friends',
    'Savings',
    'Pay for goods and services',
    'Travel expenses',
    'Education expenses',
  ];

  @override
  Widget build(BuildContext context) {
    final filteredReasons = [...reasons, 'Other Reason']
        .where((reason) =>
            reason.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: context.deviceHeight * 0.05,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Close Button
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: AppColor.secondaryBackground,
                child: Image.asset(
                  Assets.icons.cancel.path,
                  width: 20,
                  height: 20,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Title
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Please select an option that best describes the reason for your transfer',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          const SizedBox(height: 16),

          // Search Field
          CustomSearchField(
            hintText: 'Search for a reason',
            onChanged: (value) {
              setState(() => searchQuery = value);
            },
          ),
          const SizedBox(height: 16),

          // Radio list
          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: filteredReasons.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final reason = filteredReasons[index];
                final isOther = reason == 'Other Reason';

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        reason,
                        style: const TextStyle(fontSize: 15),
                      ),
                      trailing: Radio<String>(
                        value: reason,
                        groupValue: selectedReason,
                        onChanged: (value) {
                          setState(() {
                            selectedReason = value;
                            if (value != 'Other Reason') otherReasonText = '';
                          });
                          if (value != 'Other Reason' && value != null) {
                            ref
                                .read(transferDataNotifierProvider.notifier)
                                .setReason(reason);
                            print('Selected reason: $reason');
                            context.pushNamed(RouteName.reviewDetailTransfer);
                          }
                        },
                      ),
                      onTap: () {
                        setState(() {
                          selectedReason = reason;
                          ref
                              .read(transferDataNotifierProvider.notifier)
                              .setReason(reason);
                          print('Selected reason: $reason');
                          if (reason != 'Other Reason') otherReasonText = '';
                        });
                        if (reason != 'Other Reason') {
                          ref
                              .read(transferDataNotifierProvider.notifier)
                              .setReason(reason);
                          print('Selected reason: $reason');
                          context.pushNamed(RouteName.reviewDetailTransfer);
                        }
                      },
                    ),

                    // Show TextField only if 'Other Reason' is selected
                    if (isOther && selectedReason == 'Other Reason') ...[
                      const SizedBox(height: 4),
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            otherReasonText = value;
                          });
                        },
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: 'Enter your reason...',
                          fillColor: AppColor.secondaryBackground,
                          filled: true,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ]
                  ],
                );
              },
            ),
          ),
          if (selectedReason == 'Other Reason') ...[
            Gap(context.deviceHeight * 0.02),
            Button.filled(
              onPressed: () {
                final reason = selectedReason == 'Other Reason'
                    ? otherReasonText
                    : selectedReason;
                if (reason != null && reason.trim().isNotEmpty) {
                  ref
                      .read(transferDataNotifierProvider.notifier)
                      .setReason(reason);
                  context.pushNamed(RouteName.reviewDetailTransfer);
                }
              },
              disabled: otherReasonText.trim().isEmpty,
              label: 'Continue',
            )
          ],
        ],
      ),
    );
  }
}

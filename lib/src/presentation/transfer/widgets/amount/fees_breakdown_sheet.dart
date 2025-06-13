import 'package:anantla_pay/src/presentation/transfer/controllers/transfer_data_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';
import 'package:gap/gap.dart';

class FeesBreakdownSheet extends ConsumerStatefulWidget {
  const FeesBreakdownSheet({super.key});

  @override
  ConsumerState<FeesBreakdownSheet> createState() => _FeesBreakdownSheetState();
}

class _FeesBreakdownSheetState extends ConsumerState<FeesBreakdownSheet> {
  final _controller = ValueNotifier<String>('breakdown');

  @override
  Widget build(BuildContext context) {
    final transferData = ref.watch(transferDataNotifierProvider);

    return SizedBox(
      width: context.deviceWidth,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: [
            /// Tabs
            SizedBox(
              width: context.deviceWidth,
              child: AdvancedSegment(
                controller: _controller,
                segments: const {
                  'breakdown': 'Breakdown',
                  'comparison': 'Comparison',
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

            Expanded(
              child: ValueListenableBuilder<String>(
                valueListenable: _controller,
                builder: (context, value, _) {
                  return value == 'breakdown'
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                'TOTAL FEES',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.primaryBlack,
                                    ),
                              ),
                            ),
                            const SizedBox(height: 24),

                            // Connected Bank Fee
                            _buildFeeRow('Connected bank account (ACH) fee',
                                '0,00 ${transferData.fromCurrency}'),

                            const SizedBox(height: 12),

                            // Our Fee
                            _buildFeeRow('Our free',
                                '0,00 ${transferData.fromCurrency}'),

                            const SizedBox(height: 16),

                            const Divider(),

                            const SizedBox(height: 12),

                            // Total
                            _buildFeeRow(
                              'Total',
                              '0,00 ${transferData.fromCurrency}',
                              isBold: true,
                            ),

                            const SizedBox(height: 8),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text(
                                  'Included in the amount you send',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : Text(
                          'Coming Soon',
                          style: Theme.of(context).textTheme.bodyLarge,
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeeRow(String label, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

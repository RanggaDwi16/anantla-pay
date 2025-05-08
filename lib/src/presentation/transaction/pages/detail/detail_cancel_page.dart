import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class DetailCancelPage extends StatelessWidget {
  const DetailCancelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.secondaryBackground,
        appBar: CustomAppBar(
          backgroundColor: AppColor.secondaryBackground,
          actions: [
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: AppColor.itemGray,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset(
                    Assets.icons.question.path,
                    width: 24,
                    height: 24,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Gap(16),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: AppColor.itemGray, // abu-abu terang sesuai gambar
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(
                      Assets.icons.moreLine.path,
                      width: 24,
                      height: 24,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ],
          leading: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: GestureDetector(
              onTap: () => context.pop(),
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: AppColor.itemGray, // abu-abu terang sesuai gambar
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
        body: Column(
          children: [
            const Gap(20),
            Center(
              child: CircleAvatar(
                backgroundColor: AppColor.primaryWhite,
                radius: 40,
                child: Image.asset(
                  Assets.icons.cancel.path,
                  width: 40,
                  height: 40,
                  fit: BoxFit.contain,
                  color: AppColor.textError,
                ),
              ),
            ),
            const Gap(14),
            Text(
              'Cancelled',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColor.textError,
                  ),
            ),
            const Gap(12),
            Text(
              '\$20,000',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: AppColor.primaryBlack,
                  ),
            ),
            const Gap(8),
            Text(
              'Sent to James Carter',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    color: AppColor.textGray,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            const Gap(18),
            _statusPill(context),
            const Gap(24),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.primaryWhite,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.deviceWidth * 0.05,
                    vertical: context.deviceHeight * 0.02,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Info alert box
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColor.secondaryBackground,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.info,
                                  size: 35, color: AppColor.primaryBlack),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  'Transfer was cancelled. Funds successfully returned on Dec 7, 2024.',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: AppColor.textGray,
                                        fontSize: 13,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Section Title
                        Text(
                          'Transaction details',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: AppColor.primaryBlack,
                                  ),
                        ),
                        const SizedBox(height: 20),

                        // Items
                        _detailItem(
                            context, 'When', 'Declined – Apr 6, 2024, 3:05 PM'),
                        const SizedBox(height: 16),
                        _detailItem(context, 'No Transaction', '#2042107195'),
                        const SizedBox(height: 16),
                        _detailItem(context, 'Where', 'Online'),
                        const SizedBox(height: 16),
                        _detailItem(context, 'Which Wallet', '7652'),
                        const SizedBox(height: 16),
                        _detailItem(context, 'Authorised via', 'Manual entry'),
                        const SizedBox(height: 16),

                        // Notes
                        Text(
                          'Notes',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: AppColor.textGray,
                                  ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Lorem ipsum et vehicula aliquet eu.',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: AppColor.primaryBlack,
                                  ),
                        ),
                        const SizedBox(height: 32),

                        // How you paid
                        Text(
                          'How you paid',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: AppColor.primaryBlack,
                                  ),
                        ),
                        const SizedBox(height: 20),

                        // Payment source and icon
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'IDR balance',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: AppColor.textGray,
                                  ),
                            ),
                            const Icon(
                              Icons.circle,
                              size: 14,
                              color: Colors.red,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Amount taken
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Amount taken',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: AppColor.textGray,
                                  ),
                            ),
                            Text(
                              '500,00 IDR',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.primaryBlack,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }

  Widget _detailItem(BuildContext context, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColor.textGray,
              ),
        ),
        Flexible(
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColor.primaryBlack,
                ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  Widget _statusPill(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10, left: 2, top: 2, bottom: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: AppColor.textGray),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
              color: AppColor.primaryColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                Assets.icons.send.path,
                width: 12,
                height: 12,
                color: AppColor.primaryWhite,
              ),
            ),
          ),
          const Gap(8),
          Text(
            'Transfer',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
          )
        ],
      ),
    );
  }
}

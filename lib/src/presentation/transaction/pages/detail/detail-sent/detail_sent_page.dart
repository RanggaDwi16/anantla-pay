import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:anantla_pay/src/presentation/transaction/pages/detail/detail-sent/details_sent_tab_page.dart';
import 'package:anantla_pay/src/presentation/transaction/pages/detail/detail-sent/updates_sent_tab_page.dart';
import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class DetailSentPage extends StatefulWidget {
  const DetailSentPage({super.key});

  @override
  State<DetailSentPage> createState() => _DetailSentPageState();
}

class _DetailSentPageState extends State<DetailSentPage> {
  final _controller = ValueNotifier('updates');
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
                  Assets.icons.arrowUpOutline.path,
                  width: 40,
                  height: 40,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const Gap(14),
            Text(
              'Sent',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColor.textGray,
                  ),
            ),
            const Gap(12),
            Text(
              '60,000 IDR',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: AppColor.primaryBlack,
                  ),
            ),
            const Gap(8),
            Text(
              'Nico Yudhanto',
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
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.deviceWidth * 0.05,
                    vertical: context.deviceHeight * 0.02,
                  ),
                  child: Column(
                    children: [
                      /// ===== Tabs =====
                      SizedBox(
                        width: double.infinity,
                        child: AdvancedSegment(
                          controller: _controller,
                          segments: const {
                            'updates': 'Updates',
                            'details': 'Details',
                          },
                          activeStyle: const TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                          inactiveStyle: const TextStyle(
                            color: AppColor.textGray,
                            fontWeight: FontWeight.w400,
                          ),
                          backgroundColor: AppColor.itemGray,
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

                      /// ===== Content based on active tab =====
                      const Gap(16),
                      Expanded(
                        child: ValueListenableBuilder<String>(
                          valueListenable: _controller,
                          builder: (context, value, _) {
                            return SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (value == 'updates') UpdatesSentTab(),
                                  if (value == 'details') DetailsSentTab(),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
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
                Assets.icons.dasshboardFill.path,
                width: 12,
                height: 12,
                color: AppColor.primaryWhite,
              ),
            ),
          ),
          const Gap(8),
          Text(
            'General',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
          ),
        ],
      ),
    );
  }
}

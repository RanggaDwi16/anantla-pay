import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:anantla_pay/src/presentation/transaction/pages/detail/detail-add/details_add_tab_page.dart';
import 'package:anantla_pay/src/presentation/transaction/pages/detail/detail-add/updates_add_tab_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class DetailAddPage extends StatefulWidget {
  const DetailAddPage({super.key});

  @override
  State<DetailAddPage> createState() => _DetailAddPageState();
}

class _DetailAddPageState extends State<DetailAddPage> {
  final _controller = ValueNotifier('updates');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryBackground,
      appBar: CustomAppBar(
        backgroundColor: AppColor.secondaryBackground,
        actions: [
          _circleButton(
              iconPath: Assets.icons.question.path,
              onTap: () => context.pushNamed(RouteName.help)),
          const Gap(16),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child:
                _circleButton(iconPath: Assets.icons.flash.path, onTap: () {}),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: _circleButton(
            iconPath: Assets.icons.arrowLeft.path,
            onTap: () => context.pop(),
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
                Assets.icons.add.path,
                width: 40,
                height: 40,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const Gap(14),
          Text(
            'Added',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColor.textGray,
                ),
          ),
          const Gap(12),
          Text(
            '+ 30 USD',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: AppColor.primaryBlack,
                ),
          ),
          const Gap(8),
          Text(
            'To your USD balance',
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
                                if (value == 'updates') UpdatesAddTab(),
                                if (value == 'details') DetailsAddTab(),
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
      ),
    );
  }

  Widget _circleButton(
      {required String iconPath, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          color: AppColor.itemGray,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Image.asset(
            iconPath,
            width: 24,
            height: 24,
            fit: BoxFit.contain,
          ),
        ),
      ),
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
            child: const Icon(Icons.add, size: 12, color: Colors.white),
          ),
          const Gap(8),
          Text(
            'Money Added',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
          )
        ],
      ),
    );
  }
}

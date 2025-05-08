import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/helpers/widgets/custom_search_field.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:anantla_pay/src/presentation/transfer/widgets/sending_to/add_recipient_card.dart';
import 'package:anantla_pay/src/presentation/transfer/widgets/sending_to/recent_recipient_section.dart';
import 'package:anantla_pay/src/presentation/transfer/widgets/sending_to/recipient_filter_section.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

class SendingToPage extends ConsumerWidget {
  const SendingToPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColor.secondaryBackground,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: context.deviceHeight * 0.95,
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
              vertical: context.deviceHeight * 0.03,
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => context.pop(),
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
                  const Gap(20),
                  Text(
                    'Who are you sending to?',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  const Gap(20),
                  CustomSearchField(
                    hintText: 'Search existing recipients',
                    onChanged: (value) {
                      ref.read(searchQueryProvider.notifier).state = value;
                    },
                  ),

                  const Gap(30),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.secondaryBackground,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Image.asset(
                          Assets.icons.streamline.path,
                          width: 48,
                          height: 48,
                        ),
                        const Gap(12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Have friends who use CashlessPay? Sync your phonebook contacts to send to them, fast.',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontSize: 14,
                                      color: AppColor.textSecondaryGray,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                              const Gap(8),
                              GestureDetector(
                                onTap: () {
                                  context.pushNamed(RouteName.comingSoon);
                                },
                                child: Text(
                                  'Sync contacts',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                        fontSize: 14,
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.w500,
                                        decoration: TextDecoration.underline,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(20),
                  // AddRecipientCard(onTap: () {
                  //   context.pushNamed(RouteName.transfer);
                  // }),
                  // const Gap(20),
                  // AddRecipientCard(onTap: () {}),
                  const Gap(20),
                  RecentRecipientSection(),
                  const Gap(20),
                  RecipientFilterSection(),
                  const Gap(20),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primaryColor,
        onPressed: () {
          context.pushNamed(RouteName.addRecipient);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

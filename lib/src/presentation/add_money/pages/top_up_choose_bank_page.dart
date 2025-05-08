import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/helpers/widgets/custom_search_field.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:anantla_pay/src/presentation/add_money/controllers/top_up_data_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/controllers/get_all_bank/fetch_all_bank_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/widgets/choose_bank/bank_card.dart';
import 'package:anantla_pay/src/presentation/transfer/widgets/choose_bank/mini_bank_card.dart';
import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class TopUpChooseBankPage extends ConsumerStatefulWidget {
  const TopUpChooseBankPage({super.key});

  @override
  ConsumerState<TopUpChooseBankPage> createState() =>
      _TopUpChooseBankPageState();
}

class _TopUpChooseBankPageState extends ConsumerState<TopUpChooseBankPage> {
  final _segmentController = ValueNotifier<String>('international');

  @override
  Widget build(BuildContext context) {
    final banks = ref.watch(fetchAllBankProvider);

    return Scaffold(
      backgroundColor: AppColor.secondaryBackground,
      appBar: CustomAppBar(
        backgroundColor: AppColor.secondaryBackground,
        title: 'Choose Bank',
        centertitle: true,
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSearchField(
                  hintText: 'Search for a Bank',
                  onChanged: (value) {},
                  color: AppColor.primaryWhite,
                ),
                const Gap(20),
                Text(
                  'Recently Used for Bank Transfers',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const Gap(20),
                banks.when(
                  data: (data) {
                    return BankCard(
                      onTap: () {
                        ref
                            .read(topUpDataNotifierProvider.notifier)
                            .setVirtualAccountData(
                                bankCode: data[0].bankCode ?? '');
                        context.pushNamed(RouteName.topUpReviewDetail);
                      },
                      title: data![0].bankName ?? '',
                      description: data[0].bankCode ?? '',
                      assetPath: Assets.icons.bankOutline.path,
                    );
                  },
                  error: (error, stackTrace) =>
                      const Center(child: Text('Error fetching data')),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                )
              ],
            ),
          ),
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
                  vertical: context.deviceHeight * 0.03,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pick for Bank Transfer',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    const Gap(20),
                    SizedBox(
                      width: context.deviceWidth,
                      child: AdvancedSegment(
                        controller: _segmentController,
                        segments: const {
                          'international': 'International',
                          'same': 'Same Currency',
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
                    const Gap(20),
                    Expanded(
                      child: ValueListenableBuilder<String>(
                        valueListenable: _segmentController,
                        builder: (context, segment, _) {
                          return banks.when(
                            data: (data) {
                              if (segment == 'international') {
                                return const Center(
                                  child: Text(
                                    'Bank internasional',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.textGray,
                                    ),
                                  ),
                                );
                              }

                              // Untuk segment 'same', tampilkan daftar bank
                              final filtered = data!;

                              return ListView.separated(
                                itemCount: filtered.length,
                                separatorBuilder: (_, __) => const Gap(12),
                                itemBuilder: (context, index) {
                                  final bank = filtered[index];
                                  return MiniBankCard(
                                    onTap: () {
                                      ref
                                          .read(topUpDataNotifierProvider
                                              .notifier)
                                          .setVirtualAccountData(
                                              bankCode: bank.bankCode ?? '');
                                      print('Bank Code: ${bank.bankCode}');
                                      context.pushNamed(
                                          RouteName.topUpReviewDetail);
                                    },
                                    title: bank.bankName ?? '',
                                    description: bank.bankCode ?? '',
                                    assetPath: Assets.icons.bankOutline.path,
                                  );
                                },
                              );
                            },
                            error: (error, _) =>
                                Center(child: Text('Error: $error')),
                            loading: () => const Center(
                                child: CircularProgressIndicator()),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

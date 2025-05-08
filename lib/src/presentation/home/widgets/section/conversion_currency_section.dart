import 'package:anantla_pay/src/core/helpers/formatters/string_format.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:anantla_pay/src/presentation/home/provider/currency_state_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/controllers/get_exhange_rate/fetch_exhange_rate_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConversionCurrencySection extends HookConsumerWidget {
  const ConversionCurrencySection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fromCurrency = useTextEditingController();
    final amountController = useTextEditingController();
    final convertAmount = ref.watch(fetchExhangeRateProvider);

    Future<void> showCurrencyBottomSheet({
      required bool isFrom,
    }) async {
      final List<String> currencies = ['IDR', 'SGD'];
      final currentCurrency = isFrom
          ? ref.read(fromCurrencyTypeProvider)
          : ref.read(toCurrencyTypeProvider);

      final selected = await showModalBottomSheet<String>(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        builder: (_) => ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          itemCount: currencies.length,
          separatorBuilder: (_, __) => const Gap(12),
          itemBuilder: (context, index) {
            final currency = currencies[index];
            final isSelected = currency == currentCurrency;
            return ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              tileColor:
                  isSelected ? AppColor.primaryColor.withOpacity(0.1) : null,
              leading: ClipOval(
                child: Image.asset(
                  getCurrencyFlagAsset(currency),
                  width: 32,
                  height: 32,
                ),
              ),
              title: Text(currency),
              trailing: isSelected
                  ? const Icon(Icons.check_circle, color: AppColor.primaryColor)
                  : null,
              onTap: () => Navigator.pop(context, currency),
            );
          },
        ),
      );

      if (selected != null) {
        if (isFrom) {
          ref.read(fromCurrencyTypeProvider.notifier).state = selected;
        } else {
          ref.read(toCurrencyTypeProvider.notifier).state = selected;
          ref.invalidate(fetchExhangeRateProvider);
        }
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          'Conversion Currency',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: AppColor.primaryBlack,
              ),
        ),
        const Gap(16),

        // Gray box content
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColor.secondaryBackground,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      // From Currency
                      // bagian GestureDetector untuk memilih currency From
                      Expanded(
                        child: GestureDetector(
                          onTap: () => showCurrencyBottomSheet(isFrom: true),
                          child: Row(
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  getCurrencyFlagAsset(
                                      ref.watch(fromCurrencyTypeProvider)),
                                  width: 24,
                                  height: 24,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                ref.watch(fromCurrencyTypeProvider),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              const Icon(Icons.keyboard_arrow_down_rounded),
                            ],
                          ),
                        ),
                      ),

// bagian GestureDetector untuk memilih currency To
                      Expanded(
                        child: GestureDetector(
                          onTap: () => showCurrencyBottomSheet(isFrom: false),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  getCurrencyFlagAsset(
                                      ref.watch(toCurrencyTypeProvider)),
                                  width: 24,
                                  height: 24,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                ref.watch(toCurrencyTypeProvider),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              const Icon(Icons.keyboard_arrow_down_rounded),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(20), // spacer for swap icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Input Amount
                      Flexible(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: AppColor.primaryWhite,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: amountController,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    final amount = value.trim();
                                    if (amount.isNotEmpty) {
                                      ref
                                          .read(
                                              fetchExhangeRateProvider.notifier)
                                          .fetchExchangeRate(
                                            fromCurrency: ref
                                                .read(fromCurrencyTypeProvider),
                                            toCurrency: ref
                                                .read(toCurrencyTypeProvider),
                                            amount: amount,
                                          );
                                    } else {
                                      // Optionally: clear or reset the provider if needed
                                      ref.invalidate(fetchExhangeRateProvider);
                                    }
                                  },
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    isDense: true,
                                    hintText: '0',
                                    contentPadding: EdgeInsets.zero,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                  width: 2), // jarak antar angka dan currency
                              Text(
                                ref.watch(fromCurrencyTypeProvider),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Gap(context.deviceWidth / 2 -
                          100), // space for center icon

                      // Converted Amount
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 12),
                          decoration: BoxDecoration(
                            color: AppColor.primaryWhite,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: convertAmount.when(
                            data: (data) {
                              if (data == null) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        '...',
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: false,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 2),
                                    Text(
                                      ref.watch(toCurrencyTypeProvider),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                );
                              }

                              final roundedData = data.trim().split(' ')[0];
                              final decimalPart = roundedData.contains('.')
                                  ? roundedData
                                      .split('.')[1]
                                      .padRight(2, '0')
                                      .substring(0, 2)
                                  : '00';
                              final formattedData =
                                  '${roundedData.split('.')[0]}.$decimalPart';

                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Text(
                                      formattedData,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 2), // lebih rapat
                                  Text(
                                    ref.watch(toCurrencyTypeProvider),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              );
                            },
                            loading: () => Center(child: const Text('...')),
                            error: (error, stack) {
                              print('Error: $error');
                              return Center(child: const Text('Error'));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(24),
                  Button.filled(
                    onPressed: () {
                      context.pushNamed(RouteName.comingSoon);
                    },
                    label: 'Send',
                    borderRadius: 8,
                  ),
                ],
              ),

              // Swap icon di tengah-tengah
              Positioned(
                top: 10,
                child: GestureDetector(
                  onTap: () {
                    ref
                        .read(fetchExhangeRateProvider.notifier)
                        .fetchExchangeRate(
                            fromCurrency: ref.watch(fromCurrencyTypeProvider),
                            toCurrency: ref.watch(toCurrencyTypeProvider),
                            amount: amountController.text);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      Assets.icons.swapOutlined.path,
                      width: 30,
                      height: 30,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

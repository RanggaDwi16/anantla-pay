import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/helpers/formatters/string_format.dart';
import 'package:anantla_pay/src/core/helpers/widgets/custom_search_field.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/presentation/account/controllers/get_transaction/fetch_transaction_provider.dart';
import 'package:anantla_pay/src/presentation/home/controllers/get_user/fetch_user_provider.dart';
import 'package:anantla_pay/src/presentation/home/widgets/all_transaction/transaction_item_widget.dart';
import 'package:anantla_pay/src/presentation/home/widgets/icon_circle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RecipientPage extends HookConsumerWidget {
  const RecipientPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(fetchUserProvider);
    final transactions = ref.watch(fetchTransactionProvider);
    final searchController = useTextEditingController();
    final filteredResults = useState<List<dynamic>>([]);

    useEffect(() {
      searchController.addListener(() {
        final keyword = searchController.text.toLowerCase();
        final allTransactions = ref.read(fetchTransactionProvider).value ?? [];

        filteredResults.value = allTransactions.where((tx) {
          final name = tx.transWalletType?.toLowerCase() ?? '';
          final date =
              tx.transactionDate?.toIso8601String().split('T').first ?? '';
          final amount = tx.amount.toString();

          return name.contains(keyword) ||
              date.contains(keyword) ||
              amount.contains(keyword);
        }).toList();
      });
      return null;
    }, [searchController]);

    return Scaffold(
      backgroundColor: AppColor.secondaryBackground,
      appBar: CustomAppBar(
        showBackButton: false,
        backgroundColor: AppColor.secondaryBackground,
        customTitleWidget: Row(
          children: [
            user.value?.profilePicture != null
                ? CircleAvatar(
                    backgroundImage: NetworkImage(user.value!.profilePicture!),
                    backgroundColor: AppColor.primaryWhite,
                    radius: 22,
                  )
                : CircleAvatar(
                    backgroundImage: AssetImage(Assets.images.a1.path),
                    radius: 22,
                  ),
            const Gap(10),
            Expanded(
              child: Text(
                'Hi, ${user.value?.username ?? "..."}',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColor.primaryBlack,
                    ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        actions: [
          IconCircle(
            imagePath: Assets.icons.notification.path,
            onTap: () => context.pushNamed(RouteName.notification),
          ),
          const SizedBox(width: 8),
          IconCircle(
            imagePath: Assets.icons.setting.path,
            onTap: () => context.pushNamed(RouteName.setting),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: CustomSearchField(
              controller: searchController,
              hintText: 'Search by name, date or amount...',
              color: AppColor.primaryWhite,
            ),
          ),
          const Gap(24),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: AppColor.primaryWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Last transactions:',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: AppColor.primaryBlack,
                                  ),
                        ),
                      ],
                    ),
                    const Gap(12),
                    transactions.when(
                      data: (data) {
                        final listToShow = searchController.text.isEmpty
                            ? data
                            : filteredResults.value;

                        if (listToShow.isEmpty) {
                          return const Center(
                            child: Text(
                              'No transactions found',
                              style: TextStyle(
                                  fontSize: 16, color: AppColor.primaryBlack),
                            ),
                          );
                        }

                        return Expanded(
                          child: ListView.builder(
                            itemCount: listToShow.length,
                            itemBuilder: (context, index) {
                              final transaction = listToShow[index];
                              return TransactionItem(
                                name: formatTransactionType(
                                    transaction.transWalletType),
                                date: transaction.transactionDate
                                        ?.toIso8601String() ??
                                    '',
                                amount: transaction.amount.toString(),
                                currency: transaction.currencyTo ?? '',
                                statusLabel: transaction.transactionType ?? '',
                                iconPath: transaction.transactionType ?? '',
                              );
                            },
                          ),
                        );
                      },
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (error, stack) =>
                          Center(child: Text('Error: $error')),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

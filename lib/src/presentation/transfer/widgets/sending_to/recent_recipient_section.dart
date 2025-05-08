import 'package:anantla_pay/src/core/helpers/formatters/string_format.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/presentation/transfer/controllers/get_all_wallet/fetch_all_wallet_provider.dart';
import 'package:anantla_pay/src/presentation/transfer/controllers/transfer_data_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class RecentRecipientSection extends ConsumerWidget {
  const RecentRecipientSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentUsers = ref.watch(fetchAllWalletProvider);
    // Dummy data untuk contoh

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        const Text(
          'Recent:',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        const Gap(12),

        // Avatar List
        recentUsers.when(
            data: (data) {
              return SizedBox(
                height: 90,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.length > 5 ? 5 : data.length,
                  separatorBuilder: (_, __) => const Gap(20),
                  itemBuilder: (context, index) {
                    final user = data[index];
                    return GestureDetector(
                      onTap: () {
                        // final notifier =
                        //     ref.read(transferDataNotifierProvider.notifier);

                        // notifier.setCurrencies(toCurrency: user.currency ?? '');
                        // notifier.setToName(user.username ?? '');
                        // notifier.setToPhone(user.phone ?? '');

                        // // 🔍 Logging opsional
                        // print(
                        //     'Send to: ${user.username}, Currency: ${user.currency}');

                        // context.pushNamed(RouteName.transfer);
                        print('wallet id: ${user.username}');

                        final notifier =
                            ref.read(transferDataNotifierProvider.notifier);

                        notifier.setToName(user.username ?? '');

                        notifier.setCurrencies(toCurrency: user.currency ?? '');
                        notifier.setToWalletId(user.walletId);
                        context.pushNamed(RouteName.transferAmount);
                      },
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              // Avatar
                              CircleAvatar(
                                radius: 28,
                                backgroundColor: Colors.grey[200],
                                child: Text(
                                  getInitials(
                                    user!.username ?? '',
                                  ),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              // Flag
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: ClipOval(
                                  child: Image.asset(
                                    getCurrencyFlagAsset(user.currency ?? ''),
                                    width: 16,
                                    height: 16,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Gap(6),
                          Text(
                            user.username ?? '',
                            style: const TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
            error: (_, __) => const Center(
                  child: Text(
                    'Error loading recent recipients',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )),
      ],
    );
  }
}

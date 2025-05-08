import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/presentation/home/controllers/get_balance/fetch_balance_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anantla_pay/src/core/helpers/formatters/string_format.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:go_router/go_router.dart';

class AddCardButton extends StatelessWidget {
  final bool isHaveWallet;
  const AddCardButton({
    super.key,
    required this.isHaveWallet,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // context.pushNamed(RouteName.ekyc);
        context.pushNamed(RouteName.createWallet);
      },
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(16),
        dashPattern: const [5, 5],
        strokeWidth: 2,
        color: Colors.grey,
        strokeCap: StrokeCap.butt,
        child: Container(
          width: isHaveWallet
              ? context.deviceWidth * 0.25
              : context.deviceWidth * 0.9,
          height: context.deviceHeight * 0.18,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Icon(
              Icons.add,
              size: 30,
              color: AppColor.primaryBlack,
            ),
          ),
        ),
      ),
    );
  }
}

class WalletCard extends StatelessWidget {
  final String? currency;
  final String? walletCode;
  final String? flag;
  const WalletCard({
    super.key,
    required this.currency,
    required this.walletCode,
    required this.flag,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipOval(
                child: Image.asset(
                  flag ?? Assets.flags.us.path,
                  width: 28,
                  height: 28,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                currency ?? '...',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            maskWalletCode(walletCode ?? ''),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColor.primaryWhite,
                  fontWeight: FontWeight.w400,
                ),
          ),
        ],
      ),
    );
  }
}

class WalletCardList extends ConsumerWidget {
  const WalletCardList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wallets = ref.watch(fetchBalanceProvider);
    return wallets.when(data: (data) {
      if (data == null || data.isEmpty) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AddCardButton(
            isHaveWallet: false,
          ),
        );
      }
      return SizedBox(
        height: 130,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.horizontal,
          itemCount: data.length + 1,
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            if (index == 0) {
              return AddCardButton(
                isHaveWallet: true,
              );
            }
            final wallet = data[index - 1];
            return WalletCard(
              currency: wallet.currency,
              walletCode: formatCurrency(
                amount: wallet.balance ?? 0,
                currencyCode: wallet.currency ?? '',
                isTransferAmount: wallet.currency != 'IDR',
              ),
              flag: getCurrencyFlagAsset(wallet.currency),
            );
          },
        ),
      );
    }, error: (error, stackTrace) {
      return const Center(
        child: Text('Error fetching wallets'),
      );
    }, loading: () {
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}

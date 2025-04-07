import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/helpers/formatters/currency_format.dart';
import 'package:anantla_pay/src/core/helpers/formatters/string_format.dart';
import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/presentation/qr/domain/entities/qr_model.dart';
import 'package:anantla_pay/src/presentation/qr/widgets/item_choose_payment.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class InvoicePage extends StatelessWidget {
  final QrModel qrModel;

  const InvoicePage({
    super.key,
    required this.qrModel,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.goNamed(RouteName.main);
        return true;
      },
      child: Scaffold(
        backgroundColor: AppColor.secondaryBackground,
        appBar: CustomAppBar(
          backgroundColor: AppColor.secondaryBackground,
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
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundColor: AppColor.primaryColor2,
                  radius: 40,
                  child: Image.asset(
                    Assets.icons.check.path,
                    width: 40,
                    height: 40,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Gap(14),
              Center(
                child: Text(
                  'Scan Successful',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              Gap(20),
              _buildRow(
                'Total to Pay',
                formatByCurrency(qrModel.amount ?? '', 'IDR'),
                context,
              ),
              Gap(20),
              Text(
                'Choose Payment Method',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              Gap(10),
              buildItemChoosePayment(
                context,
                title: 'Wallet',
                subtitle: 'Instantly pay using your favorite digital wallet',
                iconPath: Assets.icons.card.path,
                onTap: () {},
              ),
              buildItemChoosePayment(
                context,
                title: 'Direct Debit',
                subtitle: 'Automatically pay straight from your bank account',
                iconPath: Assets.icons.debit.path,
                onTap: () {},
              ),
              buildItemChoosePayment(
                context,
                title: 'Credit Card',
                subtitle: 'Pay securely using your credit card anytime',
                iconPath: Assets.icons.cardOutline.path,
                onTap: () {},
              ),
              buildItemChoosePayment(
                context,
                title: 'Others',
                subtitle: 'Choose other methods that suit your needs',
                iconPath: Assets.icons.card.path,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(String label, String? value, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$label:',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColor.textGray,
                ),
          ),
          Text(
            value ?? '-',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }
}

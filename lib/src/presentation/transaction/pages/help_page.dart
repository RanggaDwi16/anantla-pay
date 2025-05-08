import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gap/gap.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  final List<Map<String, String>> faqs = const [
    {
      'question': 'How do I make a payment using QR code?',
      'answer': 'To make a payment using a QR code, follow these steps:\n'
          '1. Open your payment app (such as your mobile banking or e-wallet app).\n'
          '2. Select the “Scan QR” feature on the home screen.\n'
          '3. Point your phone’s camera at the QR code provided by the merchant.\n'
          '4. Enter the payment amount (if it\'s not automatically filled).\n'
          '5. Confirm the details and enter your PIN or use biometric verification.\n'
          '6. Wait for the confirmation message that the transaction was successful.\n\n'
          'Make sure you have a stable internet connection and sufficient balance before making the payment.',
    },
    {
      'question': 'QR code payment is not recognized.',
      'answer': 'Make sure the QR code is valid and supported by your app.',
    },
    {
      'question': 'CashlessPay is not available for certain transactions/services.',
      'answer': 'Some merchants or services may not support CashlessPay payment.',
    },
    {
      'question':
          'Why can’t I make a payment even after entering the CashlessPay PIN correctly?',
      'answer':
          'Check your internet connection and ensure your balance is sufficient.',
    },
    {
      'question':
          'Transaction on an online store or other app failed but the balance was deducted.',
      'answer':
          'Please contact support with transaction ID for resolution or refund.',
    },
    {
      'question':
          'Offline store transaction failed but the balance was deducted.',
      'answer':
          'Your balance will be returned shortly if the transaction failed.',
    },
    {
      'question':
          'What can I do if I can’t make a transaction at a partner merchant?',
      'answer':
          'Check your balance and ensure the merchant is registered with us.',
    },
    {
      'question':
          'What can I do if the partner merchant hasn’t received the payment?',
      'answer':
          'Ask the merchant to refresh their app or confirm the transaction ID.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryBackground,
      appBar: CustomAppBar(
        title: 'Help',
        centertitle: true,
        backgroundColor: AppColor.secondaryBackground,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: GestureDetector(
            onTap: () => context.pop(),
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: AppColor.itemGray,
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
        padding: const EdgeInsets.all(16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: faqs.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final item = faqs[index];
                    return Theme(
                      data: Theme.of(context).copyWith(
                        dividerColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: index == 0
                                ? const Radius.circular(16)
                                : Radius.zero,
                            topRight: index == 0
                                ? const Radius.circular(16)
                                : Radius.zero,
                            bottomLeft: index == faqs.length - 1
                                ? const Radius.circular(16)
                                : Radius.zero,
                            bottomRight: index == faqs.length - 1
                                ? const Radius.circular(16)
                                : Radius.zero,
                          ),
                          color: AppColor.primaryWhite,
                        ),
                        child: ExpansionTile(
                          title: Text(
                            item['question']!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                          iconColor: AppColor.textGray,
                          collapsedIconColor: AppColor.textGray,
                          tilePadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          childrenPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 4,
                          ),
                          children: [
                            Text(
                              item['answer']!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: AppColor.textGray,
                                    fontSize: 14,
                                  ),
                            ),
                            const Gap(12),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

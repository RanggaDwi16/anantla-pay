import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class UpdatesSentTab extends StatelessWidget {
  const UpdatesSentTab({super.key});

  @override
  Widget build(BuildContext context) {
    final updates = [
      {
        'time': 'December 7, 2024 at 5:12 PM',
        'title': 'You set up your transfer',
        'done': false,
      },
      {
        'time': 'December 7, 2024 at 5:13 PM',
        'title': 'We received you USD',
        'done': false,
      },
      {
        'time': 'December 7, 2024 at 5:13 PM',
        'title': 'We paid out your USD',
        'done': false,
      },
      {
        'time': 'December 7, 2024 at 5:13 PM',
        'title': 'Your transfer’s complete',
        'done': true,
      },
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Transaction details',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
          ),
          const Gap(24),
          ...List.generate(updates.length, (index) {
            final item = updates[index];
            final isLast = index == updates.length - 1;

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Step icon
                Column(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: item['done'] == true
                            ? AppColor.primaryColor
                            : Colors.grey.shade300,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                    if (!isLast)
                      Container(
                        width: 2,
                        height: 40,
                        color: Colors.grey.shade300,
                      ),
                  ],
                ),
                const SizedBox(width: 12),

                /// Step info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['time'].toString(),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColor.primaryColor,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item['title'].toString(),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight:
                                  isLast ? FontWeight.w700 : FontWeight.w400,
                              color: isLast
                                  ? AppColor.primaryBlack
                                  : AppColor.textGray,
                            ),
                      ),
                      const Gap(20),
                    ],
                  ),
                ),
              ],
            );
          }),

          /// Extra note
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text.rich(
              TextSpan(
                text: 'We sent ',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 13,
                      color: AppColor.primaryBlack,
                    ),
                children: [
                  TextSpan(
                    text: '60,000 IDR',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: AppColor.primaryBlack,
                        ),
                  ),
                  TextSpan(
                    text: ' to Nico Yudhanto.\nThe rate for your transfer was ',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 13,
                          color: AppColor.primaryBlack,
                        ),
                  ),
                  TextSpan(
                    text: '1 USD = 11,828.6000 IDR.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: AppColor.primaryBlack,
                        ),
                  ),
                ],
              ),
            ),
          ),

          const Gap(24),
          Button.filled(onPressed: () {}, label: 'Download Receipt'),
          Gap(18),
          Button.filled(onPressed: () {}, label: 'Rate the App')
        ],
      ),
    );
  }
}

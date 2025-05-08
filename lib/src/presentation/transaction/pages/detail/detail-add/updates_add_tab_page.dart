import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:gap/gap.dart';

class UpdatesAddTab extends StatelessWidget {
  const UpdatesAddTab({super.key});

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
            final isLast = index == updates.length - 1;
            final item = updates[index];

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Timeline
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
                      child: Icon(
                        Icons.check,
                        size: 20,
                        color: item['done'] == true
                            ? Colors.white
                            : AppColor.primaryColor,
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

                // Info
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
                              color: AppColor.textGray,
                            ),
                      ),
                      const Gap(20),
                    ],
                  ),
                ),
              ],
            );
          }),
          const Gap(24),
          Button.filled(onPressed: () {}, label: 'Rate the App')
        ],
      ),
    );
  }
}

import 'package:anantla_pay/src/presentation/home/widgets/carousel_widget.dart';
import 'package:anantla_pay/src/presentation/home/widgets/transaction_item_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/constant/path.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Hey, Noah!',
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              width: 50,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  ImagePath.avatar1,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.deviceWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            CarouselWidget(),
            const Gap(40),
            Text(
              "What's up on Blaze?",
              style: TextStyle(
                color: AppColor.textGray,
                fontSize: 14,
              ),
            ),
            const Gap(10),
            Expanded(
              child: SingleChildScrollView(
                child: buildTransactionList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

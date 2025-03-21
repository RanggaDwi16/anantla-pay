import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/constant/path.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:anantla_pay/src/presentation/card/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'My Cards',
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(10),

            /// **Tampilan Kartu Virtual**
            buildCard(),

            const Gap(20),

            /// **Tombol Tambah Kartu**
            Align(
              alignment: Alignment.centerRight,
              child: Button.filled(
                onPressed: () {
                  context.showCustomSnackBar(
                      'Feature is on development. Stay tuned!');
                },
                label: 'Add Card',
                color: AppColor.primaryBlack,
                width: 100,
              ),
            ),

            const Gap(10),

            /// **Daftar Kartu**
            const Text(
              "Your Cards",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Gap(10),

            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return buildCardItem(index, context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// **Widget untuk Tampilan Kartu Virtual**
}

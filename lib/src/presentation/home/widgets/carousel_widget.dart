import 'package:anantla_pay/src/presentation/main/controllers/selected_index_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends ConsumerWidget {
  const CarouselWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(selectedIndexProvider.notifier).update((state) => 1);
      },
      child: SizedBox(
        height: context.deviceHeight * 0.18, // ✅ Tentukan tinggi tetap
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          itemBuilder: (context, index) {
            if (index == 1) {
              // Item kedua hanya container dengan warna hitam
              return Container(
                width: context.deviceWidth * 0.85,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
              );
            }
            return Container(
              width: context.deviceWidth *
                  0.85, // ✅ Ukuran lebih kecil dari layar agar terlihat geser
              margin: const EdgeInsets.only(right: 10), // ✅ Jarak antar item
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pay / Request',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            'SEND MONEY\nANYONE',
                            style: TextStyle(
                              color: AppColor.primaryBlack,
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              height: 1.1,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black87,
                          size: 18,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

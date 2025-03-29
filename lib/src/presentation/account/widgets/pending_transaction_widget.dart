import 'package:anantla_pay/src/core/helpers/formatters/string_format.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

Widget buildPendingTransaction() {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Header transaksi (Ikon, Nama Bank, Jumlah, Status)
        Row(
          children: [
            /// Icon transaksi
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Colors.grey[200], // Background icon lebih soft
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_downward_rounded,
                color: Colors.black,
                size: 20,
              ),
            ),
            const Gap(12),

            /// Nama Bank
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cuty Bank Mexico',
                    style: TextStyle(
                      color: AppColor.primaryBlack,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow
                        .ellipsis, // Tambahkan titik tiga (...) jika teks terlalu panjang
                    maxLines: 1, // Pastikan hanya satu baris
                    softWrap: false, // Hindari pembungkusan teks ke baris baru
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Today',
                    style: TextStyle(
                      color: AppColor.textGray,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            /// Jumlah Uang & Status
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '+ \$25,000.00 MXN',
                  style: TextStyle(
                    color: AppColor.primaryGray,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'PROCESSING',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ],
        ),

        const Gap(12),

        /// Notification Bar (Info)
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.yellow[100], // Warna background kuning lebih soft
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            'Funds will arrive to your Blaze account between 2 to 5 business days.',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 12,
            ),
          ),
        ),
      ],
    ),
  );
}

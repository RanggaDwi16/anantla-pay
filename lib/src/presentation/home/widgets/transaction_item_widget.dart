import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/presentation/home/data/transaction.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

List<Widget> buildTransactionList() {
  return List.generate(transactions.length, (index) {
    final transaction = transactions[index];
    return _buildTransactionItem(transaction);
  });
}


/// Widget untuk item transaksi
Widget _buildTransactionItem(Map<String, String> transaction) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Avatar
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            transaction['avatar']!,
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
        ),
        const Gap(10),

        /// Detail transaksi
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Nama dan waktu transaksi
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    transaction['name']!,
                    style: TextStyle(
                      color: AppColor.primaryBlack,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            'S',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            'K',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                transaction['time']!,
                style: TextStyle(
                  color: AppColor.textGray,
                  fontSize: 12,
                ),
              ),
              const Gap(5),

              /// Pesan pembayaran
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColor.secondaryGray,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  transaction['message']!,
                  style: TextStyle(
                    color: AppColor.primaryBlack,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/presentation/account/data/history.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HistorySection extends StatelessWidget {
  const HistorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "History",
          style: TextStyle(
            color: AppColor.textGray,
            fontSize: 14,
          ),
        ),
        const Gap(10),
        ListView.builder(
          itemCount: historyTransactions.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final transaction = historyTransactions[index];
            return Column(
              children: [_buildHistoryItem(transaction), Gap(10)],
            );
          },
        ),
      ],
    );
  }

  /// Widget untuk menampilkan satu item transaksi di history
  Widget _buildHistoryItem(Map<String, dynamic> transaction) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          /// Avatar atau Icon Transaksi
          transaction['avatar'] is IconData
              ? Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    transaction['avatar'],
                    color: Colors.black,
                    size: 20,
                  ),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    transaction['avatar'],
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
          const Gap(12),

          /// Detail Transaksi (Nama & Tanggal)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction['name'],
                  style: TextStyle(
                    color: AppColor.primaryBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 2),
                Text(
                  transaction['date'],
                  style: TextStyle(
                    color: AppColor.textGray,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          /// Jumlah Transaksi
          Text(
            transaction['amount'],
            style: TextStyle(
              color: transaction['isCredit']
                  ? Colors.green // Warna hijau jika kredit (+)
                  : AppColor.primaryBlack, // Warna hitam jika debit (-)
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

Widget buildCard() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0xFF1E1E1E), Color(0xFF444444)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 12,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "ANANTLA PAY",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "****  ****  ****  1234",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              Icon(
                Icons.credit_card,
                color: Colors.white,
                size: 30,
              ),
            ],
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "VALID THRU",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),
              const Text(
                "12/26",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// **Widget untuk Daftar Kartu**
  Widget buildCardItem(int index, BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.showCustomSnackBar('Feature is on development. Stay tuned!');
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 3,
        child: ListTile(
          leading: Icon(Icons.credit_card),
          title: const Text(
            "****  ****  ****  1234",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: const Text("Expires: 12/26"),
        ),
      ),
    );
  }

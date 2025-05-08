import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddRecipientCard extends StatelessWidget {
  final VoidCallback onTap;

  const AddRecipientCard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xFFF0F0F2), // Warna abu-abu terang
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            // Circle dengan ikon "+"
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                Assets.icons.bankOutline.path,
                color: Colors.black,
              ),
            ),
            const Gap(16),

            // Teks
            const Expanded(
              child: Text(
                'Transfer Bank',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            // Ikon panah kanan
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: Colors.black54,
            ),
          ],
        ),
      ),
    );
  }
}

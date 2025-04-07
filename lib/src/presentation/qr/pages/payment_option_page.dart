import 'package:anantla_pay/src/presentation/qr/controllers/qr_data/qr_data_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class PaymentOptionPage extends ConsumerWidget {
  const PaymentOptionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qrData = ref.watch(qrDataProvider);
    print('QR Data: $qrData');

    return WillPopScope(
      onWillPop: () async {
        ref.invalidate(qrDataProvider);
        return true; // Allow the back navigation
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Payment Option'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Select Payment Option',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle payment option selection
                },
                child: const Text('Credit/Debit Card'),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  // Handle payment option selection
                },
                child: const Text('Bank Transfer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

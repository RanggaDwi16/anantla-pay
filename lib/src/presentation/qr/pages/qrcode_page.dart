import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'qris_scanner_page.dart';

class QrcodePage extends StatelessWidget {
  const QrcodePage({super.key});

  @override
Widget build(BuildContext context) {
  final String qrisData =
      "00020101021226640013COM.MYWEB.WWW01181234567890123456780214123456789012340303UKE5405100005912QRIS WANTUNO6013Jakarta Pusat6304XXXX";

  return Scaffold(
    backgroundColor: AppColor.secondaryBackground,
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          QrImageView(
            data: qrisData,
            version: QrVersions.auto,
            size: 280.0,
            backgroundColor: Colors.white,
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Button.filled(
                  onPressed: () {
                    debugPrint(qrisData);
                  },
                  label: 'Show RAW Data',
                ),
                const SizedBox(height: 12),
                Button.outlined(
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const QrisScannerPage(),
                      ),
                    );
                    if (result != null) {
                      debugPrint('✅ QRIS scanned: $result');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Scanned: $result')),
                      );
                    }
                  },
                  label: 'Scan QRIS',
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
}

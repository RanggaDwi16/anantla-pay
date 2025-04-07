import 'dart:io';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:anantla_pay/src/presentation/qr/controllers/qr_data/qr_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anantla_pay/src/presentation/qr/controllers/qr_decode/post_qr_decode_provider.dart';

class QrisScannerPage extends ConsumerStatefulWidget {
  const QrisScannerPage({super.key});

  @override
  ConsumerState<QrisScannerPage> createState() => _QrisScannerPageState();
}

class _QrisScannerPageState extends ConsumerState<QrisScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool isScanning = false;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    } else if (Platform.isIOS) {
      controller?.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final postQrState = ref.watch(postQrDecodeProvider);

    return Scaffold(
      backgroundColor: AppColor.secondaryBackground,
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Gap(20),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16), // Rounded corners
                    child: QRView(
                      key: qrKey,
                      onQRViewCreated: _onQRViewCreated,
                    ),
                  ),
                ),
              ),
              Expanded(flex: 1, child: SizedBox())
            ],
          ),
          Positioned(
            bottom: context.deviceHeight * 0.07,
            left: context.deviceWidth * 0.1,
            right: context.deviceWidth * 0.1,
            child: GestureDetector(
              onTap: () {
                controller?.resumeCamera();
                isScanning = false;
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.white, // Outer circle (white)
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor2, // Inner green circle
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Image.asset(
                        Assets.icons.scan.path, // Pastikan asset benar
                        width: 45,
                        height: 45,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;

    controller.scannedDataStream.listen((scanData) async {
      if (!isScanning && scanData.code != null) {
        isScanning = true;
        controller.pauseCamera();

        await ref.read(postQrDecodeProvider.notifier).postQrDecode(
              qrCode: scanData.code!,
              onSuccess: (data) {
                ref.read(qrDataProvider.notifier).state = data;

                context.pushNamed(RouteName.invoice, extra: data).then((_) {
                  controller.resumeCamera(); // ✅ Resume QR scanner
                  isScanning = false; // ✅ Allow scanning again
                });
              },
              onError: (error) {
                context.customErrorDialog(error);
                controller.resumeCamera();
                isScanning = false;
              },
            );
      }
    });
  }
}

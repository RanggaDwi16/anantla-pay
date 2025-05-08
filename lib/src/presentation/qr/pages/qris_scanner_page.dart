import 'dart:io';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:anantla_pay/src/presentation/qr/controllers/qr_data/qr_data_provider.dart';
import 'package:anantla_pay/src/presentation/qr/controllers/qr_decode/post_qr_decode_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:go_router/go_router.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:mobile_scanner/mobile_scanner.dart'; // Tambahkan ini untuk decode file

class QrisScannerPage extends ConsumerStatefulWidget {
  const QrisScannerPage({super.key});

  @override
  ConsumerState<QrisScannerPage> createState() => _QrisScannerPageState();
}

class _QrisScannerPageState extends ConsumerState<QrisScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool isScanning = false;
  bool isFlashOn = false; // Track the flash state
  bool isLoading = false; // Track loading state
  final ImagePicker _picker = ImagePicker();

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

  Future<void> _pickImageFromGallery() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      print('Image selected: ${pickedFile.path}');

      try {
        final result =
            await MobileScannerController().analyzeImage(pickedFile.path);
        if (result!.barcodes.isNotEmpty) {
          final barcode = result.barcodes.first.rawValue;
          if (barcode != null && barcode.isNotEmpty) {
            _handleDecodedQr(barcode);
          } else {
            context.customErrorDialog('QR code not detected in the image.');
            controller?.resumeCamera();
          }
        } else {
          context.customErrorDialog('QR code not detected in the image.');
          controller?.resumeCamera();
        }
      } catch (e) {
        context.customErrorDialog('QR code not detected in the image.');
        controller?.resumeCamera();
      }
    } else {
      print('No image selected');
    }
  }

  void _handleDecodedQr(String qrCode) async {
    if (!isScanning) {
      setState(() {
        isScanning = true;
        isLoading = true;
      });

      controller
          ?.pauseCamera(); // Optional: pause kamera saat dari gallery juga

      await ref.read(postQrDecodeProvider.notifier).postQrDecode(
            qrCode: qrCode,
            onSuccess: (data) {
              setState(() {
                isLoading = false;
                isScanning = false;
              });
              ref.read(qrDataProvider.notifier).state = data;

              context.pushNamed(RouteName.invoice, extra: data).then((_) {
                controller?.resumeCamera();
              });
            },
            onError: (error) {
              setState(() {
                isLoading = false;
                isScanning = false;
              });
              context.customErrorDialog(
                  "'Cannot connect to server, please try again later.'");
              controller?.resumeCamera();
            },
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Stop any ongoing scanning or loading when the user presses back
        setState(() {
          isScanning = false;
          isLoading = false;
        });
        controller?.dispose();
        return true; // Allow back navigation
      },
      child: Scaffold(
        backgroundColor: AppColor.secondaryBackground,
        body: Stack(
          children: [
            Column(
              children: <Widget>[
                Gap(context.deviceHeight * 0.1),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(16), // Rounded corners
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
                        color: AppColor.primaryColor, // Inner green circle
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: isLoading
                            ? CircularProgressIndicator(
                                color: AppColor.primaryWhite)
                            : Image.asset(
                                Assets.icons.scan.path,
                                width: 45,
                                height: 45,
                                fit: BoxFit.contain,
                              ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Flash button
            Positioned(
              bottom: context.deviceHeight * 0.07,
              right: context.deviceWidth * 0.15,
              child: GestureDetector(
                onTap: () async {
                  setState(() {
                    isFlashOn = !isFlashOn;
                  });
                  if (controller != null) {
                    await controller?.toggleFlash();
                  }
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: AppColor.itemGray, // Light gray color
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(
                      isFlashOn
                          ? Assets.icons.flash.path
                          : Assets.icons.flash
                              .path, // Toggle between flash on and off icon
                      width: 30,
                      height: 30,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            // Gallery image picker button
            Positioned(
              bottom: context.deviceHeight * 0.07,
              left: context.deviceWidth * 0.15,
              child: GestureDetector(
                onTap: _pickImageFromGallery,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: AppColor.itemGray, // Light gray color
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.image, // Icon for gallery image picker
                      color: AppColor.primaryColor,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;

    controller.scannedDataStream.listen((scanData) async {
      if (!isScanning && scanData.code != null) {
        setState(() {
          isScanning = true;
          isLoading = true; // Show loading spinner
        });

        controller.pauseCamera();

        await Future.any([
          ref.read(postQrDecodeProvider.notifier).postQrDecode(
                qrCode: scanData.code!,
                onSuccess: (data) {
                  if (!mounted) return;
                  setState(() {
                    isLoading = false;
                    isScanning = false;
                  });
                  ref.read(qrDataProvider.notifier).state = data;
                  print('QR Data: $data');
                  context.pushNamed(RouteName.invoice, extra: data).then((_) {
                    controller.resumeCamera();
                  });
                },
                onError: (error) {
                  if (!mounted) return;
                  setState(() {
                    isLoading = false;
                    isScanning = false;
                  });
                  context.customErrorDialog(
                    "Cannot connect to server, please try again later.",
                  );
                  controller.resumeCamera();
                },
              ),
          Future.delayed(const Duration(seconds: 3), () {
            if (isLoading) {
              if (mounted) {
                setState(() {
                  isLoading = false;
                  isScanning = false;
                });
                context
                    .customErrorDialog("Permintaan terlalu lama, coba lagi.");
                controller.resumeCamera();
              }
            }
          }),
        ]);
      }
    });
  }
}

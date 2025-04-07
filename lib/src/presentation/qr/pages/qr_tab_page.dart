import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'qrcode_page.dart';
import 'qris_scanner_page.dart';

class QRTabPage extends StatefulWidget {
  const QRTabPage({super.key});

  @override
  State<QRTabPage> createState() => _QRTabPageState();
}

class _QRTabPageState extends State<QRTabPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          AppColor.secondaryBackground, // Sesuaikan dengan desain kamu

      appBar: CustomAppBar(
        showBackButton: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: GestureDetector(
            onTap: () => context.pop(),
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: AppColor.itemGray, // abu-abu terang sesuai gambar
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  Assets.icons.arrowLeft.path,
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        backgroundColor: AppColor.secondaryBackground,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Container(
            color: AppColor
                .secondaryBackground, // <- Ganti dengan warna yang kamu mau
            child: TabBar(
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: AppColor.primaryColor2,
              labelColor: AppColor.primaryBlack,
              labelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
              unselectedLabelColor: AppColor.textSecondaryGray,
              tabs: const [
                Tab(text: 'My QR code'),
                Tab(text: 'Scan QR'),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          QrcodePage(),
          QrisScannerPage(),
        ],
      ),
    );
  }
}

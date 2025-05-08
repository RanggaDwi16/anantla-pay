import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SuccessScanTransactionPage extends StatefulWidget {
  const SuccessScanTransactionPage({super.key});

  @override
  _SuccessScanTransactionPageState createState() =>
      _SuccessScanTransactionPageState();
}

class _SuccessScanTransactionPageState
    extends State<SuccessScanTransactionPage> {
  bool isTransactionComplete = false;

  @override
  void initState() {
    super.initState();
    // Simulating a delay to mimic transaction completion
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isTransactionComplete = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryBackground,
      appBar: CustomAppBar(
        backgroundColor: AppColor.secondaryBackground,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: GestureDetector(
            onTap: () => context.goNamed(RouteName.main),
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.close,
                color: Colors.black,
                size: 24,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Center(
          child: Column(
            children: [
              // Circular Checkmark Icon with animation
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (child, animation) =>
                    ScaleTransition(scale: animation, child: child),
                child: Container(
                  key: ValueKey(isTransactionComplete),
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: isTransactionComplete
                        ? AppColor.primaryColor
                        : AppColor.primaryColor.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: isTransactionComplete
                        ? const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 40,
                          )
                        : const SizedBox(
                            width: 32,
                            height: 32,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 3,
                            ),
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Transaction Amount
              const Text(
                'Rp 120.000',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Sent to James Carter',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'james@email.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 30),

              // Transaction Details
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTransactionDetail('You Sent', 'Rp 120.000', context),
                    _buildTransactionDetail('To', 'James Carter', context),
                    _buildTransactionDetail(
                        'Email', 'james@email.com', context),
                    _buildTransactionDetail(
                        'Date', 'Mar 13, 2025 · 09:42 AM', context),
                    _buildTransactionDetail(
                        'Transaction ID', '241220230942', context),
                    _buildTransactionDetail(
                        'Reference ID', 'J2D8Z0Z4', context),
                    Divider(),
                    _buildTransactionDetail(
                        'Notes', 'Thank you for your good work!', context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Button.filled(
          onPressed: () {
            // Navigate back to the home screen or another page
            context.goNamed(RouteName.main);
          },
          label: 'Back to Home',
        ),
      ),
    );
  }

  Widget _buildTransactionDetail(
      String label, String value, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

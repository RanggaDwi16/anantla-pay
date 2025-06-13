import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';

class SuccessSetUpBiometricPage extends StatefulWidget {
  const SuccessSetUpBiometricPage({super.key});

  @override
  State<SuccessSetUpBiometricPage> createState() =>
      _SuccessSetUpBiometricPageState();
}

class _SuccessSetUpBiometricPageState extends State<SuccessSetUpBiometricPage> {
  bool _isDone = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() => _isDone = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryBackground,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 3),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _isDone
                  ? Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        color: AppColor.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 40,
                      ),
                    )
                  : const SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(
                        color: AppColor.primaryColor,
                        strokeWidth: 6,
                      ),
                    ),
            ),
            const SizedBox(height: 32),
            Text(
              'Biometric Setup Successful',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'You can now use the wallet safely and\nconveniently.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 18,
                    color: Colors.black54,
                  ),
            ),
            const Spacer(flex: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Button.filled(
                onPressed: () {
                  context.goNamed(RouteName.main);
                },
                disabled: !_isDone,
                label: 'Go to Wallet Dashboard',
              ),
              // SizedBox(
              //   width: double.infinity,
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: AppColor.primaryColor,
              //       padding: const EdgeInsets.symmetric(vertical: 16),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(30),
              //       ),
              //     ),
              //     onPressed: () {
              //       context.goNamed(RouteName.main);
              //     },
              //     child: const Text(
              //       'Go to Wallet Dashboard',
              //       style: TextStyle(color: Colors.white),
              //     ),
              //   ),
              // ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

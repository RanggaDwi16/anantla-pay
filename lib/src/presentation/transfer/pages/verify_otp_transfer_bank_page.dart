import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class VerifyOtpTransferBankPage extends ConsumerWidget {
  const VerifyOtpTransferBankPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColor.secondaryBackground,
      appBar: CustomAppBar(
        backgroundColor: AppColor.secondaryBackground,
        title: 'Enter your OTP',
        centertitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: GestureDetector(
            onTap: () => context.pop(),
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: AppColor.primaryWhite,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  Assets.icons.arrowLeft.path,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ),
        ),
      ),
      body: const OtpInputSection(),
    );
  }
}

class OtpInputSection extends ConsumerStatefulWidget {
  const OtpInputSection({super.key});

  @override
  ConsumerState<OtpInputSection> createState() => _OtpInputSectionState();
}

class _OtpInputSectionState extends ConsumerState<OtpInputSection> {
  final List<String> _otp = List.filled(6, '');
  int _currentIndex = 0;
  bool isPinVisible = false;

  void _handleInput(String value) {
    if (_currentIndex < 6) {
      setState(() {
        _otp[_currentIndex] = value;
        _currentIndex++;
      });
    }
  }

  void _handleBackspace() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
        _otp[_currentIndex] = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(40),
        // Header OTP Section
        Column(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.primaryWhite,
                border: Border.all(
                  color: AppColor.primaryColor,
                  width: 2,
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  Assets.icons.padlock
                      .path, // ganti dengan asset ikon gembok kamu
                  width: 32,
                  height: 32,
                  fit: BoxFit.contain,
                  color: AppColor.primaryColor,
                ),
              ),
            ),
            const Gap(16),
            Text(
              'Enter your OTP',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const Gap(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  isPinVisible ? Icons.visibility : Icons.visibility_off,
                  size: 16,
                  color: AppColor.textGray,
                ),
                const SizedBox(width: 6),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isPinVisible = !isPinVisible;
                    });
                  },
                  child: Text(
                    isPinVisible ? 'Hide PIN' : 'Show PIN',
                    style: const TextStyle(
                      color: AppColor.textGray,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const Gap(24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(6, (index) {
            final filled = _otp[index].isNotEmpty;
            return Container(
              width:
                  MediaQuery.of(context).size.width * 0.12, // Responsive width
              height: 55,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                  color: filled ? AppColor.primaryColor : Colors.grey.shade300,
                ),
                borderRadius: BorderRadius.circular(8),
                color: AppColor.primaryWhite,
              ),
              child: Text(
                filled ? (isPinVisible ? _otp[index] : '•') : '',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color:
                          filled ? AppColor.primaryColor : Colors.grey.shade300,
                    ),
              ),
            );
          }),
        ),
        const Gap(24),
        _buildCustomNumpad(),
        const Gap(16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Button.filled(
            disabled: _otp.contains(''),
            onPressed: () {
              context.pushNamed(RouteName.successTransfer);
            },
            label: 'Confirm and Send',
          ),
        )
      ],
    );
  }

  Widget _buildCustomNumpad() {
    final List<String> keys = [
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '*',
      '0',
      '<',
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: keys.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1.5,
        ),
        itemBuilder: (context, index) {
          final key = keys[index];
          return GestureDetector(
            onTap: () {
              if (key == '<') {
                _handleBackspace();
              } else if (RegExp(r'^[0-9]$').hasMatch(key)) {
                _handleInput(key);
              }
            },
            child: Container(
              alignment: Alignment.center,
              child: key == '<'
                  ? const Icon(Icons.backspace_outlined, size: 20)
                  : Text(
                      key,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:anantla_pay/src/core/provider/token_manager_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Fast & Secure Payments",
      "description":
          "Experience seamless transactions with high security and lightning speed.",
      // "image": "assets/images/onboarding1.png",
    },
    {
      "title": "All Wallets in One App",
      "description":
          "Manage all your digital wallets effortlessly in one place, anytime, anywhere.",
      // "image": "assets/images/onboarding2.png",
    },
    {
      "title": "Track Your Transactions",
      "description":
          "Keep track of your payments, transfers, and expenses with ease.",
      // "image": "assets/images/onboarding3.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: onboardingData.length,
              itemBuilder: (context, index) {
                final data = onboardingData[index];
                return _buildOnboardingItem(
                  title: data["title"]!,
                  description: data["description"]!,
                  // imagePath: data["image"]!,
                );
              },
            ),
          ),

          /// **Smooth Page Indicator**
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: SmoothPageIndicator(
              controller: _pageController,
              count: onboardingData.length,
              effect: ExpandingDotsEffect(
                activeDotColor: AppColor.primaryBlack,
                dotColor: Colors.grey.shade400,
                dotHeight: 8,
                dotWidth: 8,
              ),
            ),
          ),

          /// **Get Started Button (only on the last page)**
          if (_currentPage == onboardingData.length - 1)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryBlack,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () async {
                    final tokenManager =
                        await ref.read(tokenManagerProvider.future);
                    await tokenManager
                        .setOnboardingCompleted(); // ✅ Simpan status onboarding selesai
                    context.goNamed(RouteName.login);
                  },
                  child: const Text(
                    "Get Started",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  /// **Reusable Onboarding Item Widget**
  Widget _buildOnboardingItem({
    required String title,
    required String description,
    // required String imagePath,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Image.asset(
        //   imagePath,
        //   width: 250,
        //   height: 250,
        //   fit: BoxFit.contain,
        // ),
        const SizedBox(height: 30),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColor.primaryBlack,
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

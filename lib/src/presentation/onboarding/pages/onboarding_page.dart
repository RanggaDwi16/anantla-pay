import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
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
  bool _joinWaitlist = false;

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Manage & Transfer Money\nEasily, Anytime!",
      "description":
          "Send receive and control your money effortlessly anytime and anywhere with just a few taps fast simple and hassle free",
    },
    {
      "title": "All Your Cards in One\nSecure Digital Wallet.",
      "description":
          "Securely store manage and access all your cards in one place for seamless payments with top-tier protection",
    },
    {
      "title": "Seamless Global\nTransfers, Anytime!",
      "description":
          "Send money worldwide effortlessly with low fees real-time exchange rates and top-tier security fast reliable hassle-free global transfers",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        showBackButton: false,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Center(
            child: SmoothPageIndicator(
              controller: _pageController,
              count: onboardingData.length,
              effect: CustomizableEffect(
                activeDotDecoration: DotDecoration(
                  width: 34,
                  height: 4,
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(2),
                ),
                dotDecoration: DotDecoration(
                  width: 34,
                  height: 4,
                  color: AppColor.primaryBlack,
                  borderRadius: BorderRadius.circular(2),
                ),
                spacing: 8,
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => context.goNamed(RouteName.login),
            child: const Text(
              "Skip >>",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController,
          onPageChanged: (index) => setState(() => _currentPage = index),
          itemCount: onboardingData.length,
          itemBuilder: (context, index) {
            final data = onboardingData[index];
            return _buildOnboardingItem(
              title: data['title']!,
              description: data['description']!,
              isLastPage: index == onboardingData.length - 1,
            );
          },
        ),
      ),
    );
  }

  Widget _buildOnboardingItem({
    required String title,
    required String description,
    required bool isLastPage,
  }) {
    return Column(
      children: [
        Expanded(
          flex: 6,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Center(
              child: Container(
                height: 460,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.grey.shade200,
                ),
                child: const Center(child: Text('Image Placeholder')),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                const Spacer(),
                if (isLastPage)
                  Row(
                    children: [
                      Checkbox(
                        value: _joinWaitlist,
                        onChanged: (value) =>
                            setState(() => _joinWaitlist = value ?? false),
                      ),
                      const Expanded(
                        child: Text(
                          "Join the waitlist. Check to be included.",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 16),
                Button.filled(
                  onPressed: () async {
                    if (isLastPage) {
                      final tokenManager =
                          await ref.read(tokenManagerProvider.future);
                      await tokenManager.setOnboardingCompleted();
                      context.goNamed(RouteName.login);
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  label: isLastPage ? "Get Started" : "Next",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

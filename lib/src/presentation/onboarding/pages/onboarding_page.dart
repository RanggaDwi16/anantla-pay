import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/main/controllers/auth/authentication_provider.dart';
import 'package:anantla_pay/src/core/provider/token_manager_provider.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
  bool _isChecked = true;
  void joinWaitlist() {
    ref.read(authenticationProvider.notifier).addWishList(
      onSuccess: (message) {
        // context.showCustomSnackBar('Berhasil bergabung dalam wishlist');
      },
      onError: (message) {
        // context.showCustomSnackBar('Gagal menambahkan wishlist');
      },
    );
  }

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Manage & Transfer Money\nEasily, Anytime!",
      "description":
          "Send, receive and control your money effortlessly anytime and anywhere with just a few taps, fast, simple and hassle-free.",
      "image": Assets.images.onboarding.onboarding1.path,
    },
    {
      "title": "All Your Cards in One\nSecure Digital Wallet.",
      "description":
          "Securely store, manage and access all your cards in one place for seamless payments with top-tier protection.",
      "image": Assets.images.onboarding.onboarding2.path,
    },
    {
      "title": "Seamless Global\nTransfers, Anytime!",
      "description":
          "Send money worldwide effortlessly with low fees, real-time exchange rates and top-tier security for fast, reliable, hassle-free global transfers.",
      "image": Assets.images.onboarding.onboarding3.path,
    },
    {
      "title": "Join the Waitlist",
      "description":
          "Be among the first to send money globally with real-time rates, minimal fees, and bank-level security—fast, simple, and built for your peace of mind.",
      "image": Assets.images.onboarding.onboarding4.path,
    },
  ];

  @override
  void initState() {
    super.initState();

    // Automatically change to the next page after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      if (_currentPage <= onboardingData.length) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentData = onboardingData[_currentPage];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        showBackButton: false,
        backgroundColor: Colors.white,
        leading: _currentPage == onboardingData.length - 1
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Center(
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: onboardingData.length - 1,
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
                        color: AppColor.textGray,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      spacing: 8,
                    ),
                  ),
                ),
              ),
        actions: _currentPage == onboardingData.length - 1
            ? []
            : [
                TextButton(
                  onPressed: () async {
                    final tokenManager =
                        await ref.read(tokenManagerProvider.future);
                    await tokenManager.setOnboardingCompleted();
                    context.goNamed(RouteName.login);
                  },
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
        child: Stack(
          children: [
            // PageView untuk gambar
            PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _currentPage = index);
                if (index == onboardingData.length - 1 && _isChecked) {
                  joinWaitlist();
                }
              },
              itemCount: onboardingData.length,
              itemBuilder: (context, index) {
                final data = onboardingData[index];
                return _buildOnboardingItem(
                  imagePath: data['image']!,
                  isLastPage: index == onboardingData.length - 1,
                );
              },
            ),

            // Konten bawah tetap
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _buildOnboardingContent(
                key: ValueKey(_currentPage),
                title: currentData['title']!,
                description: currentData['description']!,
                isLastPage: _currentPage == onboardingData.length - 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOnboardingItem({
    required String imagePath,
    required bool isLastPage,
  }) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.only(left: 40, right: 30),
        height: isLastPage
            ? MediaQuery.of(context).size.height * 0.5
            : MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget _buildOnboardingContent({
    required String title,
    required String description,
    required bool isLastPage,
    Key? key,
  }) {
    return Container(
      key: key,
      height: MediaQuery.of(context).size.height * 0.39,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title dengan Fade + Slide
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              final offsetAnimation = Tween<Offset>(
                begin: const Offset(0.0, 0.2), // dari bawah ke atas
                end: Offset.zero,
              ).animate(animation);
              return FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position: offsetAnimation,
                  child: child,
                ),
              );
            },
            child: Text(
              title,
              key: ValueKey(title),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),

          const SizedBox(height: 12),

// Description dengan Fade + Slide
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              final offsetAnimation = Tween<Offset>(
                begin: const Offset(0.0, 0.3),
                end: Offset.zero,
              ).animate(animation);
              return FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position: offsetAnimation,
                  child: child,
                ),
              );
            },
            child: Text(
              description,
              key: ValueKey(description),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 16,
                    color: AppColor.textSecondaryGray,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ),

          const Spacer(),
          if (isLastPage)
            Row(
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value ?? false;
                      if (_isChecked) joinWaitlist();
                    });
                  },
                  activeColor: AppColor.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  side: BorderSide(color: AppColor.primaryColor, width: 2),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Join the waitlist. Check to be included.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                )
              ],
            ),
          const Gap(20),
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
    );
  }
}

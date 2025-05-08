import 'package:anantla_pay/src/core/helpers/widgets/buttons.dart';
import 'package:anantla_pay/src/core/main/controllers/auth/authentication_provider.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:flutter/material.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class JoinWaitListPage extends ConsumerWidget {
  const JoinWaitListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isChecked = true; // Automatically checked on load

    // Function to add the user to the waitlist
    void joinWaitlist() {
      ref.read(authenticationProvider.notifier).addWishList(
        onSuccess: (message) {
          context.showCustomSnackBar('Successfully added wishlist');
        },
        onError: (message) {
          context.showCustomSnackBar('Failed to add wishlist');
        },
      );
    }

    // Automatically trigger the API after the widget is built
    Future.delayed(Duration.zero, () {
      joinWaitlist();
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Join the Waitlist',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColor.primaryBlack,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Be among the first to know when we launch!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColor.textSecondaryGray,
                ),
              ),
              const SizedBox(height: 32),

              // Large checkbox
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      // Update checkbox state and trigger the API
                      isChecked = value ?? false;
                      if (isChecked) {
                        joinWaitlist();
                      }
                    },
                    activeColor: AppColor.primaryColor,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    side: BorderSide(color: AppColor.primaryColor, width: 2),
                    splashRadius: 50.0, // For better visual feedback
                    visualDensity: VisualDensity.compact,
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Join the waitlist. Check to be included.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16),
        child: Button.filled(
          onPressed: () {
            context.goNamed(RouteName.login);
          },
          label: 'Move to Login',
        ),
      ),
    );
  }
}

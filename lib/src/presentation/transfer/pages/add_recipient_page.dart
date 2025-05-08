import 'package:anantla_pay/src/core/helpers/custom_app_bar.dart';
import 'package:anantla_pay/src/core/routers/router_name.dart';
import 'package:anantla_pay/src/core/utils/assets.gen.dart';
import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddRecipientPage extends StatelessWidget {
  const AddRecipientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centertitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: GestureDetector(
            onTap: () => context.pop(),
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: AppColor.secondaryBackground,
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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add a recipient',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 28,
                  ),
            ),
            const SizedBox(height: 24),
            RecipientItem(
              backgroundColor: Colors.black,
              borderColor: Colors.transparent,
              icon: Icons.person,
              title: 'Myself',
              onTap: () {
                // Aksi pilih Myself
                context.pushNamed(RouteName.addAccountMe);
              },
            ),
            const SizedBox(height: 20),
            RecipientItem(
              backgroundColor: Colors.white,
              borderColor: Colors.grey,
              icon: Icons.person_outline,
              title: 'Someone else',
              onTap: () {
                // Aksi pilih Someone else
                context.pushNamed(RouteName.addAccountOther);
              },
            ),
            const SizedBox(height: 20),
            RecipientItem(
              backgroundColor: Colors.white,
              borderColor: Colors.grey,
              icon: Icons.business_center_outlined,
              title: 'A business / organisation',
              onTap: () {
                context.pushNamed(RouteName.addAccountBusiness);
                // Aksi pilih Business
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RecipientItem extends StatelessWidget {
  final Color backgroundColor;
  final Color borderColor;
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const RecipientItem({
    super.key,
    required this.backgroundColor,
    required this.borderColor,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: borderColor, width: 2),
              ),
              child: CircleAvatar(
                radius: 24,
                backgroundColor: backgroundColor,
                child: Icon(
                  icon,
                  color: backgroundColor == Colors.black
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}

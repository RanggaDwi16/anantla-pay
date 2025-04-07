import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  List<Widget> actions;
  final Widget? customTitleWidget;
  Widget? leading;
  Color backgroundColor;
  Color textColor;
  IconThemeData iconTheme;

  PreferredSizeWidget? bottom;
  bool? centertitle;
  bool showBackButton;

  CustomAppBar({
    super.key,
    this.leading,
    this.title = "",
    this.customTitleWidget,
    this.centertitle = false,
    this.actions = const [],
    this.textColor = AppColor.primaryBlack,
    this.backgroundColor = AppColor.primaryWhite,
    this.iconTheme = const IconThemeData(color: Colors.white),
    this.bottom,
    this.showBackButton = true, // ✅ default true
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      automaticallyImplyLeading: showBackButton &&
          Navigator.of(context).canPop(), // ✅ kontrol tombol back
      surfaceTintColor: Colors.transparent,
      backgroundColor: backgroundColor,
      centerTitle: centertitle,
      iconTheme: iconTheme,
      title: customTitleWidget ??
          Text(
            title,
            style: TextStyle(
              color: textColor,
              fontSize: context.deviceWidth * 0.045,
              fontWeight: FontWeight.w600,
            ),
          ),
      actions: actions,
      bottom: bottom != null
          ? PreferredSize(
              preferredSize: const Size.fromHeight(48),
              child: Container(
                color: Colors.white,
                child: bottom,
              ),
            )
          : null,
    );
  }

  @override
  Size get preferredSize =>
      bottom == null ? const Size.fromHeight(56) : const Size.fromHeight(100);
}

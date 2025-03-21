import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  List<Widget> actions;
  Color backgroundColor;
  Color textColor;
  IconThemeData iconTheme;
  TabBar? bottom;
  

  CustomAppBar({
    super.key,
    this.title = "",
    this.actions = const [],
    this.textColor = AppColor.primaryBlack,
    this.backgroundColor = AppColor.primaryWhite,
    this.iconTheme = const IconThemeData(color: Colors.white),
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: backgroundColor,
      centerTitle: false,
      iconTheme: iconTheme,
      title: Text(
        title,
        style: TextStyle(
          color: textColor,
          fontSize: context.deviceWidth * 0.055,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: actions,
      bottom: bottom != null
          ? PreferredSize(
              preferredSize: const Size.fromHeight(48),
              child: Container(
                color: Colors.white, // Background color for TabBar
                child: bottom,
              ),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => bottom == null
      ? const Size.fromHeight(56)
      : const Size.fromHeight(100); // Adjust height for AppBar with TabBar
}

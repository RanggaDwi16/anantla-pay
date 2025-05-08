import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

enum ButtonStyle { filled, outlined }

class Button extends StatelessWidget {
  const Button.filled({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
    this.isPay = false,
    this.style = ButtonStyle.filled,
    this.color = AppColor.primaryColor,
    this.textColor = Colors.white,
    this.width = double.infinity,
    this.height = 48.0,
    this.borderColor = AppColor.primaryColor,
    this.borderRadius = 32,
    this.disabled = false,
    this.isActive = false,
    this.fontSize = 15.0,
    this.elevation = 0.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
  });

  const Button.outlined({
    super.key,
    required this.onPressed,
    this.label = "",
    this.icon,
    this.style = ButtonStyle.outlined,
    this.color = Colors.transparent,
    this.textColor = AppColor.primaryColor,
    this.width = double.infinity,
    this.height = 48.0,
    this.borderRadius = 32,
    this.borderColor = AppColor.primaryColor,
    this.disabled = false,
    this.isPay = false,
    this.isActive = false,
    this.fontSize = 14.0,
    this.elevation = 0.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
  });

  final Function() onPressed;
  final String label;
  final Widget? icon;
  final ButtonStyle style;
  final Color color;
  final Color textColor;
  final Color borderColor;
  final double width;
  final double height;
  final double borderRadius;
  final bool disabled;
  final bool isActive;
  final bool isPay;
  final double fontSize;
  final double elevation;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: style == ButtonStyle.filled
          ? ElevatedButton(
              onPressed: disabled ? null : onPressed,
              style: ElevatedButton.styleFrom(
                padding: padding,
                elevation: elevation,
                shape: isPay
                    ? RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(borderRadius),
                          bottomRight: Radius.circular(borderRadius),
                        ),
                      )
                    : RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(borderRadius),
                      ),
              ).copyWith(
                backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                  (Set<WidgetState> states) {
                    if (states.contains(WidgetState.disabled)) {
                      return AppColor.primaryGray;
                    }
                    return color;
                  },
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) icon!,
                  if (icon != null) const SizedBox(width: 10.0),
                  Text(
                    label,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: disabled ? AppColor.secondaryGray : textColor,
                          fontSize: fontSize,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
            )
          : OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                padding: padding,
                elevation: elevation,
                backgroundColor: color,
                foregroundColor: textColor,
                side: BorderSide(color: borderColor),
                shape: isPay
                    ? RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(borderRadius),
                          bottomRight: Radius.circular(borderRadius),
                        ),
                      )
                    : RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(borderRadius),
                      ),
              ),
              child: Center(
                child: icon ??
                    Text(
                      label,
                      style: TextStyle(
                        fontFamily: 'Helvetica Neue',
                        color: disabled ? AppColor.secondaryGray : textColor,
                        fontSize: fontSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
              ),
            ),
    );
  }
}

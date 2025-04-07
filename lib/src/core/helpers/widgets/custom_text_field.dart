import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? labelText;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? hintText;
  final bool? isLink;
  final bool? isCalendar;
  final bool? isDisabled;
  final bool? isRequired;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onTapIcon;
  final TextInputType? keyboardType;

  const CustomTextField({
    super.key,
    required this.controller,
    this.labelText,
    this.obscureText = false,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.isRequired = false,
    this.isLink = false,
    this.isCalendar = false,
    this.isDisabled = false,
    this.onTap,
    this.keyboardType = TextInputType.text,
    this.onTapIcon,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String? errorText;

  @override
  void initState() {
    super.initState();
    if (widget.isLink == true) {
      widget.controller.addListener(() {
        final text = widget.controller.text;
        setState(() {
          errorText = (text.isNotEmpty && !text.startsWith('https://'))
              ? 'Input link harus diawali dengan https://'
              : null;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.isRequired == true && widget.labelText != null)
          RichText(
            text: TextSpan(
              text: '${widget.labelText} ',
              style: textTheme.titleMedium?.copyWith(
                color: AppColor.primaryBlack,
              ),
              children: const [
                TextSpan(
                  text: '*',
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          )
        else if (widget.labelText != null)
          Text(
            widget.labelText!,
            style: textTheme.titleMedium?.copyWith(color: Colors.grey),
          ),
        const SizedBox(height: 8),
        TextField(
          controller: widget.controller,
          obscureText: widget.obscureText,
          readOnly: widget.isCalendar == true || widget.isDisabled == true,
          onTap: widget.onTap,
          keyboardType: widget.keyboardType,
          style: textTheme.bodyLarge?.copyWith(color: AppColor.primaryBlack),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: textTheme.bodyMedium?.copyWith(color: Colors.grey),
            filled: true,
            fillColor: widget.isDisabled == true
                ? const Color.fromARGB(255, 235, 235, 235)
                : const Color(0xFFF9F9F9),
            prefixIcon: widget.prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 12, right: 8),
                    child: widget.prefixIcon,
                  )
                : const SizedBox(width: 12),
            prefixIconConstraints:
                const BoxConstraints(minWidth: 0, minHeight: 0),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 0,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColor.primaryGray, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10),
            ),
            suffixIcon: (widget.isLink == true && widget.suffixIcon != null)
                ? GestureDetector(
                    onTap: widget.onTapIcon,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        color: AppColor.primaryBlack,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: widget.suffixIcon,
                    ),
                  )
                : widget.suffixIcon,
          ),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              errorText!,
              style: textTheme.bodySmall?.copyWith(color: Colors.red),
            ),
          ),
      ],
    );
  }
}

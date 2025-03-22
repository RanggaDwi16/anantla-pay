import 'package:anantla_pay/src/core/utils/constant/app_colors.dart';
import 'package:anantla_pay/src/core/utils/extensions/build_context.ext.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? labelText;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? hintText;
  final bool? isLink;
  final bool? isCalendar;
  final bool? isDisabled;
  final bool? isRequired;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onTapIcon;

  const CustomTextField({
    super.key,
    required this.controller,
    this.labelText,
    this.obscureText = false,
    this.hintText,
    this.suffixIcon,
    this.isRequired = false,
    this.isLink = false,
    this.isCalendar = false,
    this.isDisabled = false,
    this.onTap,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.isRequired == true && widget.labelText != null)
          RichText(
            text: TextSpan(
              text: '${widget.labelText} ',
              style:
                  const TextStyle(color: AppColor.primaryBlack, fontSize: 16),
              children: const <TextSpan>[
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
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        const SizedBox(height: 8),
        TextField(
          controller: widget.controller,
          obscureText: widget.obscureText,
          readOnly: widget.isCalendar == true || widget.isDisabled == true,
          onTap: widget.onTap,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: widget.isDisabled == true
                ? const Color.fromARGB(255, 235, 235, 235)
                : const Color(0xFFF9F9F9), // abu terang
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.primaryBlack),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColor.primaryBlack, width: 2),
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
                      constraints: BoxConstraints(
                        minHeight: context.deviceHeight * 0.07,
                        minWidth: context.deviceWidth * 0.15,
                      ),
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
        if (errorText !=
            null) // Tampilkan pesan kesalahan jika errorText tidak null
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              errorText!,
              style: const TextStyle(color: Colors.red, fontSize: 14),
            ),
          ),
      ],
    );
  }
}

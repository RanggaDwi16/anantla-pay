import 'package:flutter/material.dart';

class IconCircle extends StatelessWidget {
  final String imagePath;
  final VoidCallback? onTap;
  final double imageSize;

  const IconCircle({
    super.key,
    required this.imagePath,
    this.onTap,
    this.imageSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFFF5F5F5),
        ),
        child: Center(
          child: Image.asset(
            imagePath,
            width: imageSize,
            height: imageSize,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

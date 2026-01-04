import 'package:flutter/material.dart';

class ColoredBackButton extends StatelessWidget {
  const ColoredBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        width: 36,
        height: 36,
        decoration: const BoxDecoration(
          color: Color(0xFF1E88E5),
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.arrow_back, color: Colors.white),
      ),
    );
  }
}

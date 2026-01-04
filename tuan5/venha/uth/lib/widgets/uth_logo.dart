import 'package:flutter/material.dart';

class UthLogo extends StatelessWidget {
  const UthLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/logo.png',
          height: 70,
        ),
        const SizedBox(height: 6),
        const Text(
          "SmartTasks",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF1E88E5),
          ),
        ),
      ],
    );
  }
}

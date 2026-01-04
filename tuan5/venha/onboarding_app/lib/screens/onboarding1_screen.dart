import 'package:flutter/material.dart';
import '../widgets/onboarding_page.dart';
import 'onboarding2_screen.dart';

class Onboarding1Screen extends StatelessWidget {
  const Onboarding1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingPage(
      image: 'assets/images/img1.png',
      title: 'Easy Time Management',
      description:
      'With management based on priority and daily tasks, it will give you convenience in managing and tracking your work.',
      buttonText: 'Next',
      onNext: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const Onboarding2Screen()),
        );
      },
    );
  }
}

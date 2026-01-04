import 'package:flutter/material.dart';
import '../widgets/onboarding_page.dart';
import 'onboarding3_screen.dart';

class Onboarding2Screen extends StatelessWidget {
  const Onboarding2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingPage(
      image: 'assets/images/img2.png',
      title: 'Increase Work Effectiveness',
      description:
      'Time management and collaboration will help you improve effectiveness and productivity in daily work.',
      buttonText: 'Next',
      onBack: () => Navigator.pop(context),
      onNext: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const Onboarding3Screen()),
        );
      },
    );
  }
}

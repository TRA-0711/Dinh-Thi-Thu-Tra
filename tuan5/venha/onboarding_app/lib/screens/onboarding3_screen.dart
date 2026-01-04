import 'package:flutter/material.dart';
import '../widgets/onboarding_page.dart';

class Onboarding3Screen extends StatelessWidget {
  const Onboarding3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingPage(
      image: 'assets/images/img3.png',
      title: 'Reminder Notification',
      description:
      'The advantage of this application is that it provides reminders to you so you don’t forget to work on time.',
      buttonText: 'Get Started',
      onBack: () => Navigator.pop(context),
      onNext: () {
        // TODO: HomeScreen
      },
    );
  }
}

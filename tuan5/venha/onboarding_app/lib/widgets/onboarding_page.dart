import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final VoidCallback onNext;
  final VoidCallback? onBack;
  final String buttonText;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.onNext,
    this.onBack,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: onBack != null
            ? IconButton(
          icon: const Icon(Icons.arrow_back_ios,
              color: AppColors.primaryBlue),
          onPressed: onBack,
        )
            : null,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.more_horiz,
                color: AppColors.primaryBlue),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Image.asset(image, height: 260),
            const SizedBox(height: 32),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.grey,
                height: 1.5,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                if (onBack != null)
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: AppColors.lightBlue,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back,
                          color: AppColors.primaryBlue),
                      onPressed: onBack,
                    ),
                  ),
                const Spacer(),
                ElevatedButton(
                  onPressed: onNext,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 36, vertical: 14),
                  ),
                  child: Text(buttonText),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

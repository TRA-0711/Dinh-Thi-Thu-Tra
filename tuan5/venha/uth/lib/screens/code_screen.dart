import 'package:flutter/material.dart';
import '../widgets/uth_logo.dart';
import '../widgets/back_button.dart';
import '../widgets/otp_input.dart';
import 'password_screen.dart';

class CodeScreen extends StatelessWidget {
  final String email;
  CodeScreen({super.key, required this.email});

  String code = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Align(
              alignment: Alignment.centerLeft,
              child: ColoredBackButton(),
            ),
            const SizedBox(height: 24),
            const UthLogo(),
            const SizedBox(height: 32),
            const Text(
              "Verify Code",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "We just sent you a verification code via Email",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            OtpInput(
              onCompleted: (value) {
                code = value;
              },
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E88E5),
                minimumSize: const Size(double.infinity, 48),
              ),
              onPressed: () {
                if (code.length == 5) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PasswordScreen(
                        email: email,
                        code: code,
                      ),
                    ),
                  );
                }
              },
              child: const Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}

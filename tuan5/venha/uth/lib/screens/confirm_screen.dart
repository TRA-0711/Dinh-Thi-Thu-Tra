import 'package:flutter/material.dart';
import '../widgets/uth_logo.dart';
import 'email_screen.dart';

class ConfirmScreen extends StatelessWidget {
  final String email;
  final String code;
  final String password;

  const ConfirmScreen({
    super.key,
    required this.email,
    required this.code,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const UthLogo(),
            const SizedBox(height: 32),
            const Text(
              "Confirm",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Text(" Email: $email"),
            Text(" Code: $code"),
            Text(" Password: $password"),
            const SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E88E5),
                minimumSize: const Size(double.infinity, 48),
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const EmailScreen()),
                      (route) => false,
                );
              },
              child: const Text("Submit"),
            )
          ],
        ),
      ),
    );
  }
}

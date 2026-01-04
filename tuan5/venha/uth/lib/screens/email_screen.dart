import 'package:flutter/material.dart';
import '../widgets/uth_logo.dart';
import 'code_screen.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isValidEmail(String email) {
    return RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$').hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const UthLogo(),
              const SizedBox(height: 32),
              const Text(
                "Forgot Password?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Enter your email, we will send you a verification code",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: "Your Email",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || !isValidEmail(value)) {
                    return "Email không hợp lệ";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E88E5),
                  minimumSize: const Size(double.infinity, 48),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            CodeScreen(email: emailController.text),
                      ),
                    );
                  }
                },
                child: const Text("Next"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

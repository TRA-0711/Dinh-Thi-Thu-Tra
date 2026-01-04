import 'package:flutter/material.dart';
import '../widgets/uth_logo.dart';
import '../widgets/back_button.dart';
import 'confirm_screen.dart';

class PasswordScreen extends StatefulWidget {
  final String email;
  final String code;

  const PasswordScreen({
    super.key,
    required this.email,
    required this.code,
  });

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final pass1 = TextEditingController();
  final pass2 = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: formKey,
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
                "Create new password",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: pass1,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: pass2,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Confirm Password",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value != pass1.text) {
                    return "Password không khớp";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
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
                        builder: (_) => ConfirmScreen(
                          email: widget.email,
                          code: widget.code,
                          password: pass1.text,
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
      ),
    );
  }
}

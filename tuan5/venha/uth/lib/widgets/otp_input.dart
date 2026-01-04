import 'package:flutter/material.dart';

class OtpInput extends StatefulWidget {
  final Function(String) onCompleted;
  const OtpInput({super.key, required this.onCompleted});

  @override
  State<OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput> {
  final List<TextEditingController> controllers =
  List.generate(5, (_) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(5, (index) {
        return SizedBox(
          width: 50,
          child: TextField(
            controller: controllers[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            decoration: const InputDecoration(
              counterText: "",
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              if (value.isNotEmpty && index < 4) {
                FocusScope.of(context).nextFocus();
              }
              final code = controllers.map((c) => c.text).join();
              if (code.length == 5) {
                widget.onCompleted(code);
              }
            },
          ),
        );
      }),
    );
  }
}

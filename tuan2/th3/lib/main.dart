import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ThucHanh03Screen(),
    );
  }
}

class ThucHanh03Screen extends StatefulWidget {
  const ThucHanh03Screen({super.key});

  @override
  State<ThucHanh03Screen> createState() => _ThucHanh03ScreenState();
}

class _ThucHanh03ScreenState extends State<ThucHanh03Screen> {
  final TextEditingController _soAController = TextEditingController();
  final TextEditingController _soBController = TextEditingController();

  String ketQua = "";

  void tinhToan(String phepToan) {
    final double? a = double.tryParse(_soAController.text);
    final double? b = double.tryParse(_soBController.text);

    if (a == null || b == null) {
      setState(() {
        ketQua = "Vui lòng nhập số hợp lệ";
      });
      return;
    }

    double result;

    switch (phepToan) {
      case '+':
        result = a + b;
        break;
      case '-':
        result = a - b;
        break;
      case '×':
        result = a * b;
        break;
      case '÷':
        if (b == 0) {
          setState(() {
            ketQua = "Không chia cho 0";
          });
          return;
        }
        result = a / b;
        break;
      default:
        return;
    }

    setState(() {
      ketQua = "Kết quả: $result";
    });
  }

  Widget nutPhepToan(String text, Color color) {
    return ElevatedButton(
      onPressed: () => tinhToan(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Thực hành 03"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _soAController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Số A",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _soBController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Số B",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                nutPhepToan('+', Colors.red),
                nutPhepToan('-', Colors.orange),
                nutPhepToan('×', Colors.purple),
                nutPhepToan('÷', Colors.black),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              ketQua,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

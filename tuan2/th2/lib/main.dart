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
      home: Practice02Screen(),
    );
  }
}

class Practice02Screen extends StatefulWidget {
  const Practice02Screen({super.key});

  @override
  State<Practice02Screen> createState() => _Practice02ScreenState();
}

class _Practice02ScreenState extends State<Practice02Screen> {
  final TextEditingController _controller = TextEditingController();
  List<int> numbers = [];
  String errorMessage = "";

  void createList() {
    setState(() {
      numbers.clear();
      errorMessage = "";

      final input = int.tryParse(_controller.text);

      if (input == null || input <= 0) {
        errorMessage = "Dữ liệu bạn nhập không hợp lệ";
        return;
      }

      numbers = List.generate(input, (index) => index + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Thực hành 02"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
        Row(
        children: [
        Expanded(
        child: TextField(
          controller: _controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            hintText: "Nhập vào số lượng",
            border: OutlineInputBorder(),
          ),
        ),
      ),
      const SizedBox(width: 8),
      ElevatedButton(
        onPressed: createList,
        child: const Text("Tạo"),
      ),
      ],
    ),

    const SizedBox(height: 10),

    if (errorMessage.isNotEmpty)
    Text(
    errorMessage,
    style: const TextStyle(color: Colors.red),
    ),

    const SizedBox(height: 10),

    Expanded(
    child: ListView.builder(
    itemCount: numbers.length,
    itemBuilder: (context, index) {
    return Container(
    margin: const EdgeInsets.symmetric(vertical: 5),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
    color: Colors.red,
    borderRadius: BorderRadius.circular(20),
    ),
    child: Center(
    child: Text(
    numbers[index].toString(),
    style: const TextStyle(
    color: Colors.white,
    fontSize: 18,
    ),
    ),
    ),
    );
    },
    ),
    ),
          ],
        ),
      ),
    );
  }
}
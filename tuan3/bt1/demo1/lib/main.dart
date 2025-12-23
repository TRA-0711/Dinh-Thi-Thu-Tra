import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// App gốc
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NullableDemoScreen(),
    );
  }
}

/// Màn hình minh họa Nullable
class NullableDemoScreen extends StatefulWidget {
  const NullableDemoScreen({super.key});

  @override
  State<NullableDemoScreen> createState() => _NullableDemoScreenState();
}

class _NullableDemoScreenState extends State<NullableDemoScreen> {
  // 1️⃣ Biến nullable
  String? nullableName;

  // 2️⃣ Biến non-nullable
  String nonNullableName = "Flutter";

  // 3️⃣ Controller nullable
  TextEditingController? controller;

  // 4️⃣ List nullable
  List<String?> names = ["An", null, "Bình"];

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nullable Demo"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔹 Nullable variable
            Text(
              "1. String? nullableName = ${nullableName ?? "null"}",
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 10),

            /// 🔹 Null coalescing ??
            Text(
              "2. nullableName ?? 'Default' = ${nullableName ?? "Default"}",
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 10),

            /// 🔹 Safe call ?.
            Text(
              "3. nullableName?.length = ${nullableName?.length}",
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            /// 🔹 TextField nullable
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: "Nhập tên (nullable)",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  nullableName = controller?.text;
                });
              },
              child: const Text("Gán vào nullableName"),
            ),

            const SizedBox(height: 20),

            /// 🔹 Force unwrap !
            Text(
              "4. Dùng ! (chỉ khi chắc chắn không null):",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              nullableName != null
                  ? "nullableName!.length = ${nullableName!.length}"
                  : "nullableName đang null ❌",
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            /// 🔹 Nullable trong List
            const Text(
              "5. List<String?>:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: names.map((e) {
                return Text("• ${e ?? "null"}");
              }).toList(),
            ),

            const SizedBox(height: 20),

            /// 🔹 So sánh nullable vs non-nullable
            Text(
              "6. Non-nullable luôn có giá trị: $nonNullableName",
              style: const TextStyle(fontSize: 16, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}

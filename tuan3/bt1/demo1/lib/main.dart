import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// =====================
/// APP CHÍNH
/// =====================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nullable Demo',
      home: const UserScreen(),
    );
  }
}

/// =====================
/// MODEL: USER
/// =====================
class User {
  String name;        // non-nullable
  int? age;           // nullable
  String? email;      // nullable

  User({
    required this.name,
    this.age,
    this.email,
  });
}

/// =====================
/// SCREEN
/// =====================
class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Danh sách user (có và không có dữ liệu)
    List<User> users = [
      User(name: 'An', age: 20, email: 'an@gmail.com'),
      User(name: 'Bình'), // age & email = null
      User(name: 'Chi', age: 22),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo Nullable'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          User user = users[index];

          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(user.name),

              // ?? → giá trị mặc định khi null
              subtitle: Text(
                'Tuổi: ${user.age ?? "Chưa cập nhật"}\n'
                    'Email: ${user.email ?? "Chưa có email"}',
              ),

              // Demo toán tử !
              trailing: IconButton(
                icon: const Icon(Icons.info),
                onPressed: () {
                  showUserAge(context, user.age);
                },
              ),
            ),
          );
        },
      ),
    );
  }

  /// =====================
  /// DEMO TOÁN TỬ !
  /// =====================
  void showUserAge(BuildContext context, int? age) {
    String message;

    if (age != null) {
      // age! → cam kết không null
      message = 'Tuổi người dùng là ${age!}';
    } else {
      message = 'Người dùng chưa cập nhật tuổi';
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

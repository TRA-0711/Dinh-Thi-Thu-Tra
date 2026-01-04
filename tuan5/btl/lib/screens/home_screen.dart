import 'package:flutter/material.dart';
import 'column_screen.dart';
import 'lazy_column_screen.dart';
import '../widgets/menu_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Column vs LazyColumn'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Test tạo 1.000.000 phần tử',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),

            /// Button Column
            MenuButton(
              title: 'Column (1.000.000 items)',
              color: Colors.pink,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ColumnScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            /// Button LazyColumn
            MenuButton(
              title: 'LazyColumn (1.000.000 items)',
              color: Colors.blue,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const LazyColumnScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

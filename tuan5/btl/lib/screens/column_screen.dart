import 'package:flutter/material.dart';

class ColumnScreen extends StatelessWidget {
  const ColumnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('Column - 1.000.000 items'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            1_000_000,
                (index) => Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerLeft,
              child: Text('Item $index'),
            ),
          ),
        ),
      ),
    );
  }
}

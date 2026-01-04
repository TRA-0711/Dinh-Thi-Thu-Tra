import 'package:flutter/material.dart';

class LazyColumnScreen extends StatelessWidget {
  const LazyColumnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('LazyColumn - 1.000.000 items'),
      ),
      body: ListView.builder(
        itemCount: 1_000_000,
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: Text('Item $index'),
          );
        },
      ),
    );
  }
}

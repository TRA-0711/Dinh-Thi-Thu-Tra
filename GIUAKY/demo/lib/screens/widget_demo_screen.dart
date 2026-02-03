import 'package:flutter/material.dart';
import '../widgets/info_card.dart';
import '../widgets/counter_card.dart';

class WidgetDemoScreen extends StatelessWidget {
  const WidgetDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.pink.shade400,
        title: const Text(
          'Chapter 4 : Widget',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            InfoCard(),
            SizedBox(height: 20),
            CounterCard(),
          ],
        ),
      ),
    );
  }
}

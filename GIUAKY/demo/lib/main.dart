import 'package:flutter/material.dart';
import 'screens/widget_demo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chapter 4 - Widget',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.pink,
        fontFamily: 'Roboto',
      ),
      home: const WidgetDemoScreen(),
    );
  }
}

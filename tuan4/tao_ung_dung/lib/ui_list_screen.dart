import 'package:flutter/material.dart';
import 'detail_screen.dart';

class UIListScreen extends StatelessWidget {
  const UIListScreen({super.key});

  final List<String> components = const [
    'Text',
    'RichText',
    'Image',
    'Icon',
    'Container',
    'Row',
    'Column',
    'ElevatedButton',
    'TextField',
    'Checkbox',
    'Switch',
    'Slider',
    'ListView',
    'Card',
    'Stack',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Components List')),
      body: ListView.builder(
        itemCount: components.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(components[index]),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailScreen(component: components[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

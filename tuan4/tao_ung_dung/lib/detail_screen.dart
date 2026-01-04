import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String component;
  const DetailScreen({super.key, required this.component});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(component)),
      body: SingleChildScrollView( // ✅ THÊM SCROLL Ở ĐÂY
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: getComponentDemo(component),
        ),
      ),
    );
  }

  Widget getComponentDemo(String name) {
    switch (name) {

      case 'Text':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Text'),
            SizedBox(height: 10),
            Text('Tra ne', style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),
            Text('hihi', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('huuhu', style: TextStyle(color: Colors.blue)),
          ],
        );

      case 'RichText':
        return RichText(
          text: const TextSpan(
            style: TextStyle(color: Colors.black, fontSize: 18),
            children: [
              TextSpan(text: 'The quick '),
              TextSpan(text: 'Brown ', style: TextStyle(color: Colors.orange)),
              TextSpan(text: 'fox jumps '),
              TextSpan(
                text: 'over',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
              TextSpan(text: ' the lazy dog'),
            ],
          ),
        );

      case 'Image':
        return Center(
          child: Image.network(
            'https://flutter.dev/images/flutter-logo-sharing.png',
            width: 150,
          ),
        );

      case 'Icon':
        return const Center(
          child: Icon(Icons.favorite, size: 80, color: Colors.red),
        );

      case 'Container':
        return Container(
          width: 200,
          height: 100,
          color: Colors.blue,
          alignment: Alignment.center,
          child: const Text(
            'Container',
            style: TextStyle(color: Colors.white),
          ),
        );

      case 'Row':
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
          ],
        );

      case 'Column':
        return Column(
          children: const [
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
          ],
        );

      case 'ElevatedButton':
        return Center(
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Nhấn vào đây'),
          ),
        );

      case 'TextField':
        return const TextField(
          decoration: InputDecoration(
            labelText: 'Nhập nội dung',
            border: OutlineInputBorder(),
          ),
        );

      case 'Checkbox':
        return StatefulBuilder(
          builder: (context, setState) {
            bool checked = false;
            return CheckboxListTile(
              title: const Text('Checkbox'),
              value: checked,
              onChanged: (value) {
                setState(() => checked = value!);
              },
            );
          },
        );

      case 'Switch':
        return StatefulBuilder(
          builder: (context, setState) {
            bool on = false;
            return SwitchListTile(
              title: const Text('Switch'),
              value: on,
              onChanged: (value) {
                setState(() => on = value);
              },
            );
          },
        );

      case 'Slider':
        return StatefulBuilder(
          builder: (context, setState) {
            double value = 50;
            return Column(
              children: [
                Text('Giá trị: ${value.toInt()}'),
                Slider(
                  value: value,
                  min: 0,
                  max: 100,
                  onChanged: (v) {
                    setState(() => value = v);
                  },
                ),
              ],
            );
          },
        );

      case 'ListView':
        return SizedBox(
          height: 200,
          child: ListView(
            children: const [
              ListTile(title: Text('Item 1')),
              ListTile(title: Text('Item 2')),
              ListTile(title: Text('Item 3')),
            ],
          ),
        );

      case 'Card':
        return Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: const Text('Card Widget'),
          ),
        );

      case 'Stack':
        return SizedBox(
          width: 150,
          height: 150,
          child: Stack(
            children: [
              Container(color: Colors.blue),
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        );

      default:
        return const Text('No demo available');
    }
  }
}

import 'package:flutter/material.dart';

class AssetsScreen extends StatelessWidget {
  const AssetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("الأصول")),
      body: ListView(
        children: const [
          ListTile(title: Text("نقد"), trailing: Text("1000 ر.س")),
          ListTile(title: Text("ذهب"), trailing: Text("5000 ر.س")),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
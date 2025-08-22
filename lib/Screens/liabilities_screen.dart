import 'package:flutter/material.dart';

class LiabilitiesScreen extends StatelessWidget {
  const LiabilitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("الخصوم")),
      body: ListView(
        children: const [
          ListTile(title: Text("قرض شخصي"), trailing: Text("2000 ر.س")),
          ListTile(title: Text("بطاقة ائتمان"), trailing: Text("1500 ر.س")),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
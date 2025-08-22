import 'package:flutter/material.dart';

class BudgetScreen extends StatelessWidget {
  const BudgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("الميزانية")),
      body: ListView(
        children: const [
          ListTile(
            title: Text("طعام"),
            subtitle: LinearProgressIndicator(value: 0.5),
            trailing: Text("500 / 1000 ر.س"),
          ),
          ListTile(
            title: Text("نقل"),
            subtitle: LinearProgressIndicator(value: 0.2),
            trailing: Text("100 / 500 ر.س"),
          ),
        ],
      ),
    );
  }
}
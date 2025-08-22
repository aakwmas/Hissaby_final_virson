import 'package:flutter/material.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("المعاملات")),
      body: ListView.builder(
        itemCount: 10, // بيانات وهمية
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("عملية ${index + 1}"),
            subtitle: const Text("الفئة: طعام"),
            trailing: Text("-50 ر.س"),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class AddEditTransactionScreen extends StatelessWidget {
  final bool isEdit;
  const AddEditTransactionScreen({super.key, this.isEdit = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? "تعديل معاملة" : "إضافة معاملة")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(decoration: const InputDecoration(labelText: "المبلغ")),
            TextField(decoration: const InputDecoration(labelText: "الفئة")),
            TextField(decoration: const InputDecoration(labelText: "الملاحظات")),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text(isEdit ? "حفظ التعديلات" : "إضافة"),
            ),
          ],
        ),
      ),
    );
  }
}
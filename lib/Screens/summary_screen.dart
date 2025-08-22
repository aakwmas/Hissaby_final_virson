import 'package:flutter/material.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("الملخص")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: const Text("الرصيد الشهري"),
                subtitle: const Text("الدخل − المصروفات"),
                trailing: Text("0 ر.س"),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text("صافي الثروة"),
                subtitle: const Text("الأصول − الخصوم"),
                trailing: Text("0 ر.س"),
              ),
            ),
            const SizedBox(height: 20),
            const Text("مخطط المصروفات حسب الفئة (قريباً)"),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text("+ دخل")),
                ElevatedButton(onPressed: () {}, child: const Text("+ مصروف")),
                ElevatedButton(onPressed: () {}, child: const Text("+ أصل")),
                ElevatedButton(onPressed: () {}, child: const Text("+ خصم")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
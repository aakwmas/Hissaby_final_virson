import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  final double income;
  final double expense;

  const BalanceCard({super.key, required this.income, required this.expense});

  @override
  Widget build(BuildContext context) {
    double balance = income - expense;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text("الرصيد الشهري"),
            Text(
              "$balance",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
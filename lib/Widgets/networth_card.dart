import 'package:flutter/material.dart';

class NetWorthCard extends StatelessWidget {
  final double assets;
  final double liabilities;

  const NetWorthCard({super.key, required this.assets, required this.liabilities});

  @override
  Widget build(BuildContext context) {
    double netWorth = assets - liabilities;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text("صافي الثروة"),
            Text(
              "$netWorth",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
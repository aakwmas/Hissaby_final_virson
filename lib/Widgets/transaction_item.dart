import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final String title;
  final double amount;
  final String type;

  const TransactionItem({
    super.key,
    required this.title,
    required this.amount,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        type == 'income' ? Icons.arrow_downward : Icons.arrow_upward,
        color: type == 'income' ? Colors.green : Colors.red,
      ),
      title: Text(title),
      trailing: Text(
        "$amount",
        style: TextStyle(
          color: type == 'income' ? Colors.green : Colors.red,
        ),
      ),
    );
  }
}
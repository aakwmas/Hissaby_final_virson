import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../providers/transaction_provider.dart';
import '../models/transaction.dart';

class ExpenseChart extends StatelessWidget {
  const ExpenseChart({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = context.watch<TransactionProvider>().transactions;

    // فلترة فقط المصروفات
    final expenses = transactions.where((t) => t.type == TransactionType.expense).toList();

    // تجميع المبالغ حسب الفئة
    final Map<String, double> dataMap = {};
    for (var tx in expenses) {
      dataMap[tx.categoryId] = (dataMap[tx.categoryId] ?? 0) + tx.amount;
    }

    // تحويل البيانات لسلسلة charts
    final data = dataMap.entries
        .map((e) => ExpenseSeries(category: e.key, amount: e.value))
        .toList();

    final series = [
      charts.Series<ExpenseSeries, String>(
        id: 'Expenses',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (ExpenseSeries exp, _) => exp.category,
        measureFn: (ExpenseSeries exp, _) => exp.amount,
        data: data,
        labelAccessorFn: (ExpenseSeries exp, _) => '${exp.amount.toStringAsFixed(0)}',
      )
    ];

    return Card(
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "المصروفات حسب الفئة",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 200, child: _ChartContainer()),
            SizedBox(
              height: 200,
              child: charts.BarChart(
                series,
                animate: true,
                vertical: true,
                barRendererDecorator: charts.BarLabelDecorator<String>(),
                domainAxis: const charts.OrdinalAxisSpec(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpenseSeries {
  final String category;
  final double amount;

  ExpenseSeries({required this.category, required this.amount});
}

class _ChartContainer extends StatelessWidget {
  const _ChartContainer();

  @override
  Widget build(BuildContext context) {
    return Container(); // مجرد حاوية فارغة للتحكم في الحجم
  }
}
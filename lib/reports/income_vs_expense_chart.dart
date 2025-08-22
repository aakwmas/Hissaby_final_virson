import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../providers/transaction_provider.dart';
import '../models/transaction.dart';

class IncomeVsExpenseChart extends StatelessWidget {
  const IncomeVsExpenseChart({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = context.watch<TransactionProvider>().transactions;

    // تجميع حسب الشهر
    final Map<String, double> incomeMap = {};
    final Map<String, double> expenseMap = {};

    for (var tx in transactions) {
      final monthKey = "${tx.date.year}-${tx.date.month.toString().padLeft(2, '0')}";
      if (tx.type == TransactionType.income) {
        incomeMap[monthKey] = (incomeMap[monthKey] ?? 0) + tx.amount;
      } else {
        expenseMap[monthKey] = (expenseMap[monthKey] ?? 0) + tx.amount;
      }
    }

    final allMonths = {...incomeMap.keys, ...expenseMap.keys}.toList()..sort();

    final incomeData = allMonths
        .map((m) => TimeSeriesAmount(
              month: m,
              amount: incomeMap[m] ?? 0,
            ))
        .toList();

    final expenseData = allMonths
        .map((m) => TimeSeriesAmount(
              month: m,
              amount: expenseMap[m] ?? 0,
            ))
        .toList();

    final series = [
      charts.Series<TimeSeriesAmount, String>(
        id: 'Income',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (TimeSeriesAmount amt, _) => amt.month,
        measureFn: (TimeSeriesAmount amt, _) => amt.amount,
        data: incomeData,
      ),
      charts.Series<TimeSeriesAmount, String>(
        id: 'Expense',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (TimeSeriesAmount amt, _) => amt.month,
        measureFn: (TimeSeriesAmount amt, _) => amt.amount,
        data: expenseData,
      ),
    ];

    return Card(
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "الدخل مقابل المصروف",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 250,
              child: charts.LineChart(
                series,
                animate: true,
                defaultRenderer: charts.LineRendererConfig(includePoints: true),
                behaviors: [
                  charts.SeriesLegend(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TimeSeriesAmount {
  final String month;
  final double amount;

  TimeSeriesAmount({required this.month, required this.amount});
}
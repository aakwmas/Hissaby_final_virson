import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../providers/transaction_provider.dart';
import '../providers/asset_provider.dart';
import '../providers/liability_provider.dart';

class NetWorthChart extends StatelessWidget {
  const NetWorthChart({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = context.watch<TransactionProvider>().transactions;
    final assets = context.watch<AssetProvider>().assets;
    final liabilities = context.watch<LiabilityProvider>().liabilities;

    // تجميع حسب الشهر: الأصول - الخصوم
    final Map<String, double> netWorthMap = {};

    for (var tx in transactions) {
      final monthKey = "${tx.date.year}-${tx.date.month.toString().padLeft(2, '0')}";
      netWorthMap[monthKey] = (netWorthMap[monthKey] ?? 0);
    }

    for (var asset in assets) {
      final monthKey = "${asset.lastValuationDate.year}-${asset.lastValuationDate.month.toString().padLeft(2, '0')}";
      netWorthMap[monthKey] = (netWorthMap[monthKey] ?? 0) + asset.value;
    }

    for (var liability in liabilities) {
      final monthKey = "${liability.dueDay != null ? DateTime.now().year : DateTime.now().year}"
          "-${liability.dueDay != null ? DateTime.now().month.toString().padLeft(2, '0') : DateTime.now().month.toString().padLeft(2, '0')}";
      netWorthMap[monthKey] = (netWorthMap[monthKey] ?? 0) - liability.balance;
    }

    final sortedMonths = netWorthMap.keys.toList()..sort();

    final data = sortedMonths
        .map((m) => TimeSeriesValue(
              month: m,
              value: netWorthMap[m] ?? 0,
            ))
        .toList();

    final series = [
      charts.Series<TimeSeriesValue, String>(
        id: 'NetWorth',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesValue val, _) => val.month,
        measureFn: (TimeSeriesValue val, _) => val.value,
        data: data,
      ),
    ];

    return Card(
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "تطور صافي الثروة",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 250,
              child: charts.LineChart(
                series,
                animate: true,
                defaultRenderer: charts.LineRendererConfig(includePoints: true),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TimeSeriesValue {
  final String month;
  final double value;

  TimeSeriesValue({required this.month, required this.value});
}
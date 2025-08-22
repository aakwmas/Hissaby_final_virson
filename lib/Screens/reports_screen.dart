import 'package:flutter/material.dart';
import '../reports/expense_chart.dart';
import '../reports/income_expense_chart.dart';
import '../reports/net_worth_chart.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("التقارير"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            ExpenseChart(),       // 1. مصروفات حسب الفئة
            IncomeExpenseChart(), // 2. دخل مقابل مصروف
            NetWorthChart(),      // 3. تطور صافي الثروة
          ],
        ),
      ),
    );
  }
}
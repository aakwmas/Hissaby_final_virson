import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/transaction_provider.dart';
import '../widgets/summary_card.dart';
import '../widgets/expense_chart.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final transactionProvider = Provider.of<TransactionProvider>(context);

    // حساب القيم
    final monthlyBalance = transactionProvider.getMonthlyBalance();
    final netWorth = transactionProvider.getNetWorth();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ملخص",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // بطاقة الرصيد الشهري
            SummaryCard(
              title: "الرصيد الشهري",
              value: monthlyBalance,
              currency: "ر.س", // يمكنك تغييره حسب الإعدادات
              color: Colors.blueAccent,
            ),

            SizedBox(height: 12),

            // بطاقة صافي الثروة
            SummaryCard(
              title: "صافي الثروة",
              value: netWorth,
              currency: "ر.س",
              color: Colors.green,
            ),

            SizedBox(height: 20),

            // الرسم البياني للمصروفات حسب الفئة
            if (transactionProvider.transactions.isEmpty)
              Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    "لا توجد بيانات بعد.\nأضف أول مصروف أو دخل لبدء التتبع.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                  ),
                ),
              )
            else
              ExpenseChart(transactions: transactionProvider.transactions),
          ],
        ),
      ),

      // زر الإضافة
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-transaction');
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
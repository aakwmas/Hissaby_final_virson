import '../models/transaction.dart';

class TransactionService {
  final List<Transaction> _transactions = [];

  List<Transaction> get transactions => _transactions;

  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);
  }

  void removeTransaction(Transaction transaction) {
    _transactions.remove(transaction);
  }

  double get totalIncome {
    return _transactions
        .where((t) => t.amount > 0)
        .fold(0, (sum, t) => sum + t.amount);
  }

  double get totalExpense {
    return _transactions
        .where((t) => t.amount < 0)
        .fold(0, (sum, t) => sum + t.amount);
  }

  double get balance {
    return totalIncome + totalExpense;
  }
}
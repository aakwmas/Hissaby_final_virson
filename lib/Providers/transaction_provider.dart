import 'package:flutter/foundation.dart';
import '../models/transaction.dart';
import '../services/transaction_service.dart';
import '../services/storage_service.dart';

class TransactionProvider with ChangeNotifier {
  final TransactionService _transactionService = TransactionService();
  final StorageService _storageService = StorageService();

  List<Transaction> get transactions => _transactionService.transactions;
  double get totalIncome => _transactionService.totalIncome;
  double get totalExpense => _transactionService.totalExpense;
  double get balance => _transactionService.balance;

  Future<void> addTransaction(Transaction transaction) async {
    _transactionService.addTransaction(transaction);
    await _storageService.saveTransactions(transactions);
    notifyListeners();
  }

  Future<void> removeTransaction(Transaction transaction) async {
    _transactionService.removeTransaction(transaction);
    await _storageService.saveTransactions(transactions);
    notifyListeners();
  }

  Future<void> loadTransactions() async {
    final loadedTransactions = await _storageService.loadTransactions();
    for (var t in loadedTransactions) {
      _transactionService.addTransaction(t);
    }
    notifyListeners();
  }
}
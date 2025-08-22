import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/transaction.dart';

class StorageService {
  static const String _key = 'transactions';

  Future<void> saveTransactions(List<Transaction> transactions) async {
    final prefs = await SharedPreferences.getInstance();
    final String encoded =
        jsonEncode(transactions.map((t) => t.toJson()).toList());
    await prefs.setString(_key, encoded);
  }

  Future<List<Transaction>> loadTransactions() async {
    final prefs = await SharedPreferences.getInstance();
    final String? encoded = prefs.getString(_key);

    if (encoded != null) {
      final List<dynamic> decoded = jsonDecode(encoded);
      return decoded.map((json) => Transaction.fromJson(json)).toList();
    }
    return [];
  }
}
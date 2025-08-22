class Transaction {
  final String id;
  final String type; // income | expense
  final double amount;
  final String currency;
  final DateTime date;
  final String categoryId;
  final String accountId;
  final List<String> tags;
  final String? note;
  final String? attachmentUri;
  final String? recurrence; // daily | weekly | monthly

  Transaction({
    required this.id,
    required this.type,
    required this.amount,
    required this.currency,
    required this.date,
    required this.categoryId,
    required this.accountId,
    this.tags = const [],
    this.note,
    this.attachmentUri,
    this.recurrence,
  });
}
class Budget {
  final String id;
  final String categoryId;
  final String period; // month
  final double limitAmount;
  final String currency;

  Budget({
    required this.id,
    required this.categoryId,
    required this.period,
    required this.limitAmount,
    required this.currency,
  });
}
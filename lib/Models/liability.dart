class Liability {
  final String id;
  final String name;
  final String type; // loan | credit_card | bill | other
  final double balance;
  final String currency;
  final double? interestRate;
  final int? dueDay; // day of month
  final String? notes;

  Liability({
    required this.id,
    required this.name,
    required this.type,
    required this.balance,
    required this.currency,
    this.interestRate,
    this.dueDay,
    this.notes,
  });
}
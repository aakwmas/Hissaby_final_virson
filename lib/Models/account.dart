class Account {
  final String id;
  final String name;
  final String type; // cash | bank | wallet | card
  final String currency;
  final double? balance;

  Account({
    required this.id,
    required this.name,
    required this.type,
    required this.currency,
    this.balance,
  });
}
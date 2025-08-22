class Asset {
  final String id;
  final String name;
  final String type; // cash | bank | crypto | gold | real_estate | vehicle | investment
  final double value;
  final String currency;
  final DateTime lastValuationDate;
  final String? notes;

  Asset({
    required this.id,
    required this.name,
    required this.type,
    required this.value,
    required this.currency,
    required this.lastValuationDate,
    this.notes,
  });
}
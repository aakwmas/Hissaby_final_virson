class Category {
  final String id;
  final String name;
  final String type; // income | expense
  final String? color;
  final String? icon;

  Category({
    required this.id,
    required this.name,
    required this.type,
    this.color,
    this.icon,
  });
}
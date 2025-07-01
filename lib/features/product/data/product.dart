class Product {
  final String id;
  final String title;
  final String description;
  final String photoUrl;
  final double price;
  final String categoryId;
  final String sellerId;
  final DateTime createdAt;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.photoUrl,
    required this.price,
    required this.categoryId,
    required this.sellerId,
    required this.createdAt,
  });
}

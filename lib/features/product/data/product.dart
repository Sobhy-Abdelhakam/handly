import 'package:handly/features/product/data/seller.dart';

class Product {
  final String id;
  final String title;
  final String description;
  final String photoUrl;
  final double price;
  final String categoryId;
  final Seller seller;
  final DateTime createdAt;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.photoUrl,
    required this.price,
    required this.categoryId,
    required this.seller,
    required this.createdAt,
  });
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:handly/features/auth/domain/models/user.dart';

class Product {
  final String id;
  final String title;
  final String description;
  final String photoUrl;
  final double price;
  final String categoryId;
  final User seller;
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

  factory Product.fromFirestore(DocumentSnapshot doc, User seller) {
    final data = doc.data() as Map<String, dynamic>;
    return Product(
      id: doc.id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      photoUrl: data['photoUrl'] ?? '',
      price: (data['price'] ?? 0).toDouble(),
      categoryId: data['categoryId'] ?? '',
      seller: seller,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'photoUrl': photoUrl,
      'price': price,
      'categoryId': categoryId,
      'sellerId': seller.id,
      'createdAt': createdAt,
    };
  }
}

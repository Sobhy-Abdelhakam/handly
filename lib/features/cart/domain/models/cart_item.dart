import 'package:equatable/equatable.dart';

class CartItem extends Equatable {
  final String id;
  final String productName;
  final String imageUrl;
  final double price;
  final int quantity;

  const CartItem({
    required this.id,
    required this.productName,
    required this.price,
    required this.imageUrl,
    this.quantity = 1,
  });

  CartItem copyWith({int? quantity}) {
    return CartItem(
      id: id,
      productName: productName,
      price: price,
      imageUrl: imageUrl,
      quantity: quantity ?? this.quantity,
    );
  }
  
  @override
  List<Object?> get props => [id, productName, price, quantity, imageUrl];
}

import 'package:flutter/material.dart';
import 'package:handly/features/cart/domain/models/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem item;

  const CartItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: Image.network(item.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(item.productName),
        subtitle: Text("Qty: ${item.quantity}"),
        trailing: Text("\$${(item.price * item.quantity).toStringAsFixed(2)}"),
      ),
    );
  }
}

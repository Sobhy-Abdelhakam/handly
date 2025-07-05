import 'package:flutter/widgets.dart';
import 'package:handly/features/cart/data/cart_item.dart';
import 'package:handly/features/checkout/presentation/widget/cart_item_widget.dart';
import 'package:handly/generated/l10n.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key, required this.cartItems});

  final List<CartItem> cartItems;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).your_cart,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ...cartItems.map((item) => CartItemWidget(item: item)),
      ],
    );
  }
}

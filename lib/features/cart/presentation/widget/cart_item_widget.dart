import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/features/cart/data/cart_item.dart';
import 'package:handly/features/cart/logic/cart_cubit.dart';
import 'package:handly/features/cart/presentation/widget/confirm_delete_item.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key, required this.item});
  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(item.id),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) async {
        return await showDialog<bool>(
          context: context,
          builder: (context) => const ConfirmDeleteItem(),
        );
      },
      onDismissed: (direction) {
        context.read<CartCubit>().removeFromCart(item);
      },
      background: Container(
        padding: const EdgeInsets.only(right: 20),
        alignment: Alignment.centerRight,
        color: Theme.of(context).colorScheme.error,
        child: Icon(Icons.delete, color: Theme.of(context).colorScheme.onError),
      ),
      child: ListTile(
        leading: Image.network(item.imageUrl),
        title: Text(item.productName),
        subtitle: Text('${(item.price * item.quantity).toStringAsFixed(2)}\$'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                context.read<CartCubit>().onUpdateCartItemQuantity(
                  item.id,
                  item.quantity - 1,
                );
              },
            ),
            Text(item.quantity.toString()),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                context.read<CartCubit>().onUpdateCartItemQuantity(
                  item.id,
                  item.quantity + 1,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

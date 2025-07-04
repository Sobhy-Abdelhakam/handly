import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/features/cart/logic/cart_cubit.dart';
import 'package:handly/features/cart/logic/cart_state.dart';
import 'package:handly/features/cart/presentation/widget/cart_item_widget.dart';
import 'package:handly/generated/l10n.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).my_cart)),
      body: BlocListener<CartCubit, CartState>(
        listener: (context, state) {
          if (state is CartItemRemoved) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${state.removedItem.productName} removed'),
                action: SnackBarAction(
                  label: S.of(context).undo,
                  onPressed: () {
                    context.read<CartCubit>().onUndo(state.removedItem);
                  },
                ),
                duration: const Duration(seconds: 3),
              ),
            );
          }
        },
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CartError) {
              return Center(child: Text(state.message));
            }
            final items =
                state is CartLoaded
                    ? state.items
                    : (state is CartItemRemoved ? state.items : []);
            if (items.isEmpty) {
              return Center(child: Text(S.of(context).cart_empty));
            }
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return CartItemWidget(item: item);
              },
            );
          },
        ),
      ),
      bottomNavigationBar: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoaded && state.items.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${S.of(context).cart_total}: ${state.totalPrice.toStringAsFixed(2)}\$',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(S.of(context).Checkout),
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

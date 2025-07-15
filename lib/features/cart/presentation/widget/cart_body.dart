import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/features/cart/logic/cart_cubit.dart';
import 'package:handly/features/cart/logic/cart_state.dart';
import 'package:handly/generated/l10n.dart';

import 'cart_item_widget.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
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
          }

          if (state is CartError) {
            return Center(child: Text(state.message));
          }

            final items = switch (state) {
            CartLoaded s => s.items,
            CartItemRemoved s => s.items,
            _ => [],
          };
            if (items.isEmpty) {
              return Center(child: Text(S.of(context).cart_empty));
            }
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return CartItemWidget(item: items[index]);
              },
            );
          },
        ),
      );
  }
}
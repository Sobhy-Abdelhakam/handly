import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/features/cart/domain/models/cart_item.dart';
import 'package:handly/features/cart/logic/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartLoaded([]));
  void loadCart() {
    emit(CartLoading());
    // Simulate loading cart items
    Future.delayed(const Duration(seconds: 1), () {
      emit(CartLoaded([]));
    });
  }

  void addToCart(CartItem cartItem) {
    final currentItems =
        state is CartLoaded
            ? (state as CartLoaded).items
            : (state as CartItemRemoved).items;
    final updatedItems = List<CartItem>.from(currentItems);

    final itemIdex = updatedItems.indexWhere((item) => item.id == cartItem.id);
    if (itemIdex != -1) {
      final updated = updatedItems[itemIdex].copyWith(
        quantity: updatedItems[itemIdex].quantity + 1,
      );
      updatedItems[itemIdex] = updated;
    } else {
      updatedItems.add(cartItem);
    }
    emit(CartLoaded(List.from(updatedItems)));
  }

  void removeFromCart(CartItem cartItem) {
    final current =
        state is CartLoaded
            ? (state as CartLoaded).items
            : (state as CartItemRemoved).items;
    final updated = List<CartItem>.from(current);

    updated.remove(cartItem);
    emit(CartItemRemoved(updated, cartItem));
  }

  void onUndo(CartItem item) {
    final currentItems =
        state is CartItemRemoved ? (state as CartItemRemoved).items : [];

    final updated = List<CartItem>.from(currentItems)..add(item);
    emit(CartLoaded(updated));
  }

  void onUpdateCartItemQuantity(String productId, int quantity) {
    final state = this.state;
    if (state is CartLoaded) {
      final List<CartItem> updatedItems = List.from(state.items);
      final itemIndex = updatedItems.indexWhere(
        (item) => item.id == productId,
      );

      if (itemIndex != -1) {
        if (quantity > 0) {
          updatedItems[itemIndex] = updatedItems[itemIndex].copyWith(
            quantity: quantity,
          );
        } else {
          updatedItems.removeAt(itemIndex);
        }
        emit(CartLoaded(updatedItems));
      }
    }
  }
}

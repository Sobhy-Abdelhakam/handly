import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/features/cart/domain/models/cart_item.dart';
import 'package:handly/features/checkout/logic/checkout_state.dart';
import 'package:handly/features/checkout/model/credit_card_info.dart';
import 'package:handly/features/checkout/model/delivery_option.dart';
import 'package:handly/features/checkout/model/order.dart';
import 'package:handly/features/checkout/model/payment_method.dart';
import 'package:handly/features/checkout/model/vodafone_cash_info.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(double initialSubtotal, List<CartItem> cartItems)
    : super(
        CheckoutState(
          subtotal: initialSubtotal,
          deliveryFee: 10.0, // Default to home delivery fee
          total: initialSubtotal + 10.0,
          cartItems: cartItems,
        ),
      );

  void selectPaymentMethod(PaymentMethod paymentMethod) {
    emit(
      state.copyWith(
        status: CheckoutStatus.initial,
        selectedPaymentMethod: paymentMethod,
      ),
    );
  }

  void selectDeliveryOption(DeliveryOption deliveryOption) {
    double newDeliveryFee = 0.0;
    if (deliveryOption == DeliveryOption.homeDelivery) {
      newDeliveryFee = 10.0; // Example home delivery fee
    }
    final newTotal = state.subtotal + newDeliveryFee;
    emit(
      state.copyWith(
        status: CheckoutStatus.initial,
        selectedDeliveryOption: deliveryOption,
        deliveryFee: newDeliveryFee,
        total: newTotal,
      ),
    );
  }

  void updateCreditCardInfo(CreditCardInfo info) {
    emit(state.copyWith(creditCardInfo: info));
  }

  void updateVodafoneCashInfo(VodafoneCashInfo info) {
    emit(state.copyWith(vodafoneCashInfo: info));
  }

  void submitOrder() {
    final method = state.selectedPaymentMethod;
    final delivery = state.selectedDeliveryOption;
    if (method == null || delivery == null) {
      emit(state.copyWith(status: CheckoutStatus.error));
      return;
    }
    // Validate credit card data
  if (method is CreditCard) {
    final info = state.creditCardInfo;
    if (info == null ||
        info.cardNumber.isEmpty ||
        info.expiryDate.isEmpty ||
        info.cvv.isEmpty ||
        info.holderName.isEmpty) {
      emit(state.copyWith(status: CheckoutStatus.error));
      return;
    }
  }
  // Validate Vodafone Cash data
  if (method is VodafoneCash) {
    final info = state.vodafoneCashInfo;
    if (info == null ||
        info.phoneNumber.isEmpty ||
        !RegExp(r"^01[0-2,5]{1}[0-9]{8}$").hasMatch(info.phoneNumber)) {
      emit(state.copyWith(status: CheckoutStatus.error));
      return;
    }
  }

    emit(state.copyWith(status: CheckoutStatus.loading));
    // Simulate order submission
    // In a real application, you would send this 'order' object to a backend service.
    // For now, we'll just simulate a delay.
    try {
      Future.delayed(const Duration(seconds: 2), () {
        final order = Order(
          id: 'order_${DateTime.now().millisecondsSinceEpoch}',
          buyerId: 'buyer_123',
          items: state.cartItems,
          subtotal: state.subtotal,
          deliveryFee: state.deliveryFee,
          total: state.total,
          deliveryOption: delivery,
          paymentMethod: method,
          createdAt: DateTime.now(),
        );
        // Here you would typically send the order to your backend
        // For now, we just emit a success state
        emit(state.copyWith(status: CheckoutStatus.success));
      });
    } catch (e) {
      emit(state.copyWith(status: CheckoutStatus.error));
    }
  }
}

import 'package:equatable/equatable.dart';
import 'package:handly/features/cart/data/cart_item.dart';
import 'package:handly/features/checkout/model/credit_card_info.dart';
import 'package:handly/features/checkout/model/delivery_option.dart';
import 'package:handly/features/checkout/model/payment_method.dart';
import 'package:handly/features/checkout/model/vodafone_cash_info.dart';

enum CheckoutStatus { initial, loading, success, error }

class CheckoutState extends Equatable {
  final List<CartItem> cartItems;
  final double subtotal;
  final double deliveryFee;
  final double total;
  final PaymentMethod? selectedPaymentMethod;
  final DeliveryOption? selectedDeliveryOption;
  final CheckoutStatus status;

  final CreditCardInfo? creditCardInfo;
  final VodafoneCashInfo? vodafoneCashInfo;

  const CheckoutState({
    required this.cartItems,
    required this.subtotal,
    this.deliveryFee = 0.0,
    required this.total,
    this.selectedPaymentMethod,
    this.selectedDeliveryOption,
    this.status = CheckoutStatus.initial,
    this.creditCardInfo,
    this.vodafoneCashInfo,
  });

  CheckoutState copyWith({
    List<CartItem>? cartItems,
    double? subtotal,
    double? deliveryFee,
    double? total,
    DeliveryOption? selectedDeliveryOption,
    PaymentMethod? selectedPaymentMethod,
    CheckoutStatus? status,
    CreditCardInfo? creditCardInfo,
    VodafoneCashInfo? vodafoneCashInfo,
  }) {
    return CheckoutState(
      cartItems: cartItems ?? this.cartItems,
      subtotal: subtotal ?? this.subtotal,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      total: total ?? this.total,
      selectedDeliveryOption: selectedDeliveryOption ?? this.selectedDeliveryOption,
      selectedPaymentMethod: selectedPaymentMethod ?? this.selectedPaymentMethod,
      status: status ?? this.status,
      creditCardInfo: creditCardInfo ?? this.creditCardInfo,
      vodafoneCashInfo: vodafoneCashInfo ?? this.vodafoneCashInfo,
    );
  }

  @override
  List<Object?> get props => [
        cartItems,
        subtotal,
        deliveryFee,
        total,
        selectedDeliveryOption,
        selectedPaymentMethod,
        status,
        creditCardInfo,
        vodafoneCashInfo,
      ];
}

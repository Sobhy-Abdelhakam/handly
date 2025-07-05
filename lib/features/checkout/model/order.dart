import 'package:handly/features/cart/data/cart_item.dart';
import 'package:handly/features/checkout/model/delivery_option.dart';
import 'package:handly/features/checkout/model/payment_method.dart';

class Order {
  final String id;
  final String buyerId;
  final List<CartItem> items;
  final double subtotal;
  final double deliveryFee;
  final double total;
  final DeliveryOption deliveryOption;
  final PaymentMethod paymentMethod;
  final DateTime createdAt;

  Order({
    required this.id,
    required this.buyerId,
    required this.items,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
    required this.deliveryOption,
    required this.paymentMethod,
    required this.createdAt,
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/core/router/routers.dart';
import 'package:handly/features/cart/data/cart_item.dart';
import 'package:handly/features/checkout/logic/checkout_cubit.dart';
import 'package:handly/features/checkout/logic/checkout_state.dart';
import 'package:handly/features/checkout/model/delivery_option.dart';
import 'package:handly/features/checkout/model/payment_method.dart';
import 'package:handly/features/checkout/presentation/components/cart_items.dart';
import 'package:handly/features/checkout/presentation/components/place_order_button.dart';
import 'package:handly/features/checkout/presentation/components/delivery_selector.dart';
import 'package:handly/features/checkout/presentation/components/order_summary.dart';
import 'package:handly/features/checkout/presentation/components/payment_method_selector.dart';
import 'package:handly/generated/l10n.dart';

class CheckoutScreen extends StatelessWidget {
  final List<CartItem> cartItems;
  final double subtotal;
  const CheckoutScreen({
    super.key,
    required this.cartItems,
    required this.subtotal,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).checkout)),
      body: BlocListener<CheckoutCubit, CheckoutState>(
        listener: (context, state) {
          if (state.status == CheckoutStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(S.of(context).fill_required_fields_error)),
            );
          }
          if (state.status == CheckoutStatus.success) {
            Navigator.of(context).pushReplacementNamed(Routers.checkoutSuccess);
          }
        },
        child: BlocBuilder<CheckoutCubit, CheckoutState>(
          builder: (_, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  CartItems(cartItems: state.cartItems),
                  DeliverySelector(
                    selectedDeliveryOption: state.selectedDeliveryOption,
                    deliveryOpetions: DeliveryOption.values,
                  ),
                  PaymentMethodSelector(
                    paymentMethods: [
                      const CashOnDelivery(),
                      const CreditCard(),
                      const VodafoneCash(),
                    ],
                    selectedPaymentMethod: state.selectedPaymentMethod,
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BlocBuilder<CheckoutCubit, CheckoutState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                OrderSummary(
                  subtotal: state.subtotal,
                  deliveryFee: state.deliveryFee,
                  total: state.total,
                ),
                const SizedBox(height: 24),
                PlaceOrderButton(onPressed: () {}, text: S.of(context).place_order),
              ],
            ),
          );
        },
      ),
    );
  }
}

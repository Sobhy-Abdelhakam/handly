import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/features/checkout/logic/checkout_cubit.dart';
import 'package:handly/features/checkout/model/payment_method.dart';
import 'package:handly/features/checkout/presentation/widget/credit_card_form.dart';
import 'package:handly/features/checkout/presentation/widget/payment_option_tile.dart';
import 'package:handly/features/checkout/presentation/widget/vodafone_cash_form.dart';

class PaymentMethodSelector extends StatelessWidget {
  const PaymentMethodSelector({super.key, required this.paymentMethods, this.selectedPaymentMethod});

  final List<PaymentMethod> paymentMethods;
  final PaymentMethod? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CheckoutCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Payment Method",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ...paymentMethods.map((method) {
          return PaymentOptionTile(
          method: method,
          isSelected: selectedPaymentMethod == method,
          onTap: () => cubit.selectPaymentMethod(method),
        );
        }),
        if (selectedPaymentMethod is CreditCard) ...[
          const SizedBox(height: 8),
          CreditCardForm(),
        ],
        if (selectedPaymentMethod is VodafoneCash) ...[
          const SizedBox(height: 8),
          VodafoneCashForm(),
        ],
      ],
    );
  }
}

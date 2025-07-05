import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/features/checkout/logic/checkout_cubit.dart';
import 'package:handly/features/checkout/logic/checkout_state.dart';

class PlaceOrderButton extends StatelessWidget {
  const PlaceOrderButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CheckoutCubit>();
    final state = cubit.state;
    return FilledButton(
      onPressed:
          state.status == CheckoutStatus.loading
              ? null
              : () => cubit.submitOrder(),
      style: FilledButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child:
          state.status == CheckoutStatus.loading
              ? const CircularProgressIndicator(color: Colors.white)
              : Text(
                text,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
    );
  }
}

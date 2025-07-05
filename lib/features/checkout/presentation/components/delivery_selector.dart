import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/features/checkout/logic/checkout_cubit.dart';
import 'package:handly/features/checkout/model/delivery_option.dart';
import 'package:handly/generated/l10n.dart';

class DeliverySelector extends StatelessWidget {
  const DeliverySelector({super.key, required this.selectedDeliveryOption, required this.deliveryOpetions});

  final DeliveryOption? selectedDeliveryOption;
  final List<DeliveryOption> deliveryOpetions;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CheckoutCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).delivery_option,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          spacing: 8,
          children: [
            ...deliveryOpetions.map((option) {
              return ChoiceChip(
                label: Text(option.localizedName(context)),
                selected: selectedDeliveryOption == option,
                onSelected: (value) => cubit.selectDeliveryOption(option),
              );
            }),
          ],
        ),
      ],
    );
  }
}

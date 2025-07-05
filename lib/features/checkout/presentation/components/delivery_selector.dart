import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/features/checkout/logic/checkout_cubit.dart';
import 'package:handly/features/checkout/model/delivery_option.dart';

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
        const Text(
          "Delivery Option",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          spacing: 8,
          children: [
            ...deliveryOpetions.map((option) {
              return ChoiceChip(
                label: Text(option.name),
                selected: selectedDeliveryOption == option,
                onSelected: (value) => cubit.selectDeliveryOption(option),
              );
            }),
            // ChoiceChip(
            //   label: const Text("Home Delivery"),
            //   selected:
            //       selectedDeliveryOption == DeliveryOption.homeDelivery,
            //   onSelected:
            //       (_) =>
            //           cubit.selectDeliveryOption(DeliveryOption.homeDelivery),
            // ),
            // const SizedBox(width: 8),
            // ChoiceChip(
            //   label: const Text("In-Store Pickup"),
            //   selected:
            //       selectedDeliveryOption == DeliveryOption.inStorePickup,
            //   onSelected:
            //       (_) =>
            //           cubit.selectDeliveryOption(DeliveryOption.inStorePickup),
            // ),
          ],
        ),
      ],
    );
  }
}

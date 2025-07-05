import 'package:flutter/material.dart';
import 'package:handly/features/checkout/model/payment_method.dart';

class PaymentOptionTile extends StatelessWidget {
  final PaymentMethod method;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentOptionTile({super.key, required this.method, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isSelected ? Colors.green[50] : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        leading: Image.asset(method.icon, width: 32),
        title: Text(method.name),
        trailing: isSelected ? const Icon(Icons.check_circle, color: Colors.green) : null,
        onTap: onTap,
      ),
    );
  }
}

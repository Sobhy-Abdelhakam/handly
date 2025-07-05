import 'package:flutter/material.dart';
import 'package:handly/generated/l10n.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key, required this.subtotal, required this.deliveryFee, required this.total});

  final double subtotal;
  final double deliveryFee;
  final double total;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).order_summary,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        _priceRow(S.of(context).subtotal, subtotal),
        _priceRow(S.of(context).delivery_fee, deliveryFee),
        const Divider(),
        _priceRow(S.of(context).total, total, isTotal: true),
      ],
    );
  }

  Widget _priceRow(String label, double value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            "\$${value.toStringAsFixed(2)}",
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:handly/generated/l10n.dart';

class OrderConfirmationScreen extends StatelessWidget {
  const OrderConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).order_confirmation)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle_outline, size: 100, color: Colors.green),
            SizedBox(height: 20),
            Text(
              S.of(context).order_confirmation_subtitle,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

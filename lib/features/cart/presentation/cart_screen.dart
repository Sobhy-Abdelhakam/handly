import 'package:flutter/material.dart';
import 'package:handly/features/cart/presentation/widget/cart_body.dart';
import 'package:handly/features/cart/presentation/widget/cart_bottom_bar.dart';
import 'package:handly/generated/l10n.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).my_cart)),
      body: const CartBody(),
      bottomNavigationBar: const CartBottomBar(),
    );
  }
}

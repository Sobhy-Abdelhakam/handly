import 'package:flutter/material.dart';

class ConfirmDeleteItem extends StatelessWidget {
  const ConfirmDeleteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Remove Item"),
      content: const Text(
          "Are you sure you want to remove this item from the cart?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: const Text("Delete", style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}

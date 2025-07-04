import 'package:flutter/material.dart';
import 'package:handly/generated/l10n.dart';

class ConfirmDeleteItem extends StatelessWidget {
  const ConfirmDeleteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(S.of(context).remove_Item),
      content: Text(
        S.of(context).remove_item_confirmation),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(S.of(context).cancel),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: Text(S.of(context).delete, style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}

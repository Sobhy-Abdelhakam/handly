import 'package:flutter/material.dart';
import 'package:handly/generated/l10n.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key, required this.controller, this.focusNode, this.onChangeFocus});
  final TextEditingController controller;
  final FocusNode? focusNode;
  final void Function(String)? onChangeFocus;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: onChangeFocus,
      decoration: InputDecoration(
        labelText: S.of(context).email,
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).email_required;
        }
        final emailPattern = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
        if (!emailPattern.hasMatch(value)) {
          return S.of(context).invalid_email;
        }
        return null;
      },
    );
  }
}

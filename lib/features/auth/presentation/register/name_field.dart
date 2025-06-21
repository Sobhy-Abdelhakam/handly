import 'package:flutter/material.dart';
import 'package:handly/generated/l10n.dart';

class NameField extends StatelessWidget {
  const NameField({super.key, this.controller, this.focusNode, this.onChangeFocus});

  final TextEditingController? controller;
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
              label: Text(S.of(context).name),
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).name_required;
              }
              final namePattern = RegExp(r"^[a-zA-Z\s]+$");
              if (!namePattern.hasMatch(value)) {
                return S.of(context).name_only_letters;
              }
              if (value.length < 3) {
                return S.of(context).name_min_length;
              }
              return null;
            },
          );
  }
}
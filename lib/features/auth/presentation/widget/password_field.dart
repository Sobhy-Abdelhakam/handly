import 'package:flutter/material.dart';
import 'package:handly/generated/l10n.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, this.controller, this.focusNode, this.onSubmitted});

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final void Function(String)? onSubmitted;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      obscureText: _isObscured,
      enableSuggestions: false,
      autocorrect: false,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      onFieldSubmitted: widget.onSubmitted,
      decoration: InputDecoration(
        labelText: S.of(context).password,
        border: OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(_isObscured ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() =>_isObscured = !_isObscured);
          },
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).password_required;
        }
        if (value.length < 6) {
          return S.of(context).password_min_length;
        }
        return null;
      },
    );
  }
}

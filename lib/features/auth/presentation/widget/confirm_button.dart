import 'package:flutter/material.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({super.key, required this.text, required this.submit});

  final String text;
  final VoidCallback submit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.all(12),
          textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        onPressed: submit,
        child: Text(
          text,
        ),
      ),
    );
  }
}

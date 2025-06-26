import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title, this.onPressed});

  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (onPressed != null)
          TextButton(
            onPressed: onPressed,
            child: const Text(
              'View all',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
          ),
      ],
    );
  }
}

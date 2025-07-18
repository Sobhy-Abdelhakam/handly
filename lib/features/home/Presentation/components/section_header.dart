import 'package:flutter/material.dart';
import 'package:handly/generated/l10n.dart';

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
          style: Theme.of(context).textTheme.titleLarge,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (onPressed != null)
          TextButton(
            onPressed: onPressed,
            child: Text(
              S.of(context).view_all,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
      ],
    );
  }
}


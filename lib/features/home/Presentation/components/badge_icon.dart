import 'package:flutter/material.dart';

class BadgeIcon extends StatelessWidget {
  const BadgeIcon({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.itemCount,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton(onPressed: onPressed, icon: Icon(icon)),
        Positioned(
          right: 4,
          top: 4,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainer,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '$itemCount',
                style: Theme.of(
                  context,
                ).textTheme.labelLarge?.copyWith(fontSize: 10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

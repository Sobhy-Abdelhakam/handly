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
      children: [
        IconButton(onPressed: onPressed, icon: Icon(icon)),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                itemCount.toString(),
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.apply(fontSizeFactor: 0.8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

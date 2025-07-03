import 'package:flutter/material.dart';
import 'package:handly/features/home/Presentation/components/badge_icon.dart';
import 'package:handly/generated/l10n.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).good_day,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(
              S.of(context).user_name,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        BadgeIcon(
          icon: Icons.shopping_bag_outlined,
          onPressed: () {},
          itemCount: 2,
        ),
      ],
    );
  }
}


import 'package:flutter/material.dart';
import 'package:handly/features/home/Presentation/components/badge_icon.dart';

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
              "Good day for shopping",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(
              "Sobhy Abdel Hakam",
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

    // AppBar(
    //   automaticallyImplyLeading: false,
    //   title: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Text(
    //         "Good day for shopping",
    //         style: Theme.of(context).textTheme.labelMedium,
    //       ),
    //       Text(
    //         "Sobhy Abdel Hakam",
    //         style: Theme.of(context).textTheme.titleMedium,
    //       ),
    //     ],
    //   ),
    //   actions: [
    //     BadgeIcon(
    //       icon: Icons.shopping_bag_outlined,
    //       onPressed: () {},
    //       itemCount: 2,
    //     ),
    //   ],
    // );
  }
}

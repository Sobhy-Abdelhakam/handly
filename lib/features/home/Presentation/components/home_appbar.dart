import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/core/router/routers.dart';
import 'package:handly/features/cart/logic/cart_cubit.dart';
import 'package:handly/features/cart/logic/cart_state.dart';
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
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            final itemCount = state is CartLoaded ? state.items.length : 0;
            return _buildCartIcon(context, itemCount);
          },
        ),
      ],
    );
  }

  Widget _buildCartIcon(BuildContext context, int itemCount) {
    onPressed() => Navigator.pushNamed(context, Routers.cart);

    if (itemCount == 0) {
      return IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.shopping_bag_outlined),
      );
    }

    return BadgeIcon(
      icon: Icons.shopping_bag_outlined,
      onPressed: onPressed,
      itemCount: itemCount,
    );
  }
}

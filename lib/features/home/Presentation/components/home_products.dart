import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/features/home/Presentation/components/product_card.dart';
import 'package:handly/features/product/logic/product_cubit.dart';
import 'package:handly/features/product/logic/product_state.dart';

class HomeProducts extends StatelessWidget {
  const HomeProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ProductFailure) {
          return Center(child: Text('Error: ${state.message}'));
        }
        if (state is ProductSuccess) {
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1 / 1.4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
            ),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final product = state.products[index];
              return ProductCard(product: product);
            },
            itemCount: state.products.length,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

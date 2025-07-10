import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/features/product/presentation/cubit/product_cubit.dart';
import 'package:handly/features/product/presentation/cubit/product_state.dart';

import 'product_card.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

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
        if (state is ProductsLoaded) {
          if (state.products.isEmpty) {
            return const Center(child: Text('No products available'));
          }
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

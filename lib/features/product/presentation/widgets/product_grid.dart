import 'package:flutter/material.dart';
import 'package:handly/features/product/domain/models/product.dart';

import 'product_card.dart';

class ProductGrid extends StatelessWidget {
  final List<Product> products;
  const ProductGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return products.isEmpty
        ? Text('No Product Available')
        : GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1 / 1.4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 2,
          ),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final product = products[index];
            return ProductCard(product: product);
          },
          itemCount: products.length,
        );
  }
}

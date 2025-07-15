import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/features/auth/domain/models/user.dart';
import 'package:handly/features/product/presentation/cubit/user_products_cubit.dart';
import 'package:handly/features/product/presentation/widgets/product_card.dart';

class SellerProfileView extends StatelessWidget {
  const SellerProfileView({super.key, required this.seller});
  final User seller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(seller.name)),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(seller.imageUrl ?? ''),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              seller.name,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    seller.bio ?? '',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(padding: EdgeInsets.all(16), child: Divider()),
          ),
          BlocBuilder<UserProductsCubit, UserProductsState>(
            builder: (context, state) {
              if (state.status == UserProductsStatus.loading) {
                return const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              if (state.status == UserProductsStatus.failure) {
                return SliverToBoxAdapter(
                  child: Center(child: Text('Error: ${state.errorMessage}')),
                );
              }
              if (state.status == UserProductsStatus.loaded) {
                if (state.products.isEmpty) {
                  return const SliverToBoxAdapter(
                    child: Center(child: Text('No products available')),
                  );
                }
                return SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final product = state.products[index];
                    return ProductCard(product: product);
                  }, childCount: state.products.length),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}

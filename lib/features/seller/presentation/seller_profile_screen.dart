import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/features/home/Presentation/components/product_card.dart';
import 'package:handly/features/product/data/product_repo.dart';
import 'package:handly/features/product/data/seller.dart';
import 'package:handly/features/seller/logic/seller_profile_cubit.dart';
import 'package:handly/features/seller/logic/seller_profile_state.dart';

class SellerProfileScreen extends StatelessWidget {
  const SellerProfileScreen({super.key, required this.seller});

  final Seller seller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(seller.name)),
      body: BlocProvider(
        create:
            (context) =>
                SellerProfileCubit(ProductRepo())
                  ..getProductsBySeller(seller.id),
        child: BlocBuilder<SellerProfileCubit, SellerProfileState>(
          builder: (context, state) {
            return CustomScrollView(
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
                              backgroundImage: NetworkImage(seller.imageUrl),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    seller.name,
                                    style:
                                        Theme.of(
                                          context,
                                        ).textTheme.headlineSmall,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        seller.rating.toString(),
                                        style:
                                            Theme.of(
                                              context,
                                            ).textTheme.titleMedium,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          seller.bio,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ),
                // add divider
                const SliverToBoxAdapter(
                  child: Padding(padding: EdgeInsets.all(16), child: Divider()),
                ),
                if (state is SellerProfileLoading)
                  const SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  ),
                if (state is SellerProfileFailure)
                  SliverToBoxAdapter(
                    child: Center(child: Text('Error: ${state.message}')),
                  ),
                if (state is SellerProfileSuccess)
                  SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1 / 1.4,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final product = state.products[index];
                      return ProductCard(product: product);
                    }, childCount: state.products.length),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

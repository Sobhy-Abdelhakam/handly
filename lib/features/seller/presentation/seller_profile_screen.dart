import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/features/auth/domain/models/user.dart';
import 'package:handly/features/product/domain/usecases/get_user_products.dart';
import 'package:handly/features/product/presentation/cubit/user_products_cubit.dart';
import 'package:handly/features/product/data/product_repository_impl.dart';

import 'seller_profile_view.dart';

class SellerProfileScreen extends StatelessWidget {
  const SellerProfileScreen({super.key, required this.seller});

  final User seller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserProductsCubit(GetUserProducts(ProductRepositoryImpl()))..getUserProducts(seller.id),
      child: SellerProfileView(seller: seller),
      );
  }
}

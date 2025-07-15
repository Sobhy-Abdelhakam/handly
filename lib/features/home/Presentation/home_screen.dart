import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/features/category/data/category_repository_impl.dart';
import 'package:handly/features/category/domain/usecases/get_all_categories.dart';
import 'package:handly/features/category/presentation/cubit/category_cubit.dart';
import 'package:handly/features/product/data/product_repository_impl.dart';
import 'package:handly/features/product/domain/usecases/get_products_by_category.dart';
import 'package:handly/features/product/presentation/cubit/category_products_cubit.dart';

import 'home_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (_) =>
                  CategoryCubit(GetAllCategories(CategoryRepositoryImpl()))
                    ..getCategories(),
        ),
        BlocProvider(
          create: (_) => CategoryProductsCubit(GetProductsByCategory(ProductRepositoryImpl())),
        ),
      ],
      child: const HomeView(),
    );
  }
}

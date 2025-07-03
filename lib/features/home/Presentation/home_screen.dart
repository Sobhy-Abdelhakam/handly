import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/features/category/data/categories_repo.dart';
import 'package:handly/features/category/logic/category_cubit.dart';
import 'package:handly/features/category/logic/category_state.dart';
import 'package:handly/features/home/Presentation/components/home_appbar.dart';
import 'package:handly/features/home/Presentation/components/home_categories.dart';
import 'package:handly/features/home/Presentation/components/home_products.dart';
import 'package:handly/features/home/Presentation/components/search_container.dart';
import 'package:handly/features/home/Presentation/components/section_header.dart';
import 'package:handly/features/product/data/product_repo.dart';
import 'package:handly/features/product/logic/product_cubit.dart';
import 'package:handly/generated/l10n.dart';
import 'package:handly/utils/responsive/responsive_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryCubit(CategoriesRepo())..getCategories(),
        ),
        BlocProvider(create: (context) => ProductCubit(ProductRepo())),
      ],
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: ResponsiveHelper.getPadding(context),
              child: Column(
                children: [
                  HomeAppBar(),
                  const SizedBox(height: 16),
                  SearchContainer(),
                  const SizedBox(height: 16),
                  SectionHeader(title: S.of(context).Categories),
                  HomeCategories(),
                  const SizedBox(height: 16),
                  BlocListener<CategoryCubit, CategoryState>(
                    listener: (context, state) {
                      if (state is CategorySuccess) {
                        context.read<ProductCubit>().getProductsByCategory(
                          state.selectedCategory.id,
                        );
                      }
                    },
                    child: HomeProducts(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

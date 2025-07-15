import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/features/category/presentation/cubit/category_cubit.dart';
import 'package:handly/features/category/presentation/cubit/category_state.dart';
import 'package:handly/features/category/presentation/category_list_item.dart';
import 'package:handly/features/home/Presentation/components/home_appbar.dart';
import 'package:handly/features/home/Presentation/components/search_container.dart';
import 'package:handly/features/home/Presentation/components/section_header.dart';
import 'package:handly/features/product/presentation/cubit/category_products_cubit.dart';
import 'package:handly/features/product/presentation/widgets/product_grid.dart';
import 'package:handly/generated/l10n.dart';
import 'package:handly/utils/responsive/responsive_helper.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                const SizedBox(height: 8),
                const CategoryListItem(),
                const SizedBox(height: 16),
                BlocListener<CategoryCubit, CategoryState>(
                  listener: (context, state) {
                    if (state is CategorySuccess) {
                      context
                          .read<CategoryProductsCubit>()
                          .getProductsByCategory(state.selectedCategory.id);
                    }
                  },
                  child: BlocBuilder<
                    CategoryProductsCubit,
                    CategoryProductsState
                  >(
                    builder: (context, state) {
                      if (state.status == CategoryProductsStatus.loading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state.status == CategoryProductsStatus.failure) {
                        return Center(
                          child: Text('Error: ${state.errorMessage}'),
                        );
                      }
                      if (state.status == CategoryProductsStatus.loaded) {
                        return ProductGrid(products: state.products);
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

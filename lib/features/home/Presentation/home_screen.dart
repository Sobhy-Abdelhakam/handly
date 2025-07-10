import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/features/category/presentation/cubit/category_cubit.dart';
import 'package:handly/features/category/presentation/cubit/category_state.dart';
import 'package:handly/features/category/presentation/category_list_item.dart';
import 'package:handly/features/home/Presentation/components/home_appbar.dart';
import 'package:handly/features/home/Presentation/components/search_container.dart';
import 'package:handly/features/home/Presentation/components/section_header.dart';
import 'package:handly/features/product/presentation/cubit/product_cubit.dart';
import 'package:handly/features/product/presentation/widgets/product_grid.dart';
import 'package:handly/generated/l10n.dart';
import 'package:handly/utils/responsive/responsive_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: ResponsiveHelper.getPadding(context),
            child: BlocListener<CategoryCubit, CategoryState>(
              listener: (context, state) {
                if (state is CategorySuccess) {
                    context
                        .read<ProductCubit>()
                        .getProductsByCategory(state.selectedCategory.id);
                  }
              },
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
                  const ProductGrid(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

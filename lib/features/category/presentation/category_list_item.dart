import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/category_cubit.dart';
import 'cubit/category_state.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is CategoryFailure) {
          return Center(child: Text('Error: ${state.message}'));
        }
        if (state is CategorySuccess) {
          return SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.categories.length,
              itemBuilder: (_, index) {
                final category = state.categories[index];
                final isSelected =
                    state.selectedCategory == category;
                return GestureDetector(
                  onTap: () {
                    context.read<CategoryCubit>().selectCategory(category);
                    // context.read<ProductCubit>().getProductsByCategory(category.id); // may delete this, because it is already done in the listener of CategoryCubit
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Theme.of(context).colorScheme.primary
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      isArabic ? category.nameAr : category.nameEn,
                      style: TextStyle(
                        color: isSelected
                            ? Theme.of(context).colorScheme.onPrimary
                            : null,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
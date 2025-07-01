import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/features/category/data/category.dart';
import 'package:handly/features/category/logic/category_cubit.dart';
import 'package:handly/features/category/logic/category_state.dart';

class HomeCategories extends StatefulWidget {
  const HomeCategories({super.key});

  @override
  State<HomeCategories> createState() => _HomeCategoriesState();
}

class _HomeCategoriesState extends State<HomeCategories> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoadding) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is CategoryFailure) {
          return Center(child: Text('Error: ${state.message}'));
        }
        final List<Category> items =
            state is CategorySuccess ? state.categories : [];
        return SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,

            itemCount: items.length,
            itemBuilder: (_, index) {
              final category = items[index];
              final isSelected = _selectedIndex == index;
              return GestureDetector(
                onTap:
                    () => setState(() {
                      _selectedIndex = index;
                    }),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color:
                        isSelected
                            ? Theme.of(context).colorScheme.primary
                            : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    category.name,
                    style: TextStyle(
                      color:
                          isSelected
                              ? Theme.of(context).colorScheme.onPrimary
                              : null,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

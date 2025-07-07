import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/features/category/data/categories_repo.dart';
import 'package:handly/features/category/data/category.dart';
import 'package:handly/features/category/logic/category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoriesRepo _categoriesRepo;
  CategoryCubit(this._categoriesRepo) : super(CategoryInitial());

  Future<void> getCategories() async {
    emit(CategoryLoading());
    final categories = await _categoriesRepo.getCategories();
    categories.fold(
      (error) => emit(CategoryFailure(error.toString())),
      (categories) {
        if (categories.isNotEmpty) {
          emit(CategorySuccess(
              categories: categories, selectedCategory: categories[0]));
        } else {
          emit(const CategoryFailure('No categories found'));
        }
      },
    );
  }

  void selectCategory(Category category) {
    if (state is CategorySuccess) {
      final successState = state as CategorySuccess;
      emit(successState.copyWith(selectedCategory: category));
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/features/category/domain/models/category.dart';
import 'package:handly/features/category/domain/usecases/get_all_categories.dart';
import 'package:handly/features/category/presentation/cubit/category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final GetAllCategories _getAllCategories;

  CategoryCubit(this._getAllCategories) : super(CategoryInitial());

  Future<void> getCategories() async {
    emit(CategoryLoading());
    final categories = await _getAllCategories();
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

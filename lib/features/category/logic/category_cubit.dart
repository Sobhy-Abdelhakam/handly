import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/features/category/data/categories_repo.dart';
import 'package:handly/features/category/logic/category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoriesRepo _categoriesRepo;
  CategoryCubit(this._categoriesRepo) : super(CategoryInitial());

  Future<void> getCategories() async{
    emit(CategoryLoadding());
    final categories = await _categoriesRepo.getCategories();
    categories.fold(
      (error) => emit(CategoryFailure(error.toString())),
      (categories) => emit(CategorySuccess(categories))
      );
  }
}
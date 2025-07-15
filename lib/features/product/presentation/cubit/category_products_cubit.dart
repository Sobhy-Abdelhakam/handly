import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/features/product/domain/models/product.dart';
import 'package:handly/features/product/domain/usecases/get_products_by_category.dart';

part 'category_products_state.dart';

class CategoryProductsCubit extends Cubit<CategoryProductsState> {
  final GetProductsByCategory _getProductsByCategory;

  CategoryProductsCubit(this._getProductsByCategory)
      : super(const CategoryProductsState());

  Future<void> getProductsByCategory(String categoryId) async {
    emit(state.copyWith(status: CategoryProductsStatus.loading));
    final response = await _getProductsByCategory(categoryId);
    response.fold(
      (error) => emit(state.copyWith(
        status: CategoryProductsStatus.failure,
        errorMessage: error.toString(),
      )),
      (products) => emit(state.copyWith(
        status: CategoryProductsStatus.loaded,
        products: products,
      )),
    );
  }
}

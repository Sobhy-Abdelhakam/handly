import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/features/product/data/product_repo.dart';
import 'package:handly/features/product/logic/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepo _productRepo;
  ProductCubit(this._productRepo) : super(ProductInitial());

  Future<void> getProducts() async {
    emit(ProductLoading());
    final response = await _productRepo.getProducts();
    response.fold(
      (error) => emit(ProductFailure(error.toString())),
      (products) => emit(ProductSuccess(products)),
    );
  }

  Future<void> getProductsByCategory(String categoryId) async {
    if (state is! ProductSuccess) {
      emit(ProductLoading());
    }
    final response = await _productRepo.getProductsByCategory(categoryId);
    response.fold(
      (error) => emit(ProductFailure(error.toString())),
      (products) => emit(ProductSuccess(products)),
    );
  }
}


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/features/product/domain/models/product.dart';
import 'package:handly/features/product/domain/usecases/create_product.dart';
import 'package:handly/features/product/domain/usecases/delete_product.dart';
import 'package:handly/features/product/domain/usecases/get_products_by_category.dart';
import 'package:handly/features/product/domain/usecases/get_user_products.dart';
import 'package:handly/features/product/presentation/cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final CreateProduct _createProduct;
  final DeleteProduct _deleteProduct;
  final GetProductsByCategory _getProductsByCategory;
  final GetUserProducts _getUserProducts;

  ProductCubit({
    required CreateProduct createProduct,
    required DeleteProduct deleteProduct,
    required GetProductsByCategory getProductsByCategory,
    required GetUserProducts getUserProducts,
  })  : _createProduct = createProduct,
        _deleteProduct = deleteProduct,
        _getProductsByCategory = getProductsByCategory,
        _getUserProducts = getUserProducts,
        super(ProductInitial());

  Future<void> getProductsByCategory(String categoryId) async {
    emit(ProductLoading());
    final response = await _getProductsByCategory(categoryId);
    response.fold(
      (error) => emit(ProductFailure(error.toString())),
      (products) => emit(ProductsLoaded(products)),
    );
  }

  Future<void> getUserProducts(String userId) async {
    emit(ProductLoading());
    final response = await _getUserProducts(userId);
    response.fold(
      (error) => emit(ProductFailure(error.toString())),
      (products) => emit(ProductsLoaded(products)),
    );
  }

  Future<void> addProduct(Product product) async {
    emit(ProductLoading());
    try {
      await _createProduct(product);
      emit(ProductAdded());
    } catch (e) {
      emit(ProductFailure(e.toString()));
    }
  }

  Future<void> deleteProduct(String productId) async {
    emit(ProductLoading());
    try {
      await _deleteProduct(productId);
      emit(ProductInitial()); // Or a new state e.g., ProductDeleted
    } catch (e) {
      emit(ProductFailure(e.toString()));
    }
  }
}

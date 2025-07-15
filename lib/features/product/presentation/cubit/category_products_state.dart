part of 'category_products_cubit.dart';

enum CategoryProductsStatus {
  initial,
  loading,
  loaded,
  failure,
}

class CategoryProductsState extends Equatable {
  final CategoryProductsStatus status;
  final List<Product> products;
  final String? errorMessage;

  const CategoryProductsState({
    this.status = CategoryProductsStatus.initial,
    this.products = const [],
    this.errorMessage,
  });

  CategoryProductsState copyWith({
    CategoryProductsStatus? status,
    List<Product>? products,
    String? errorMessage,
  }) {
    return CategoryProductsState(
      status: status ?? this.status,
      products: products ?? this.products,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, products, errorMessage];
}

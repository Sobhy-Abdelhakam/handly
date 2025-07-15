part of 'user_products_cubit.dart';

enum UserProductsStatus {
  initial,
  loading,
  loaded,
  failure,
}

class UserProductsState extends Equatable {
  final UserProductsStatus status;
  final List<Product> products;
  final String? errorMessage;

  const UserProductsState({
    this.status = UserProductsStatus.initial,
    this.products = const [],
    this.errorMessage,
  });

  UserProductsState copyWith({
    UserProductsStatus? status,
    List<Product>? products,
    String? errorMessage,
  }) {
    return UserProductsState(
      status: status ?? this.status,
      products: products ?? this.products,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, products, errorMessage];
}

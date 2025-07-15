import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/features/product/domain/models/product.dart';
import 'package:handly/features/product/domain/usecases/get_user_products.dart';

part 'user_products_state.dart';

class UserProductsCubit extends Cubit<UserProductsState> {
  final GetUserProducts _getUserProducts;

  UserProductsCubit(this._getUserProducts) : super(const UserProductsState());

  Future<void> getUserProducts(String userId) async {
    emit(state.copyWith(status: UserProductsStatus.loading));
    final response = await _getUserProducts(userId);
    response.fold(
      (error) => emit(state.copyWith(
        status: UserProductsStatus.failure,
        errorMessage: error.toString(),
      )),
      (products) => emit(state.copyWith(
        status: UserProductsStatus.loaded,
        products: products,
      )),
    );
  }
}

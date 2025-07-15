import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/features/product/domain/models/product.dart';
import 'package:handly/features/product/domain/usecases/create_product.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  final CreateProduct _createProduct;

  AddProductCubit(this._createProduct) : super(const AddProductState());

  Future<void> addProduct(Product product) async {
    emit(state.copyWith(status: AddProductStatus.loading));
    try {
      await _createProduct(product);
      emit(state.copyWith(status: AddProductStatus.added));
    } catch (e) {
      emit(state.copyWith(
        status: AddProductStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/features/product/domain/usecases/get_user_products.dart';
import 'package:handly/features/seller/logic/seller_profile_state.dart';

class SellerProfileCubit extends Cubit<SellerProfileState> {
  final GetUserProducts _getUserProducts;
  SellerProfileCubit(this._getUserProducts) : super(SellerProfileInitial());

  Future<void> getProductsBySeller(String sellerId) async {
    emit(SellerProfileLoading());
    final response = await _getUserProducts(sellerId);
    response.fold(
      (error) => emit(SellerProfileFailure(error.toString())),
      (products) => emit(SellerProfileSuccess(products)),
    );
  }
}

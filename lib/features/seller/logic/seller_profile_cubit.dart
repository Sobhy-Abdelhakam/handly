import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/features/product/data/product_repo.dart';
import 'package:handly/features/seller/logic/seller_profile_state.dart';

class SellerProfileCubit extends Cubit<SellerProfileState> {
  final ProductRepo _productRepo;
  SellerProfileCubit(this._productRepo) : super(SellerProfileInitial());

  Future<void> getProductsBySeller(String sellerId) async {
    emit(SellerProfileLoading());
    final response = await _productRepo.getProductsBySeller(sellerId);
    response.fold(
      (error) => emit(SellerProfileFailure(error.toString())),
      (products) => emit(SellerProfileSuccess(products)),
    );
  }
}

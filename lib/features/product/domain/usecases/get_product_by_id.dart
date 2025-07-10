import 'package:dartz/dartz.dart';
import 'package:handly/features/product/domain/repository/product_repository.dart';

class GetProductById {
  final ProductRepository _productRepo;
  GetProductById(this._productRepo);

  Future<Either> call(String productId) =>
      _productRepo.getProductById(productId);
}

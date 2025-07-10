import 'package:dartz/dartz.dart';
import 'package:handly/features/product/domain/repository/product_repository.dart';

class GetProductsByCategory {
  final ProductRepository _productRepo;
  GetProductsByCategory(this._productRepo);

  Future<Either> call(String categoryId) =>
      _productRepo.getProductsByCategory(categoryId);
}

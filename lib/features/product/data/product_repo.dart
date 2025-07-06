import 'package:dartz/dartz.dart';
import 'package:handly/core/errors/failures.dart';
import 'package:handly/features/product/data/product.dart';
import 'package:handly/features/product/data/product_data.dart';

class ProductRepo {
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final products = dummyProducts;
      return Right(products);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  Future<Either<Failure, List<Product>>> getProductsByCategory(
      String categoryId) async {
    try {
      final products =
          dummyProducts.where((element) => element.categoryId == categoryId).toList();
      return Right(products);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  Future<Either<Failure, List<Product>>> getProductsBySeller(
      String sellerId) async {
    try {
      final products =
          dummyProducts.where((element) => element.seller.id == sellerId).toList();
      return Right(products);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }
}

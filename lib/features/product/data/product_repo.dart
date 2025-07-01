import 'package:dartz/dartz.dart';
import 'package:handly/core/errors/failures.dart';
import 'package:handly/features/product/data/product_data.dart';

class ProductRepo {
  Future<Either> getProducts() async {
    try {
      final products = dummyProducts;
      return Right(products);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  Future<Either> getProductsByCategory(String categoryId) async{
    try {
      final products = dummyProducts.where((element) => element.categoryId == categoryId,);
      return Right(products);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }
}
import 'package:dartz/dartz.dart';
import 'package:handly/core/errors/failures.dart';

import '../models/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getAllProducts();
  Future<Either<Failure, Product>> getProductById(String id);
  Future<Either<Failure, List<Product>>> getProductsByCategory(String categoryId);
  Future<Either<Failure, List<Product>>> getUserProducts(String userId);
  Future<void> addProduct(Product product);
  Future<void> updateProduct(Product product);
  Future<void> deleteProduct(String id);
}
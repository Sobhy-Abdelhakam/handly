import 'package:dartz/dartz.dart';
import 'package:handly/core/errors/failures.dart';
import 'package:handly/features/product/domain/models/product.dart';
import 'package:handly/features/product/domain/repository/product_repository.dart';

class GetUserProducts {
  final ProductRepository repo;

  GetUserProducts(this.repo);

  Future<Either<Failure, List<Product>>> call(String userId) async {
    return repo.getUserProducts(userId);
  }
}

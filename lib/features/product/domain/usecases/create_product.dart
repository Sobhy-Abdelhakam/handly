import 'package:handly/features/product/domain/models/product.dart';
import 'package:handly/features/product/domain/repository/product_repository.dart';

class CreateProduct {
  final ProductRepository repository;

  CreateProduct(this.repository);

  Future<void> call(Product product) async {
    await repository.addProduct(product);
  }
}

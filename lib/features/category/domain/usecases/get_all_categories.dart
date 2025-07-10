import 'package:dartz/dartz.dart';
import 'package:handly/core/errors/failures.dart';
import 'package:handly/features/category/domain/models/category.dart';
import 'package:handly/features/category/domain/repository/category_repository.dart';

class GetAllCategories {
  final CategoryRepository repository;

  GetAllCategories(this.repository);

  Future<Either<Failure, List<Category>>> call() async {
    return await repository.getAllCategories();
  }
}

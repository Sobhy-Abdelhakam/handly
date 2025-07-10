import 'package:dartz/dartz.dart';
import 'package:handly/core/errors/failures.dart';
import 'package:handly/features/category/domain/models/category.dart';
import 'package:handly/features/category/domain/repository/category_repository.dart';

class GetCategoryById {
  final CategoryRepository repository;

  GetCategoryById(this.repository);

  Future<Either<Failure, Category>> call(String id) async {
    return await repository.getCategoryById(id);
  }
}

import 'package:dartz/dartz.dart';
import 'package:handly/core/errors/failures.dart';
import 'package:handly/features/category/domain/models/category.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<Category>>> getAllCategories();
  Future<Either<Failure, Category>> getCategoryById(String id);
}

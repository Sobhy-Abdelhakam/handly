import 'package:dartz/dartz.dart';
import 'package:handly/core/errors/failures.dart';
import 'package:handly/features/category/data/categories_data.dart';
import 'package:handly/features/category/data/category.dart';

class CategoriesRepo {
  Future<Either<Failure, List<Category>>> getCategories() async {
    try {
      var categories = dummycategories;
      return Right(categories);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }
}
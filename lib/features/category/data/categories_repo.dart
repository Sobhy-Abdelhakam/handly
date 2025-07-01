import 'package:dartz/dartz.dart';
import 'package:handly/core/errors/failures.dart';
import 'package:handly/features/category/data/categories_data.dart';

class CategoriesRepo {
  Future<Either> getCategories() async {
    try {
      var categories = dummycategories;
      return Right(categories);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }
}
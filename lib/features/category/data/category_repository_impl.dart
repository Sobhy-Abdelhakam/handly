import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:handly/core/errors/failures.dart';
import 'package:handly/features/category/domain/models/category.dart';
import 'package:handly/features/category/domain/repository/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final FirebaseFirestore _firestore;

  CategoryRepositoryImpl({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<Either<Failure, List<Category>>> getAllCategories() async {
    try {
      final snapshot = await _firestore.collection('categories').get();
      final categories = snapshot.docs
          .map((doc) => Category.fromFirestore(doc.data(), doc.id))
          .toList();
      return Right(categories);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Category>> getCategoryById(String id) async {
    try {
      final doc = await _firestore.collection('categories').doc(id).get();
      if (!doc.exists) {
        return Left(ServerFailures('Category not found'));
      }
      final category = Category.fromFirestore(doc.data()!, doc.id);
      return Right(category);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }
}

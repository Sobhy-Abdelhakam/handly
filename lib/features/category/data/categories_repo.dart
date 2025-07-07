import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:handly/core/errors/failures.dart';
import 'package:handly/features/category/data/category.dart';

class CategoriesRepo {
  final FirebaseFirestore _firestore;

  CategoriesRepo({FirebaseFirestore? firestore}) : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<Either<Failure, List<Category>>> getCategories() async {
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
}

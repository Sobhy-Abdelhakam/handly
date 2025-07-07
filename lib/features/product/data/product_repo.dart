import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:handly/core/errors/failures.dart';
import 'package:handly/features/product/data/product.dart';
import 'package:handly/features/product/data/seller.dart';

class ProductRepo {
  final FirebaseFirestore _firestore;

  ProductRepo({FirebaseFirestore? firestore}) : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final snapshot = await _firestore.collection('products').get();
      final products = await _mapSnapshotToProducts(snapshot);
      return Right(products);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  Future<Either<Failure, List<Product>>> getProductsByCategory(
      String categoryId) async {
    try {
      final snapshot = await _firestore
          .collection('products')
          .where('categoryId', isEqualTo: categoryId)
          .get();
      final products = await _mapSnapshotToProducts(snapshot);
      return Right(products);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  Future<Either<Failure, List<Product>>> getProductsBySeller(
      String sellerId) async {
    try {
      final snapshot = await _firestore
          .collection('products')
          .where('sellerId', isEqualTo: sellerId)
          .get();
      final products = await _mapSnapshotToProducts(snapshot);
      return Right(products);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  Future<Either<Failure, void>> addProduct(Product product) async {
    try {
      await _firestore.collection('products').add(product.toJson());
      return const Right(null);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  Future<List<Product>> _mapSnapshotToProducts(
      QuerySnapshot<Map<String, dynamic>> snapshot) async {
    final products = <Product> [];
    for (final doc in snapshot.docs) {
      final sellerDoc = await _firestore.collection('users').doc(doc.data()['sellerId']).get();
      final seller = Seller.fromFirestore(sellerDoc);
      products.add(Product.fromFirestore(doc, seller));
    }
    return products;
  }
}

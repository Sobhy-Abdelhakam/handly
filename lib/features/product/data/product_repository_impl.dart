import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:handly/core/errors/failures.dart';
import 'package:handly/features/auth/domain/models/user.dart';
import 'package:handly/features/product/domain/models/product.dart';
import 'package:handly/features/product/domain/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final FirebaseFirestore _firestore;
  ProductRepositoryImpl({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  // Collection and field names
  static const _products = 'products';
  static const _users = 'users';
  static const _categoryId = 'categoryId';
  static const _sellerId = 'sellerId';
  static const _createdAt = 'createdAt';

  // Convenience getters
  CollectionReference<Map<String, dynamic>> get _productsRef =>
      _firestore.collection(_products);
  CollectionReference<Map<String, dynamic>> get _usersRef =>
      _firestore.collection(_users);

  @override
  Future<Either<Failure, List<Product>>> getAllProducts() {
    final query = _productsRef.orderBy(_createdAt, descending: true);
    return _getProductsFromQuery(query);
  }

  @override
  Future<Either<Failure, List<Product>>> getProductsByCategory(
    String categoryId,
  ) {
    final query = _productsRef
        .where(_categoryId, isEqualTo: categoryId);
        // .orderBy(_createdAt, descending: true);
    return _getProductsFromQuery(query);
  }

  @override
  Future<Either<Failure, List<Product>>> getUserProducts(String sellerId) {
    final query = _productsRef
        .where(_sellerId, isEqualTo: sellerId);
        // .orderBy(_createdAt, descending: true);
    return _getProductsFromQuery(query);
  }

  @override
  Future<Either<Failure, void>> addProduct(Product product) async {
    try {
      await _productsRef.add(product.toJson());
      return const Right(null);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateProduct(Product product) async {
    try {
      await _productsRef.doc(product.id).update(product.toJson());
      return const Right(null);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProduct(String productId) async {
    try {
      await _productsRef.doc(productId).delete();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Product>> getProductById(String productId) async {
    try {
      final doc = await _productsRef.doc(productId).get();
      if (!doc.exists) return Left(ServerFailures('Product not found'));

      final data = doc.data()!;
      final seller = await _getSellerById(data[_sellerId] as String);
      final product = Product.fromFirestore(doc, seller);
      return Right(product);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  Future<Either<Failure, List<Product>>> _getProductsFromQuery(
    Query<Map<String, dynamic>> query,
  ) async {
    try {
      final snapshot = await query.get();
      final products = await _mapSnapshotToProducts(snapshot);
      return Right(products);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  Future<List<Product>> _mapSnapshotToProducts(
    QuerySnapshot<Map<String, dynamic>> snapshot,
  ) async {
    if (snapshot.docs.isEmpty) return [];

    // Extract unique seller IDs from the snapshot
    // this is to avoid fetching the same seller multiple times from firestore
    final sellerIds = snapshot.docs
        .map((doc) => doc.data()[_sellerId] as String)
        .toSet();

    final sellers = await Future.wait(
      sellerIds.map((id) => _getSellerById(id)),
    );

    // Create a map of sellerId to Seller
    final sellerMap = {
      for (int i = 0; i < sellerIds.length; i++) sellerIds.elementAt(i): sellers[i]
    };

    return snapshot.docs.map((doc) {
      final seller = sellerMap[doc.data()[_sellerId]];
      return Product.fromFirestore(doc, seller!);
    }).toList();
  }

  Future<User> _getSellerById(String id) async {
    final doc = await _usersRef.doc(id).get();
    return User.fromJson(doc.data()!);
  }
}

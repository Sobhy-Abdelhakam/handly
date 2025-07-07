import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:handly/core/errors/failures.dart';
import 'package:handly/features/auth/domain/models/user.dart';
import 'package:handly/features/auth/domain/repository/auth_repository.dart';

class AuthRepoImpl extends AuthRepository {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  AuthRepoImpl({firebase_auth.FirebaseAuth? firebaseAuth, FirebaseFirestore? firestore}) : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance, _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<User?> getCurrentUser() async {
    final firebaseUser = _firebaseAuth.currentUser;
    if (firebaseUser != null) {
      final userDoc = await _firestore.collection('users').doc(firebaseUser.uid).get();
      return User.fromJson(userDoc.data()!);
    }
    return null;
  }

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userDoc = await _firestore.collection('users').doc(userCredential.user!.uid).get();
      final user = User.fromJson(userDoc.data()!);

      return Right(user);
    } on firebase_auth.FirebaseAuthException catch (e) {
      return Left(ServerFailures(e.message ?? 'An unknown error occurred'));
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<Either<Failure, User>> register(
      String name, String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final newUser = User(
        id: userCredential.user!.uid,
        name: name,
        email: email,
      );

      await _firestore.collection('users').doc(newUser.id).set(newUser.toJson());

      return Right(newUser);
    } on firebase_auth.FirebaseAuthException catch (e) {
      return Left(ServerFailures(e.message ?? 'An unknown error occurred'));
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<void> sendPasswordReset(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }
}

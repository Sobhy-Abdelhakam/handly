import 'package:dartz/dartz.dart';
import 'package:handly/core/errors/failures.dart';
import 'package:handly/features/auth/domain/models/user.dart';
import 'package:handly/features/auth/domain/repository/auth_repository.dart';

class AuthRepoImpl extends AuthRepository {
  @override
  Future<User?> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> login(String email, String password) async{
    try {
      // Simulate API delay
      await Future.delayed(Duration(seconds: 3));

      if (email == 'blocked@example.com') {
        return Left(ServerFailures("Account is blocked."));
      }

      if (email != 'user@example.com') {
        return Left(ServerFailures("User not found."));
      }

      final user = User(id: '1', name: 'Test User', email: email);
      return Right(user);

    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> register(String name, String email, String password) async{
    try {
      // Simulate API delay
      await Future.delayed(Duration(seconds: 3));

      final user = User(id: '1', name: name, email: email);
      return Right(user);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<void> sendPasswordReset(String email) {
    // TODO: implement sendPasswordReset
    throw UnimplementedError();
  }

}
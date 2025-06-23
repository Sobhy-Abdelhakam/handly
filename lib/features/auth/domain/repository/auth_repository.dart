import 'package:handly/features/auth/domain/models/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> login(String email, String password);
  Future<UserModel> register(String name, String email, String password);
  Future<void> sendPasswordReset(String email);
  Future<void> logout();
  Future<UserModel?> getCurrentUser();
}

class RepoImpl extends AuthRepository {
  @override
  Future<UserModel?> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<UserModel> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 3));
    return Future.value(UserModel(id: "id", name: "name", email: "email"));
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<UserModel> register(String name, String email, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<void> sendPasswordReset(String email) {
    // TODO: implement sendPasswordReset
    throw UnimplementedError();
  }
}

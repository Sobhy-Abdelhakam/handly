import 'package:handly/features/auth/domain/models/login_response.dart';
import 'package:handly/features/auth/domain/models/user.dart';
import 'package:handly/features/auth/domain/repository/auth_repository.dart';

class AuthRepoImpl extends AuthRepository {
  @override
  Future<User?> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<LoginResponse> login(String email, String password) async{
    try {
      // Simulate API delay
      await Future.delayed(Duration(seconds: 3));

      if (email == 'blocked@example.com') {
        return LoginResponse(success: false, message: "Account is blocked.");
      }

      if (email != 'user@example.com') {
        return LoginResponse(success: false, message: "User not found.");
      }

      if (password != '123456') {
        return LoginResponse(success: false, message: "Invalid password.");
      }

      final user = User(id: '1', name: 'Test User', email: email);
      return LoginResponse(success: true, token: 'fake_token_abc', user: user);

    } catch (e) {
      return LoginResponse(success: false, message: "Server error occurred.");
    }
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<LoginResponse> register(String name, String email, String password) async{
    try {
      // Simulate API delay
      await Future.delayed(Duration(seconds: 3));

      final user = User(id: '1', name: name, email: email);
      return LoginResponse(success: true, token: 'fake_token_abc', user: user);

    } catch (e) {
      return LoginResponse(success: false, message: "Server error occurred.");
    }
  }

  @override
  Future<void> sendPasswordReset(String email) {
    // TODO: implement sendPasswordReset
    throw UnimplementedError();
  }

}
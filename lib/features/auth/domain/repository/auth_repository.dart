import 'package:handly/features/auth/domain/models/login_response.dart';
import 'package:handly/features/auth/domain/models/user.dart';

abstract class AuthRepository {
  Future<LoginResponse> login(String email, String password);
  Future<LoginResponse> register(String name, String email, String password);
  Future<void> sendPasswordReset(String email);
  Future<void> logout();
  Future<User?> getCurrentUser();
}
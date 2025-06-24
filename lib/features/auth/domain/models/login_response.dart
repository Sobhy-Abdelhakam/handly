import 'package:handly/features/auth/domain/models/user.dart';

class LoginResponse {
  final bool success;
  final String? token;
  final User? user;
  final String? message;

  LoginResponse({
    required this.success,
    this.token,
    this.user,
    this.message,
  });
}
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/features/auth/cubit/auth_state.dart';
import 'package:handly/features/auth/domain/repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  AuthCubit(this._authRepository) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final response = await _authRepository.login(email, password);

      response.fold(
        (error) {
          emit(AuthFailure(error.message));
        },
        (user) async {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setBool('isLoggedIn', true);
          await prefs.setString('user', jsonEncode(user.toJson()));
          emit(AuthSuccess(user));
        },
      );
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> register(String name, String email, String password) async {
    emit(AuthLoading());
    try {
      final response = await _authRepository.register(name, email, password);

      response.fold(
        (error) {
          emit(AuthFailure(error.message));
        },
        (user) async {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setBool('isLoggedIn', true);
          await prefs.setString('user', jsonEncode(user.toJson()));
          emit(AuthSuccess(user));
        },
      );
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> sendReset(String email) async {
    emit(AuthLoading());
    try {
      await _authRepository.sendPasswordReset(email);
      emit(AuthResetEmailSent());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  void resetState() => emit(AuthInitial());
}

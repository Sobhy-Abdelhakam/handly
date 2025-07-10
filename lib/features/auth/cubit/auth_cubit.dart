import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/features/auth/domain/models/user.dart';
import 'package:handly/features/auth/domain/repository/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  AuthCubit(this._authRepository) : super(const AuthState());

  Future<void> login(String email, String password) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      final response = await _authRepository.login(email, password);

      response.fold(
        (error) {
          emit(state.copyWith(
            status: AuthStatus.failure,
            errorMessage: error.message,
          ));
        },
        (user) {
          emit(state.copyWith(
            status: AuthStatus.success,
            user: user,
          ));
        },
      );
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> register(String name, String email, String password) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      final response = await _authRepository.register(name, email, password);

      response.fold(
        (error) {
          emit(state.copyWith(
            status: AuthStatus.failure,
            errorMessage: error.message,
          ));
        },
        (user) {
          emit(state.copyWith(
            status: AuthStatus.success,
            user: user,
          ));
        },
      );
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> sendReset(String email) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      await _authRepository.sendPasswordReset(email);
      emit(state.copyWith(status: AuthStatus.resetEmailSent));
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> logout() async {
    await _authRepository.logout();
    emit(const AuthState());
  }

  Future<void> checkAuthStatus() async {
    emit(state.copyWith(status: AuthStatus.loading));
    final user = await _authRepository.getCurrentUser();
    if (user != null) {
      emit(state.copyWith(
        status: AuthStatus.success,
        user: user,
      ));
    } else {
      emit(const AuthState());
    }
  }

  void resetState() => emit(const AuthState());
}
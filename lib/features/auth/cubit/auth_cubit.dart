import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/features/auth/cubit/auth_state.dart';
import 'package:handly/features/auth/domain/repository/auth_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  AuthCubit(this._authRepository) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final user = await _authRepository.login(email, password);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> register(String name, String email, String password) async {
    emit(AuthLoading());
    try {
      final user = await _authRepository.register(name, email, password);
      emit(AuthSuccess(user));
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

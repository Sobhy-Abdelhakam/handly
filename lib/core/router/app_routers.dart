import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/core/router/not_found_page.dart';
import 'package:handly/core/router/routers.dart';
import 'package:handly/features/auth/cubit/auth_cubit.dart';
import 'package:handly/features/auth/domain/repository/auth_repository.dart';
import 'package:handly/features/auth/presentation/forget/confirm/confirm_screen.dart';
import 'package:handly/features/auth/presentation/forget/forget_pass_screen.dart';
import 'package:handly/features/auth/presentation/init_screen.dart';
import 'package:handly/features/auth/presentation/login/login_screen.dart';
import 'package:handly/features/auth/presentation/register/register_screen.dart';

class AppRouters {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routers.initial:
        return _buildRoute(settings, const InitScreen());
      case Routers.login:
        return _buildRoute(
          settings,
          BlocProvider(
            create: (_) => AuthCubit(RepoImpl()),
            child: const LoginScreen(),
          ),
        );
      case Routers.register:
        return _buildRoute(
          settings,
          BlocProvider(
            create: (_) => AuthCubit(RepoImpl()),
            child: const RegisterScreen(),
          ),
        );
      case Routers.forgetPassword:
        return _buildRoute(
          settings,
          BlocProvider(
            create: (_) => AuthCubit(RepoImpl()),
            child: const ForgetPassScreen(),
          ),
        );
      case Routers.confrimSendEmail:
        return _buildRoute(settings, const ConfirmScreen());
      default:
        return _buildRoute(settings, NotFoundPage());
    }
  }

  MaterialPageRoute _buildRoute(RouteSettings settings, Widget screen) {
    return MaterialPageRoute(settings: settings, builder: (_) => screen);
  }
}

import 'package:flutter/material.dart';
import 'package:handly/core/router/routers.dart';
import 'package:handly/features/auth/presentation/forget/confirm/confirm_screen.dart';
import 'package:handly/features/auth/presentation/forget/forget_pass_screen.dart';
import 'package:handly/features/auth/presentation/init_screen.dart';
import 'package:handly/features/auth/presentation/login/login_screen.dart';
import 'package:handly/features/auth/presentation/register/register_screen.dart';

class AppRouters {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routers.initial:
        return _buildRoute(settings, InitScreen());
      case Routers.login:
        return _buildRoute(settings, LoginScreen());
      case Routers.register:
        return _buildRoute(settings, RegisterScreen());
      case Routers.forgetPassword:
        return _buildRoute(settings, ForgetPassScreen());
      case Routers.confrimSendEmail:
        return _buildRoute(settings, ConfirmScreen());
      default:
        return _buildRoute(settings, Placeholder());
    }
  }

  MaterialPageRoute _buildRoute(RouteSettings settings, Widget screen) {
    return MaterialPageRoute(settings: settings, builder: (_) => screen);
  }
}

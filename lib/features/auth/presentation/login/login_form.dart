import 'package:flutter/material.dart';
import 'package:handly/core/router/routers.dart';
import 'package:handly/features/auth/presentation/widget/confirm_button.dart';
import 'package:handly/features/auth/presentation/widget/email_field.dart';
import 'package:handly/features/auth/presentation/widget/password_field.dart';
import 'package:handly/generated/l10n.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      // TODO: Replace with actual login logic
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(S.of(context).login_success)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 12,
        children: [
          EmailField(
            controller: emailController,
            focusNode: _emailFocus,
            onChangeFocus: (_) {
              FocusScope.of(context).requestFocus(_passwordFocus);
            },
          ),
          PasswordField(
            controller: passwordController,
            focusNode: _passwordFocus,
            onSubmitted: (_) => _login(),
          ),
          Row(
            children: [
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routers.forgetPassword);
                },
                child: Text(S.of(context).forgot_password),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ConfirmButton(text: S.of(context).login, submit: _login),
        ],
      ),
    );
  }
}

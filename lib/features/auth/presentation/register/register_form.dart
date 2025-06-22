import 'package:flutter/material.dart';
import 'package:handly/features/auth/presentation/register/name_field.dart';
import 'package:handly/features/auth/presentation/widget/confirm_button.dart';
import 'package:handly/features/auth/presentation/widget/email_field.dart';
import 'package:handly/features/auth/presentation/widget/password_field.dart';
import 'package:handly/generated/l10n.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final _nameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _confirmPassFocus = FocusNode();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    _nameFocus.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _confirmPassFocus.dispose();
    super.dispose();
  }

  void _register() {
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NameField(
            controller: nameController,
            focusNode: _nameFocus,
            onChangeFocus: (_) {
              FocusScope.of(context).requestFocus(_emailFocus);
            },
          ),
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
            onSubmitted: (_) {
              _register();
            },
          ),
          const SizedBox(height: 8),
          ConfirmButton(text: S.of(context).register, submit: _register),
        ],
      ),
    );
  }
}

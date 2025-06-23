import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/core/router/routers.dart';
import 'package:handly/features/auth/cubit/auth_cubit.dart';
import 'package:handly/features/auth/cubit/auth_state.dart';
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
      context.read<AuthCubit>().register(
        nameController.text,
        emailController.text,
        passwordController.text,
      );
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
          BlocConsumer(
            builder: (_, state) {
              return state is AuthLoading
                  ? const CircularProgressIndicator()
                  : ConfirmButton(
                    text: S.of(context).register,
                    submit: _register,
                  );
            },
            listener: (_, state) {
              if (state is AuthSuccess) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routers.home,
                  (route) => false,
                );
              } else if (state is AuthFailure) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
          ),
        ],
      ),
    );
  }
}

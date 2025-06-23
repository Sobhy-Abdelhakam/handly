import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/core/router/routers.dart';
import 'package:handly/features/auth/cubit/auth_cubit.dart';
import 'package:handly/features/auth/cubit/auth_state.dart';
import 'package:handly/features/auth/presentation/widget/confirm_button.dart';
import 'package:handly/features/auth/presentation/widget/email_field.dart';
import 'package:handly/generated/l10n.dart';

class ForgetPassForm extends StatefulWidget {
  const ForgetPassForm({super.key});

  @override
  State<ForgetPassForm> createState() => _ForgetPassFormState();
}

class _ForgetPassFormState extends State<ForgetPassForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void _send() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthCubit>().sendReset(emailController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          EmailField(
            controller: emailController,
            onChangeFocus: (_) {
              _send();
            },
          ),
          const SizedBox(height: 32),
          BlocConsumer<AuthCubit, AuthState>(
            builder: (_, state) {
              return state is AuthLoading
                  ? const CircularProgressIndicator()
                  : ConfirmButton(text: S.of(context).login, submit: _send);
            },
            listener: (_, state) {
              if (state is AuthResetEmailSent) {
                Navigator.pushNamed(context, Routers.confrimSendEmail);
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

import 'package:flutter/material.dart';
import 'package:handly/core/router/routers.dart';
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
    // if (_formKey.currentState?.validate() ?? false) {
    //   // TODO: Replace with actual login logic
    //   ScaffoldMessenger.of(
    //     context,
    //   ).showSnackBar(SnackBar(content: Text(S.of(context).login_success)));
    // } else {
    //   ScaffoldMessenger.of(
    //     context,
    //   ).showSnackBar(SnackBar(content: Text(S.of(context).login_failed)));
    // }
    Navigator.pushNamed(context, Routers.confrimSendEmail);
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
          ConfirmButton(text: S.of(context).send, submit: _send),
        ],
      ),
    );
  }
}

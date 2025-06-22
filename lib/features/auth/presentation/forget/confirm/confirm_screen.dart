import 'package:flutter/material.dart';
import 'package:handly/core/router/routers.dart';
import 'package:handly/features/auth/presentation/widget/confirm_button.dart';
import 'package:handly/generated/l10n.dart';

class ConfirmScreen extends StatelessWidget {
  const ConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            Image(
              image: AssetImage('assets/images/send_email.png'),
              width: MediaQuery.of(context).size.width * 0.7,
            ),
            const SizedBox(height: 8),
            Text(
              S.of(context).confirm_screen_title,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            Text(
              S.of(context).confirm_screen_sub_title,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            ConfirmButton(
              text: S.of(context).done,
              submit: () {
                Navigator.popUntil(context, ModalRoute.withName(Routers.login));
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:handly/generated/l10n.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).error), centerTitle: true),
      body: Center(
        child: Text(
          "Page not found!",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}

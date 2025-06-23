import 'package:flutter/material.dart';
import 'package:handly/features/auth/presentation/register/register_content.dart';
import 'package:handly/utils/responsive/responsive_helper.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final maxFormWidth = ResponsiveHelper.getMaxWidth(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxFormWidth),
            child:
                isMobile
                    ? RegisterContent()
                    : Card(elevation: 8, child: RegisterContent()),
          ),
        ),
      ),
    );
  }
}

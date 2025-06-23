import 'package:flutter/material.dart';
import 'package:handly/features/auth/presentation/login/login_buttom_sheet.dart';
import 'package:handly/features/auth/presentation/login/login_card.dart';
import 'package:handly/utils/responsive/responsive_helper.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: ResponsiveHelper.screenWidth(context),
          height: ResponsiveHelper.screenHeight(context),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/auth_bg.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
            ),
          ),
          child: isMobile ? LoginButtomSheet() : LoginCard(),
        ),
      ),
    );
  }
}

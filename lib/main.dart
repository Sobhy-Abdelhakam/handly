import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:handly/core/controllers/app_bloc_observer.dart';
import 'package:handly/core/router/app_routers.dart';
import 'package:handly/core/router/routers.dart';
import 'package:handly/generated/l10n.dart';

void main() {
  Bloc.observer = const AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale('ar'),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Handly',
      onGenerateTitle: (context) => S.of(context).title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFD97742)),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFFD97742),
          brightness: Brightness.dark,
        ),
      ),
      onGenerateRoute: AppRouters().generateRoute,
      initialRoute: Routers.initial,
    );
  }
}
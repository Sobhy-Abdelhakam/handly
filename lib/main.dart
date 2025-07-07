import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:handly/core/controllers/app_bloc_observer.dart';
import 'package:handly/core/router/app_routers.dart';
import 'package:handly/features/auth/cubit/auth_cubit.dart';
import 'package:handly/features/auth/cubit/auth_state.dart';
import 'package:handly/features/auth/data/repositoryimpl/auth_repo_impl.dart';
import 'package:handly/features/auth/presentation/login/login_screen.dart';
import 'package:handly/features/cart/logic/cart_cubit.dart';
import 'package:handly/features/category/data/categories_repo.dart';
import 'package:handly/features/category/logic/category_cubit.dart';
import 'package:handly/features/category/logic/category_state.dart';
import 'package:handly/features/home/Presentation/home_screen.dart';
import 'package:handly/features/product/data/product_repo.dart';
import 'package:handly/features/product/logic/product_cubit.dart';
import 'package:handly/firebase_options.dart';
import 'package:handly/generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = const AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(AuthRepoImpl())..checkAuthStatus(),
        ),
        BlocProvider(
          create: (context) => CategoryCubit(CategoriesRepo())..getCategories(),
        ),
        BlocProvider(
          create: (context) => ProductCubit(ProductRepo()),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
        ),
      ],
      child: MaterialApp(
        // locale: const Locale('ar'),
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
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFD97742)),
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFD97742),
            brightness: Brightness.dark,
          ),
        ),
        onGenerateRoute: AppRouters().generateRoute,
        home: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthSuccess) {
              return BlocListener<CategoryCubit, CategoryState>(
                listener: (context, state) {
                  if (state is CategorySuccess) {
                    context
                        .read<ProductCubit>()
                        .getProductsByCategory(state.selectedCategory.id);
                  }
                },
                child: const HomeScreen(),
              );
            }
            return const LoginScreen();
          },
        ),
      ),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:handly/core/controllers/app_bloc_observer.dart';
import 'package:handly/core/router/app_routers.dart';
import 'package:handly/features/auth/cubit/auth_cubit.dart';
import 'package:handly/features/auth/data/repositoryimpl/auth_repo_impl.dart';
import 'package:handly/features/auth/presentation/login/login_screen.dart';
import 'package:handly/features/cart/logic/cart_cubit.dart';
import 'package:handly/features/category/data/category_repository_impl.dart';
import 'package:handly/features/category/domain/usecases/get_all_categories.dart';
import 'package:handly/features/category/presentation/cubit/category_cubit.dart';
import 'package:handly/features/home/Presentation/home_screen.dart';
import 'package:handly/features/product/data/product_repository_impl.dart';
import 'package:handly/features/product/domain/usecases/create_product.dart';
import 'package:handly/features/product/domain/usecases/delete_product.dart';
import 'package:handly/features/product/domain/usecases/get_products_by_category.dart';
import 'package:handly/features/product/domain/usecases/get_user_products.dart';
import 'package:handly/features/product/presentation/cubit/product_cubit.dart';
import 'package:handly/firebase_options.dart';
import 'package:handly/generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = const AppBlocObserver();

  final authRepo = AuthRepoImpl();
  final categoryRepo = CategoryRepositoryImpl();
  final productRepo = ProductRepositoryImpl();

  final authCubit = AuthCubit(authRepo);
  await authCubit.checkAuthStatus(); // <- make sure auth state is ready before app builds

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => authCubit),
        BlocProvider(
          create:
              (_) =>
                  CategoryCubit(GetAllCategories(categoryRepo))
                    ..getCategories(),
        ),
        BlocProvider(
          create:
              (_) => ProductCubit(
                createProduct: CreateProduct(productRepo),
                deleteProduct: DeleteProduct(productRepo),
                getProductsByCategory: GetProductsByCategory(productRepo),
                getUserProducts: GetUserProducts(productRepo),
              ),
        ),
        BlocProvider(create: (_) => CartCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          if (state.status == AuthStatus.success) {
            return const HomeScreen();
          }
          return const LoginScreen();
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handly/core/router/not_found_page.dart';
import 'package:handly/core/router/routers.dart';
import 'package:handly/features/auth/cubit/auth_cubit.dart';
import 'package:handly/features/auth/data/repositoryimpl/auth_repo_impl.dart';
import 'package:handly/features/auth/presentation/forget/confirm/confirm_screen.dart';
import 'package:handly/features/auth/presentation/forget/forget_pass_screen.dart';
import 'package:handly/features/auth/presentation/init_screen.dart';
import 'package:handly/features/auth/presentation/login/login_screen.dart';
import 'package:handly/features/auth/presentation/register/register_screen.dart';
import 'package:handly/features/cart/data/cart_item.dart';
import 'package:handly/features/cart/presentation/cart_screen.dart';
import 'package:handly/features/checkout/logic/checkout_cubit.dart';
import 'package:handly/features/checkout/presentation/screen/checkout_screen.dart';
import 'package:handly/features/checkout/presentation/screen/order_confirmation_screen.dart';
import 'package:handly/features/home/Presentation/home_screen.dart';
import 'package:handly/features/product/data/product.dart';
import 'package:handly/features/product/data/seller.dart';
import 'package:handly/features/product/presentation/product_info_screen.dart';
import 'package:handly/features/seller/presentation/seller_profile_screen.dart';

class AppRouters {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routers.initial:
        return _buildRoute(settings, const InitScreen());
      case Routers.login:
        return _buildRoute(
          settings,
          BlocProvider(
            create: (_) => AuthCubit(AuthRepoImpl()),
            child: const LoginScreen(),
          ),
        );
      case Routers.register:
        return _buildRoute(
          settings,
          BlocProvider(
            create: (_) => AuthCubit(AuthRepoImpl()),
            child: const RegisterScreen(),
          ),
        );
      case Routers.forgetPassword:
        return _buildRoute(
          settings,
          BlocProvider(
            create: (_) => AuthCubit(AuthRepoImpl()),
            child: const ForgetPassScreen(),
          ),
        );
      case Routers.confrimSendEmail:
        return _buildRoute(settings, const ConfirmScreen());
      case Routers.home:
        return _buildRoute(settings, const HomeScreen());
      case Routers.productDetails:
        final product = settings.arguments as Product;
        return _buildRoute(settings, ProductInfoScreen(product: product));
      case Routers.cart:
        return _buildRoute(settings, CartScreen());
      case Routers.checkout:
        final args = settings.arguments as Map<String, dynamic>;
        final cartItems = args['cartItems'] as List<CartItem>;
        final subtotal = args['subtotal'] as double;
        return _buildRoute(
          settings,
          BlocProvider(
            create: (context) => CheckoutCubit(subtotal, cartItems),
            child: CheckoutScreen(cartItems: cartItems, subtotal: subtotal),
          ),
        );
      case Routers.checkoutSuccess:
        return _buildRoute(settings, const OrderConfirmationScreen());
      case Routers.userProfile:
        final seller = settings.arguments as Seller;
        return _buildRoute(settings, SellerProfileScreen(seller: seller));
      default:
        return _buildRoute(settings, NotFoundPage());
    }
  }

  MaterialPageRoute _buildRoute(RouteSettings settings, Widget screen) {
    return MaterialPageRoute(settings: settings, builder: (_) => screen);
  }
}

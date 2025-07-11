import 'package:flutter/material.dart';
import 'package:handly/core/router/not_found_page.dart';
import 'package:handly/core/router/routers.dart';
import 'package:handly/features/auth/domain/models/user.dart';
import 'package:handly/features/auth/presentation/forget/confirm/confirm_screen.dart';
import 'package:handly/features/auth/presentation/forget/forget_pass_screen.dart';
import 'package:handly/features/auth/presentation/init_screen.dart';
import 'package:handly/features/auth/presentation/login/login_screen.dart';
import 'package:handly/features/auth/presentation/register/register_screen.dart';
import 'package:handly/features/auth/presentation/user_profile_screen.dart';
import 'package:handly/features/cart/domain/models/cart_item.dart';
import 'package:handly/features/cart/presentation/cart_screen.dart';
import 'package:handly/features/checkout/presentation/screen/checkout_screen.dart';
import 'package:handly/features/checkout/presentation/screen/order_confirmation_screen.dart';
import 'package:handly/features/home/Presentation/home_screen.dart';
import 'package:handly/features/product/domain/models/product.dart';
import 'package:handly/features/product/presentation/screen/product_detail_screen.dart';
import 'package:handly/features/seller/presentation/seller_profile_screen.dart';

class AppRouters {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routers.initial:
        return _buildRoute(settings, const InitScreen());
      case Routers.login:
        return _buildRoute(settings, const LoginScreen());
      case Routers.register:
        return _buildRoute(settings, const RegisterScreen());
      case Routers.forgetPassword:
        return _buildRoute(settings, const ForgetPassScreen());
      case Routers.confrimSendEmail:
        return _buildRoute(settings, const ConfirmScreen());
      case Routers.home:
        return _buildRoute(settings, const HomeScreen());
      case Routers.profile:
        return _buildRoute(settings, const UserProfileScreen());
      case Routers.productDetails:
        final product = settings.arguments as Product;
        return _buildRoute(settings, ProductDetailScreen(product: product));
      case Routers.cart:
        return _buildRoute(settings, const CartScreen());
      case Routers.checkout:
        final args = settings.arguments as Map<String, dynamic>;
        final cartItems = args['cartItems'] as List<CartItem>;
        final subtotal = args['subtotal'] as double;
        return _buildRoute(
          settings,
          CheckoutScreen(cartItems: cartItems, subtotal: subtotal),
        );
      case Routers.checkoutSuccess:
        return _buildRoute(settings, const OrderConfirmationScreen());
      case Routers.userProfile:
        final seller = settings.arguments as User;
        return _buildRoute(settings, SellerProfileScreen(seller: seller));
      default:
        return _buildRoute(settings, const NotFoundPage());
    }
  }

  MaterialPageRoute _buildRoute(RouteSettings settings, Widget screen) {
    return MaterialPageRoute(settings: settings, builder: (_) => screen);
  }
}

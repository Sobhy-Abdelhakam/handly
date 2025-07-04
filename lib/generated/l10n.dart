// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Handly`
  String get title {
    return Intl.message('Handly', name: 'title', desc: '', args: []);
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `Page Not Found!`
  String get page_not_found {
    return Intl.message(
      'Page Not Found!',
      name: 'page_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Celebrate the art of craftsmanship. Discover, shop, and support handmade creations made with passion — each piece tells a story.`
  String get description {
    return Intl.message(
      'Celebrate the art of craftsmanship. Discover, shop, and support handmade creations made with passion — each piece tells a story.',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back`
  String get welcome_back {
    return Intl.message(
      'Welcome Back',
      name: 'welcome_back',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Name is required`
  String get name_required {
    return Intl.message(
      'Name is required',
      name: 'name_required',
      desc: '',
      args: [],
    );
  }

  /// `Name must contain only letters and spaces`
  String get name_only_letters {
    return Intl.message(
      'Name must contain only letters and spaces',
      name: 'name_only_letters',
      desc: '',
      args: [],
    );
  }

  /// `Name must be at least 3 characters`
  String get name_min_length {
    return Intl.message(
      'Name must be at least 3 characters',
      name: 'name_min_length',
      desc: '',
      args: [],
    );
  }

  /// `Email is required`
  String get email_required {
    return Intl.message(
      'Email is required',
      name: 'email_required',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get password_required {
    return Intl.message(
      'Password is required',
      name: 'password_required',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgot_password {
    return Intl.message(
      'Forgot Password?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Forget password`
  String get forget_pass_title {
    return Intl.message(
      'Forget password',
      name: 'forget_pass_title',
      desc: '',
      args: [],
    );
  }

  /// `Don’t worry sometimes people can forget too, enter your email and we will send you a password reset link.`
  String get forget_pass_sup_title {
    return Intl.message(
      'Don’t worry sometimes people can forget too, enter your email and we will send you a password reset link.',
      name: 'forget_pass_sup_title',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message('Send', name: 'send', desc: '', args: []);
  }

  /// `Password Reset Email Sent`
  String get confirm_screen_title {
    return Intl.message(
      'Password Reset Email Sent',
      name: 'confirm_screen_title',
      desc: '',
      args: [],
    );
  }

  /// `Your Account Security is Our Priority! We've Sent You a Secure Link to Safely Change Your Password and Keep Your Account Protected.`
  String get confirm_screen_sub_title {
    return Intl.message(
      'Your Account Security is Our Priority! We\'ve Sent You a Secure Link to Safely Change Your Password and Keep Your Account Protected.',
      name: 'confirm_screen_sub_title',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email format`
  String get invalid_email {
    return Intl.message(
      'Invalid email format',
      name: 'invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters`
  String get password_min_length {
    return Intl.message(
      'Password must be at least 6 characters',
      name: 'password_min_length',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Already have an account?`
  String get already_have_account {
    return Intl.message(
      'Already have an account?',
      name: 'already_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dont_have_account {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dont_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Login successful`
  String get login_success {
    return Intl.message(
      'Login successful',
      name: 'login_success',
      desc: '',
      args: [],
    );
  }

  /// `Login faild, please try again`
  String get login_failed {
    return Intl.message(
      'Login faild, please try again',
      name: 'login_failed',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message('Done', name: 'done', desc: '', args: []);
  }

  /// `Good day for shopping`
  String get good_day {
    return Intl.message(
      'Good day for shopping',
      name: 'good_day',
      desc: '',
      args: [],
    );
  }

  /// `Sobhy Abdel Hakam`
  String get user_name {
    return Intl.message(
      'Sobhy Abdel Hakam',
      name: 'user_name',
      desc: '',
      args: [],
    );
  }

  /// `search for handmade`
  String get search_hint {
    return Intl.message(
      'search for handmade',
      name: 'search_hint',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get Categories {
    return Intl.message('Categories', name: 'Categories', desc: '', args: []);
  }

  /// `View All`
  String get view_all {
    return Intl.message('View All', name: 'view_all', desc: '', args: []);
  }

  /// `Follow`
  String get follow {
    return Intl.message('Follow', name: 'follow', desc: '', args: []);
  }

  /// `Add to Cart`
  String get add_to_cart {
    return Intl.message('Add to Cart', name: 'add_to_cart', desc: '', args: []);
  }

  /// `Added to Cart`
  String get added_to_cart {
    return Intl.message(
      'Added to Cart',
      name: 'added_to_cart',
      desc: '',
      args: [],
    );
  }

  /// `My Cart`
  String get my_cart {
    return Intl.message('My Cart', name: 'my_cart', desc: '', args: []);
  }

  /// `Your cart is empty`
  String get cart_empty {
    return Intl.message(
      'Your cart is empty',
      name: 'cart_empty',
      desc: '',
      args: [],
    );
  }

  /// `Remove Item`
  String get remove_Item {
    return Intl.message('Remove Item', name: 'remove_Item', desc: '', args: []);
  }

  /// `Are you sure you want to remove this item from the cart?`
  String get remove_item_confirmation {
    return Intl.message(
      'Are you sure you want to remove this item from the cart?',
      name: 'remove_item_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Removed`
  String get removed {
    return Intl.message('Removed', name: 'removed', desc: '', args: []);
  }

  /// `Undo`
  String get undo {
    return Intl.message('Undo', name: 'undo', desc: '', args: []);
  }

  /// `Cart Total`
  String get cart_total {
    return Intl.message('Cart Total', name: 'cart_total', desc: '', args: []);
  }

  /// `Checkout`
  String get Checkout {
    return Intl.message('Checkout', name: 'Checkout', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

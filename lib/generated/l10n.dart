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
  String get checkout {
    return Intl.message('Checkout', name: 'checkout', desc: '', args: []);
  }

  /// `Your Cart`
  String get your_cart {
    return Intl.message('Your Cart', name: 'your_cart', desc: '', args: []);
  }

  /// `Delivery Option`
  String get delivery_option {
    return Intl.message(
      'Delivery Option',
      name: 'delivery_option',
      desc: '',
      args: [],
    );
  }

  /// `Home Delivery`
  String get home_delivery {
    return Intl.message(
      'Home Delivery',
      name: 'home_delivery',
      desc: '',
      args: [],
    );
  }

  /// `In-Store Pickup`
  String get in_store_pickup {
    return Intl.message(
      'In-Store Pickup',
      name: 'in_store_pickup',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get payment_method {
    return Intl.message(
      'Payment Method',
      name: 'payment_method',
      desc: '',
      args: [],
    );
  }

  /// `Credit Card Details`
  String get credit_card_details {
    return Intl.message(
      'Credit Card Details',
      name: 'credit_card_details',
      desc: '',
      args: [],
    );
  }

  /// `Cardholder Name`
  String get cardholder_name {
    return Intl.message(
      'Cardholder Name',
      name: 'cardholder_name',
      desc: '',
      args: [],
    );
  }

  /// `Card Number`
  String get card_number {
    return Intl.message('Card Number', name: 'card_number', desc: '', args: []);
  }

  /// `Expiry (MM/YY)`
  String get expiry_date {
    return Intl.message(
      'Expiry (MM/YY)',
      name: 'expiry_date',
      desc: '',
      args: [],
    );
  }

  /// `CVV`
  String get cvv {
    return Intl.message('CVV', name: 'cvv', desc: '', args: []);
  }

  /// `Vodafone Cash`
  String get vodafone_cash_title {
    return Intl.message(
      'Vodafone Cash',
      name: 'vodafone_cash_title',
      desc: '',
      args: [],
    );
  }

  /// `Vodafone Number`
  String get vodafone_number {
    return Intl.message(
      'Vodafone Number',
      name: 'vodafone_number',
      desc: '',
      args: [],
    );
  }

  /// `Order Summary`
  String get order_summary {
    return Intl.message(
      'Order Summary',
      name: 'order_summary',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal`
  String get subtotal {
    return Intl.message('Subtotal', name: 'subtotal', desc: '', args: []);
  }

  /// `Delivery Fee`
  String get delivery_fee {
    return Intl.message(
      'Delivery Fee',
      name: 'delivery_fee',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message('Total', name: 'total', desc: '', args: []);
  }

  /// `Place Order`
  String get place_order {
    return Intl.message('Place Order', name: 'place_order', desc: '', args: []);
  }

  /// `Loading...`
  String get loading {
    return Intl.message('Loading...', name: 'loading', desc: '', args: []);
  }

  /// `Required`
  String get required_field {
    return Intl.message('Required', name: 'required_field', desc: '', args: []);
  }

  /// `Invalid phone number`
  String get invalid_phone {
    return Intl.message(
      'Invalid phone number',
      name: 'invalid_phone',
      desc: '',
      args: [],
    );
  }

  /// `Please select delivery and payment options`
  String get select_delivery_payment_error {
    return Intl.message(
      'Please select delivery and payment options',
      name: 'select_delivery_payment_error',
      desc: '',
      args: [],
    );
  }

  /// `Please fill all required fields correctly.`
  String get fill_required_fields_error {
    return Intl.message(
      'Please fill all required fields correctly.',
      name: 'fill_required_fields_error',
      desc: '',
      args: [],
    );
  }

  /// `Cash on Delivery`
  String get cash_on_delivery {
    return Intl.message(
      'Cash on Delivery',
      name: 'cash_on_delivery',
      desc: '',
      args: [],
    );
  }

  /// `Credit Card`
  String get credit_card {
    return Intl.message('Credit Card', name: 'credit_card', desc: '', args: []);
  }

  /// `Vodafone Cash`
  String get vodafone_cash {
    return Intl.message(
      'Vodafone Cash',
      name: 'vodafone_cash',
      desc: '',
      args: [],
    );
  }

  /// `Order Confirmed`
  String get order_confirmation {
    return Intl.message(
      'Order Confirmed',
      name: 'order_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Thank you for your order! Your order has been placed successfully.`
  String get order_confirmation_subtitle {
    return Intl.message(
      'Thank you for your order! Your order has been placed successfully.',
      name: 'order_confirmation_subtitle',
      desc: '',
      args: [],
    );
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

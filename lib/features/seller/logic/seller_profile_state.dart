import 'package:equatable/equatable.dart';
import 'package:handly/features/product/domain/models/product.dart';

abstract class SellerProfileState extends Equatable {
  const SellerProfileState();

  @override
  List<Object> get props => [];
}

class SellerProfileInitial extends SellerProfileState {}

class SellerProfileLoading extends SellerProfileState {}

class SellerProfileSuccess extends SellerProfileState {
  final List<Product> products;

  const SellerProfileSuccess(this.products);

  @override
  List<Object> get props => [products];
}

class SellerProfileFailure extends SellerProfileState {
  final String message;

  const SellerProfileFailure(this.message);

  @override
  List<Object> get props => [message];
}

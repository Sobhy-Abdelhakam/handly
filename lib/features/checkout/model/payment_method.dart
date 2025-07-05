import 'package:equatable/equatable.dart';

abstract class PaymentMethod extends Equatable {
  final String name;
  final String icon;
  const PaymentMethod({required this.name, required this.icon});
  @override
  List<Object?> get props => [name, icon];
}

class CashOnDelivery extends PaymentMethod {
  const CashOnDelivery()
    : super(name: 'Cash on Delivery', icon: 'assets/icons/payment/cash.png');
}

class CreditCard extends PaymentMethod {
  const CreditCard()
    : super(name: 'Credit Card', icon: 'assets/icons/payment/visa.png');
}

class VodafoneCash extends PaymentMethod {
  const VodafoneCash()
    : super(
        name: 'Vodafone Cash',
        icon: 'assets/icons/payment/digital-wallet.png',
      );
}

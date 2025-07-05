import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:handly/generated/l10n.dart';

abstract class PaymentMethod extends Equatable {
  const PaymentMethod();

  String localizedName(BuildContext context);
  String get icon;

  @override
  List<Object?> get props => [runtimeType];
}

class CashOnDelivery extends PaymentMethod {
  const CashOnDelivery();

  @override
  String get icon => 'assets/icons/payment/cash.png';

  @override
  String localizedName(BuildContext context) => S.of(context).cash_on_delivery;
}

class CreditCard extends PaymentMethod {
  const CreditCard();

  @override
  String get icon => 'assets/icons/payment/visa.png';

  @override
  String localizedName(BuildContext context) => S.of(context).credit_card;
}

class VodafoneCash extends PaymentMethod {
  const VodafoneCash();

  @override
  String get icon => 'assets/icons/payment/digital-wallet.png';

  @override
  String localizedName(BuildContext context) => S.of(context).vodafone_cash;
}

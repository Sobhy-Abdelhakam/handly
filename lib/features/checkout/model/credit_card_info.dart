import 'package:equatable/equatable.dart';

class CreditCardInfo extends Equatable {
  final String cardNumber;
  final String expiryDate;
  final String cvv;
  final String holderName;

  const CreditCardInfo({
    required this.cardNumber,
    required this.expiryDate,
    required this.cvv,
    required this.holderName,
  });

  @override
  List<Object?> get props => [cardNumber, expiryDate, cvv, holderName];
}

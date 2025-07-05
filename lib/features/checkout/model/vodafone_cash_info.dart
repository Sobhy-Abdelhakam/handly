import 'package:equatable/equatable.dart';

class VodafoneCashInfo extends Equatable {
  final String phoneNumber;

  const VodafoneCashInfo({required this.phoneNumber});

  @override
  List<Object?> get props => [phoneNumber];
}

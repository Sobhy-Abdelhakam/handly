import 'package:flutter/widgets.dart';
import 'package:handly/generated/l10n.dart';

enum DeliveryOption {
  homeDelivery,
  inStorePickup,
}

extension DeliveryOptionExtension on DeliveryOption {
  String localizedName(BuildContext context) {
    final s = S.of(context);
    switch (this) {
      case DeliveryOption.homeDelivery:
        return s.home_delivery;
      case DeliveryOption.inStorePickup:
        return s.in_store_pickup;
    }
  }
}

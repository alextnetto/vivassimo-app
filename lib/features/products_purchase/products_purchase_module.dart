import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/core/shared_modules/credit_card/presentation/stores/delete_payment_method_store.dart';
import 'package:my_app/core/shared_modules/credit_card/presentation/stores/payment_method_store.dart';
import 'package:my_app/features/products_purchase/presentation/stores/delete_delivery_address_store.dart';
import 'package:my_app/features/products_purchase/presentation/stores/delivery_address_store.dart';
import 'package:my_app/features/products_purchase/presentation/stores/new_delivery_address_store.dart';
import 'package:my_app/features/products_purchase/presentation/stores/shipping_method_store.dart';
import 'package:my_app/core/shared_modules/credit_card/presentation/stores/new_credit_card_store.dart';

class ProductsPurchaseModule extends Module {
  @override
  List<Bind> get binds {
    return [
      Bind.factory((i) => DeliveryAddressStore()),
      Bind.factory((i) => DeleteDeliveryAddressStore()),
      Bind.factory((i) => NewDeliveryAddressStore()),
      Bind.factory((i) => ShippingMethodStore()),
      Bind.factory((i) => PaymentMethodStore()),
      Bind.factory((i) => DeletePaymentMethodStore()),
      Bind.factory((i) => NewCreditCardStore()),
    ];
  }
}
